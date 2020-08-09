## Perl tricks for system administrators
Did you know that Perl is a great programming language for system administrators? Perl is platform-independent so you can do things on different operating systems without rewriting your scripts. Scripting in Perl is quick and easy, and its portability makes your scripts amazingly useful. Here are a few examples, just to get your creative juices flowing!
Renaming a bunch of files

Suppose you need to rename a whole bunch of files in a directory. In this case, we've got a directory full of .xml files, and we want to rename them all to .html. Easy-peasy!
```perl
#!/usr/bin/perl
use strict;
use warnings;

foreach my $file (glob "*.xml") {
    my $new = substr($file, 0, -3) . "html";
    rename $file, $new;
}
```

Then just cd to the directory where you need to make the change, and run the script. You could put this in a cron job, if you needed to run it regularly, and it is easily enhanced to accept parameters.

Speaking of accepting parameters, let's take a look at a script that does just that.
Creating a Linux user account

Suppose you need to regularly create Linux user accounts on your system, and the format of the username is first initial/last name, as is common in many businesses. (This is, of course, a good idea, until you get John Smith and Jane Smith working at the same company—or want John to have two accounts, as he works part-time in two different departments. But humor me, okay?) Each user account needs to be in a group based on their department, and home directories are of the format /home/<department>/<username>. Let's take a look at a script to do that:
```perl
#!/usr/bin/env perl
use strict;
use warnings;

my $adduser = '/usr/sbin/adduser';

use Getopt::Long qw(GetOptions);

# If the user calls the script with no parameters, 
# give them help!

if (not @ARGV) {
    usage();
}

# Gather our options; if they specify any undefined option, 
# they'll get sent some help!

my %opts;
GetOptions(\%opts,
    'fname=s',
    'lname=s',
    'dept=s',
    'run',
) or usage();

# Let's validate our inputs. All three parameters are 
# required, and must be alphabetic.
# You could be clever, and do this with a foreach loop, 
# but let's keep it simple for now.

if (not $opts{fname} or $opts{fname} !~ /^[a-zA-Z]+$/) {
    usage("First name must be alphabetic");
}
if (not $opts{lname} or $opts{lname} !~ /^[a-zA-Z]+$/) {
    usage("Last name must be alphabetic");
}
if (not $opts{dept} or $opts{dept} !~ /^[a-zA-Z]+$/) {
    usage("Department must be alphabetic");
}

# Construct the username and home directory

my $username = lc( substr($opts{fname}, 0, 1) . $opts{lname});
my $home     = "/home/$opts{dept}/$username";

# Show them what we've got ready to go.

print "Name:           $opts{fname} $opts{lname}\n";
print "Username:       $username\n";
print "Department:     $opts{dept}\n";
print "Home directory: $home\n\n";

# use qq() here, so that the quotes in the --gecos flag
# get carried into the command!

my $cmd = qq($adduser --home $home --ingroup $opts{dept} \\
--gecos "$opts{fname} $opts{lname}" $username);

print "$cmd\n";
if ($opts{run}) {
    system $cmd;
} else {
    print "You need to add the --run flag to actually execute\n";
}

sub usage {
    my ($msg) = @_;
    if ($msg) {
        print "$msg\n\n";
    }
    print "Usage: $0 --fname FirstName --lname LastName --dept Department --run\n";
    exit;
}
```

As with the previous script, there are opportunities for enhancement, but something like this might be all that you need for this task.

One more, just for fun!
Change copyright text in every Perl source file in a directory tree

Now we're going to try a mass edit. Suppose you've got a directory full of code, and each file has a copyright statement somewhere in it. (Rich Bowen wrote a great article, Copyright statements proliferate inside open source code a couple of years ago that discusses the wisdom of copyright statements in open source code. It is a good read, and I recommend it highly. But again, humor me.) You want to change that text in each and every file in the directory tree. File::Find and File::Slurp are your friends!

```perl
#!/usr/bin/perl
use strict;
use warnings;

use File::Find qw(find);
use File::Slurp qw(read_file write_file);

# If the user gives a directory name, use that. Otherwise, 
# use the current directory.

my $dir = $ARGV[0] || '.';

# File::Find::find is kind of dark-arts magic. 
# You give it a reference to some code, 
# and a directory to hunt in, and it will 
# execute that code  on every file in the 
# directory, and all subdirectories. In this 
# case, \&change_file is the reference 
# to our code, a subroutine.  You could, if 
# what you wanted to do was really short, 
# include it in a { } block instead. But doing 
# it this way is nice and readable.

find( \&change_file, $dir);
 
sub change_file {
    my $name= $_;

    # If the file is a directory, symlink, or other 
    # non-regular file, don't do anything

    if (not -f $name) {
        return;
    }
    # If it's not Perl, don't do anything.

    if (substr($name, -3) ne ".pl") {
        return;
    }
    print "$name\n";

    # Gobble up the file, complete with carriage
    # returns and everything. 
    # Be wary of this if you have very large files
    # on a system with limited memory!

    my $data = read_file($name);

    # Use a regex to make the change. If the string appears 
    # more than once, this will change it everywhere!

    $data =~ s/Copyright Old/Copyright New/g;

    # Let's not ruin our original files

    my $backup = "$name.bak";
    rename $name, $backup; 
    write_file($name, $data);

    return;
}
```

Because of Perl's portability, you could use this script on a Windows system as well as a Linux system—it Just Works because of the underlying Perl interpreter code. In our create-an-account code above, that one is not portable, but is Linux-specific because it uses Linux commands such as adduser.

In my experience, I've found it useful to have a Git repository of these things somewhere that I can clone on each new system I'm working with. Over time, you'll think of changes to make to the code to enhance the capabilities, or you'll add new scripts, and Git can help you make sure that all your tools and tricks are available on all your systems.

I hope these little scripts have given you some ideas how you can use Perl to make your system administration life a little easier. In addition to these longer scripts, take a look at a fantastic list of Perl one-liners, and links to other Perl magic assembled by Mischa Peterson.

