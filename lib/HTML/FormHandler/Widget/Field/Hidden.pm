package HTML::FormHandler::Widget::Field::Hidden;

use Moose::Role;

sub render
{
   my ( $self, $result ) = @_;

   $result ||= $self->result;
   my $output = "\n";
   $output .= '<input type="hidden" name="';
   $output .= $self->html_name . '"';
   $output .= ' id="' . $self->id . '"';
   $output .= ' value="' . $self->fif($result) . '" />';
   $output .= "\n";

   return $output;
}

1;
