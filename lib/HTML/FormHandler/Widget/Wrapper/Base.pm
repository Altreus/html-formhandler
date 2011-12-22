package HTML::FormHandler::Widget::Wrapper::Base;
# ABSTRACT: commong methods for widget wrappers

use Moose::Role;
use HTML::FormHandler::Render::Util ('process_attrs');

sub render_label {
    my $self = shift;
    my %attrs = %{$self->label_attr};
    $attrs{class} = 'label' if ( scalar( keys %attrs ) == 0 ); # old behavior
    my $attrs = process_attrs(\%attrs);
    return "<label$attrs for=\"" . $self->id . '">' . $self->html_filter($self->loc_label) . ': </label>';
}

sub render_class {
    my ( $self, $result ) = @_;

    $result ||= $self->result;

    my %attr = %{$self->wrapper_attr};

    if( ! exists $attr{class} && $self->css_class ) {
        $attr{class} = $self->css_class;
    }
    if( $result->has_errors ) {
        if( ref $attr{class} eq 'ARRAY' ) {
            push @{$attr{class}}, 'error';
        }
        else {
            $attr{class} .= $attr{class} ? ' error' : 'error';
        }
    }
    my $output = process_attrs(\%attr);
    return $output;
}

use namespace::autoclean;
1;
