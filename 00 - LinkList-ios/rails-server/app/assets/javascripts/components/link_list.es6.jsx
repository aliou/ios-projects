class LinkList extends React.Component {
  render () {
    const links = this.props.links.map(link => {
      return (<Link {...link} key={ link.id } />)
    })

    return (
      <div className='mt4'>
        <section>
          { links }
        </section>
      </div>
    );
  }
}
