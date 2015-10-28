class Link extends React.Component {
  render () {
    const title = this.props.title || this.props.url
    const date = moment(this.props.created_at).format('MMMM Do YYYY, h:mm:ss a');
    return (
      <article>
        <h3>
          <a href={ this.props.url } target='_blank'>{ title }</a>
          <p clasName='h4'> { date } </p>
        </h3>
      </article>
    )
  }
}
