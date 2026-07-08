import type { INodeType, INodeTypeDescription } from 'n8n-workflow';
import { chatFields, chatOperations } from './ChatDescription';
import { FIMFields, fimOperations } from './FIMDescription';

export class DeepSeekVn implements INodeType {
	description: INodeTypeDescription = {
		displayName: 'DeepSeek VN',
		name: 'deepSeekVn',
		icon: { light: 'file:DeepSeek.svg', dark: 'file:DeepSeek-dark.svg' },
		group: ['transform'],
		version: 1,
		subtitle: '={{$parameter["operation"] + ": " + $parameter["resource"]}}',
		description: 'Consume DeepSeek AI',
		defaults: {
			name: 'DeepSeek VN',
		},
		inputs: ['main'],
		outputs: ['main'],
		credentials: [
			{
				name: 'deepSeekVnApi',
				required: true,
			},
		],
		requestDefaults: {
			ignoreHttpStatusErrors: true,
			baseURL: 'https://api.deepseek.com',
		},
		properties: [
			{
				displayName: 'Resource',
				name: 'resource',
				type: 'options',
				noDataExpression: true,
				options: [
					{
						name: 'Chat',
						value: 'chat'
					},
					{
						name: 'FIM',
						value: 'fim'
					}
				],
				default: 'chat',
			},

			...chatOperations,
			...fimOperations,
			...chatFields,
			...FIMFields
		],
	};
}
