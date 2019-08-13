import React, {Component} from 'react';
import { Doughnut } from 'react-chartjs-2';

export default class MyChart extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <Doughnut data={this.props.data}/>
        );
    }
}