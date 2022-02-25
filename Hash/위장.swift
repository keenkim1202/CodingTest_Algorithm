/*
 - ����: ����
 - ��ũ: https://programmers.co.kr/learn/courses/30/lessons/42578
 - key: ��ųʸ� Ȱ�� & ���� �� �Դ� ��쵵 ����� ��
 */

import Foundation

func solution(_ clothes:[[String]]) -> Int {
  var dictionary: [String: [String]] = [:]
  
  // �ʸ����  ��ȸ�ϸ鼭 ��ųʸ� �� �߰�
  for c in clothes {
    let name = c[0]
    let type = c[1]
    
    if dictionary[type] == nil {
      dictionary[type] = [name]
    } else {
      dictionary[type]!.append(name)
    }
  }
  
  // ���������� �� ���� ���ϱ�
  let valuesCount = dictionary.mapValues{ $0.count }.values
  
  // �ּ� 1���� �����Ƿ� �ƹ��͵� ���� �ʴ� ��� ����
  return valuesCount.reduce(1) { $0 * ($1 + 1) } - 1
}