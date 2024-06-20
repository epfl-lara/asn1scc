; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25654 () Bool)

(assert start!25654)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!130501 () Bool)

(declare-datatypes ((array!6034 0))(
  ( (array!6035 (arr!3354 (Array (_ BitVec 32) (_ BitVec 8))) (size!2731 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6034)

(declare-fun e!86480 () Bool)

(declare-datatypes ((BitStream!4726 0))(
  ( (BitStream!4727 (buf!3092 array!6034) (currentByte!5865 (_ BitVec 32)) (currentBit!5860 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11212 0))(
  ( (tuple2!11213 (_1!5906 BitStream!4726) (_2!5906 array!6034)) )
))
(declare-fun lt!201468 () tuple2!11212)

(declare-fun arrayRangesEq!134 (array!6034 array!6034 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130501 (= e!86480 (not (arrayRangesEq!134 arr!237 (_2!5906 lt!201468) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130502 () Bool)

(declare-fun e!86477 () Bool)

(declare-fun thiss!1634 () BitStream!4726)

(declare-fun array_inv!2520 (array!6034) Bool)

(assert (=> b!130502 (= e!86477 (array_inv!2520 (buf!3092 thiss!1634)))))

(declare-fun b!130503 () Bool)

(declare-fun e!86476 () Bool)

(declare-fun e!86474 () Bool)

(assert (=> b!130503 (= e!86476 e!86474)))

(declare-fun res!108182 () Bool)

(assert (=> b!130503 (=> (not res!108182) (not e!86474))))

(declare-fun lt!201472 () (_ BitVec 64))

(declare-datatypes ((Unit!8076 0))(
  ( (Unit!8077) )
))
(declare-datatypes ((tuple2!11214 0))(
  ( (tuple2!11215 (_1!5907 Unit!8076) (_2!5907 BitStream!4726)) )
))
(declare-fun lt!201471 () tuple2!11214)

(declare-fun lt!201465 () tuple2!11214)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130503 (= res!108182 (= (bitIndex!0 (size!2731 (buf!3092 (_2!5907 lt!201471))) (currentByte!5865 (_2!5907 lt!201471)) (currentBit!5860 (_2!5907 lt!201471))) (bvadd (bitIndex!0 (size!2731 (buf!3092 (_2!5907 lt!201465))) (currentByte!5865 (_2!5907 lt!201465)) (currentBit!5860 (_2!5907 lt!201465))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201472))))))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!130503 (= lt!201472 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130504 () Bool)

(declare-fun res!108176 () Bool)

(declare-fun e!86475 () Bool)

(assert (=> b!130504 (=> (not res!108176) (not e!86475))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130504 (= res!108176 (invariant!0 (currentBit!5860 thiss!1634) (currentByte!5865 thiss!1634) (size!2731 (buf!3092 thiss!1634))))))

(declare-fun b!130505 () Bool)

(declare-fun res!108175 () Bool)

(assert (=> b!130505 (=> (not res!108175) (not e!86474))))

(declare-fun isPrefixOf!0 (BitStream!4726 BitStream!4726) Bool)

(assert (=> b!130505 (= res!108175 (isPrefixOf!0 (_2!5907 lt!201465) (_2!5907 lt!201471)))))

(declare-fun b!130506 () Bool)

(declare-fun res!108177 () Bool)

(assert (=> b!130506 (=> (not res!108177) (not e!86475))))

(assert (=> b!130506 (= res!108177 (bvslt from!447 to!404))))

(declare-fun b!130507 () Bool)

(declare-fun e!86478 () Bool)

(declare-datatypes ((tuple2!11216 0))(
  ( (tuple2!11217 (_1!5908 BitStream!4726) (_2!5908 (_ BitVec 8))) )
))
(declare-fun lt!201476 () tuple2!11216)

(declare-fun lt!201469 () tuple2!11216)

(assert (=> b!130507 (= e!86478 (= (_2!5908 lt!201476) (_2!5908 lt!201469)))))

(declare-fun b!130508 () Bool)

(declare-fun res!108183 () Bool)

(declare-fun e!86483 () Bool)

(assert (=> b!130508 (=> (not res!108183) (not e!86483))))

(assert (=> b!130508 (= res!108183 (= (bitIndex!0 (size!2731 (buf!3092 (_2!5907 lt!201465))) (currentByte!5865 (_2!5907 lt!201465)) (currentBit!5860 (_2!5907 lt!201465))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2731 (buf!3092 thiss!1634)) (currentByte!5865 thiss!1634) (currentBit!5860 thiss!1634)))))))

(declare-fun b!130509 () Bool)

(declare-fun res!108185 () Bool)

(assert (=> b!130509 (=> (not res!108185) (not e!86483))))

(assert (=> b!130509 (= res!108185 (isPrefixOf!0 thiss!1634 (_2!5907 lt!201465)))))

(declare-fun b!130510 () Bool)

(assert (=> b!130510 (= e!86474 (not e!86480))))

(declare-fun res!108184 () Bool)

(assert (=> b!130510 (=> res!108184 e!86480)))

(declare-datatypes ((tuple2!11218 0))(
  ( (tuple2!11219 (_1!5909 BitStream!4726) (_2!5909 BitStream!4726)) )
))
(declare-fun lt!201466 () tuple2!11218)

(assert (=> b!130510 (= res!108184 (or (not (= (size!2731 (_2!5906 lt!201468)) (size!2731 arr!237))) (not (= (_1!5906 lt!201468) (_2!5909 lt!201466)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4726 array!6034 (_ BitVec 32) (_ BitVec 32)) tuple2!11212)

(assert (=> b!130510 (= lt!201468 (readByteArrayLoopPure!0 (_1!5909 lt!201466) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130510 (validate_offset_bits!1 ((_ sign_extend 32) (size!2731 (buf!3092 (_2!5907 lt!201471)))) ((_ sign_extend 32) (currentByte!5865 (_2!5907 lt!201465))) ((_ sign_extend 32) (currentBit!5860 (_2!5907 lt!201465))) lt!201472)))

(declare-fun lt!201461 () Unit!8076)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4726 array!6034 (_ BitVec 64)) Unit!8076)

(assert (=> b!130510 (= lt!201461 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5907 lt!201465) (buf!3092 (_2!5907 lt!201471)) lt!201472))))

(declare-fun reader!0 (BitStream!4726 BitStream!4726) tuple2!11218)

(assert (=> b!130510 (= lt!201466 (reader!0 (_2!5907 lt!201465) (_2!5907 lt!201471)))))

(declare-fun res!108179 () Bool)

(assert (=> start!25654 (=> (not res!108179) (not e!86475))))

(assert (=> start!25654 (= res!108179 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2731 arr!237))))))

(assert (=> start!25654 e!86475))

(assert (=> start!25654 true))

(assert (=> start!25654 (array_inv!2520 arr!237)))

(declare-fun inv!12 (BitStream!4726) Bool)

(assert (=> start!25654 (and (inv!12 thiss!1634) e!86477)))

(declare-fun b!130511 () Bool)

(declare-fun res!108178 () Bool)

(assert (=> b!130511 (=> (not res!108178) (not e!86475))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130511 (= res!108178 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2731 (buf!3092 thiss!1634))) ((_ sign_extend 32) (currentByte!5865 thiss!1634)) ((_ sign_extend 32) (currentBit!5860 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130512 () Bool)

(assert (=> b!130512 (= e!86475 (not true))))

(declare-fun lt!201475 () tuple2!11218)

(declare-fun readBytePure!0 (BitStream!4726) tuple2!11216)

(assert (=> b!130512 (= (_2!5908 (readBytePure!0 (_1!5909 lt!201475))) (select (arr!3354 arr!237) from!447))))

(declare-fun lt!201467 () tuple2!11218)

(assert (=> b!130512 (= lt!201467 (reader!0 (_2!5907 lt!201465) (_2!5907 lt!201471)))))

(assert (=> b!130512 (= lt!201475 (reader!0 thiss!1634 (_2!5907 lt!201471)))))

(assert (=> b!130512 e!86478))

(declare-fun res!108181 () Bool)

(assert (=> b!130512 (=> (not res!108181) (not e!86478))))

(assert (=> b!130512 (= res!108181 (= (bitIndex!0 (size!2731 (buf!3092 (_1!5908 lt!201476))) (currentByte!5865 (_1!5908 lt!201476)) (currentBit!5860 (_1!5908 lt!201476))) (bitIndex!0 (size!2731 (buf!3092 (_1!5908 lt!201469))) (currentByte!5865 (_1!5908 lt!201469)) (currentBit!5860 (_1!5908 lt!201469)))))))

(declare-fun lt!201463 () Unit!8076)

(declare-fun lt!201464 () BitStream!4726)

(declare-fun readBytePrefixLemma!0 (BitStream!4726 BitStream!4726) Unit!8076)

(assert (=> b!130512 (= lt!201463 (readBytePrefixLemma!0 lt!201464 (_2!5907 lt!201471)))))

(assert (=> b!130512 (= lt!201469 (readBytePure!0 (BitStream!4727 (buf!3092 (_2!5907 lt!201471)) (currentByte!5865 thiss!1634) (currentBit!5860 thiss!1634))))))

(assert (=> b!130512 (= lt!201476 (readBytePure!0 lt!201464))))

(assert (=> b!130512 (= lt!201464 (BitStream!4727 (buf!3092 (_2!5907 lt!201465)) (currentByte!5865 thiss!1634) (currentBit!5860 thiss!1634)))))

(declare-fun e!86482 () Bool)

(assert (=> b!130512 e!86482))

(declare-fun res!108187 () Bool)

(assert (=> b!130512 (=> (not res!108187) (not e!86482))))

(assert (=> b!130512 (= res!108187 (isPrefixOf!0 thiss!1634 (_2!5907 lt!201471)))))

(declare-fun lt!201470 () Unit!8076)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4726 BitStream!4726 BitStream!4726) Unit!8076)

(assert (=> b!130512 (= lt!201470 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5907 lt!201465) (_2!5907 lt!201471)))))

(assert (=> b!130512 e!86476))

(declare-fun res!108186 () Bool)

(assert (=> b!130512 (=> (not res!108186) (not e!86476))))

(assert (=> b!130512 (= res!108186 (= (size!2731 (buf!3092 (_2!5907 lt!201465))) (size!2731 (buf!3092 (_2!5907 lt!201471)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4726 array!6034 (_ BitVec 32) (_ BitVec 32)) tuple2!11214)

(assert (=> b!130512 (= lt!201471 (appendByteArrayLoop!0 (_2!5907 lt!201465) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130512 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2731 (buf!3092 (_2!5907 lt!201465)))) ((_ sign_extend 32) (currentByte!5865 (_2!5907 lt!201465))) ((_ sign_extend 32) (currentBit!5860 (_2!5907 lt!201465))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201474 () Unit!8076)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4726 BitStream!4726 (_ BitVec 64) (_ BitVec 32)) Unit!8076)

(assert (=> b!130512 (= lt!201474 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5907 lt!201465) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130512 e!86483))

(declare-fun res!108180 () Bool)

(assert (=> b!130512 (=> (not res!108180) (not e!86483))))

(assert (=> b!130512 (= res!108180 (= (size!2731 (buf!3092 thiss!1634)) (size!2731 (buf!3092 (_2!5907 lt!201465)))))))

(declare-fun appendByte!0 (BitStream!4726 (_ BitVec 8)) tuple2!11214)

(assert (=> b!130512 (= lt!201465 (appendByte!0 thiss!1634 (select (arr!3354 arr!237) from!447)))))

(declare-fun lt!201462 () tuple2!11216)

(declare-fun b!130513 () Bool)

(declare-fun lt!201473 () tuple2!11218)

(assert (=> b!130513 (= e!86483 (and (= (_2!5908 lt!201462) (select (arr!3354 arr!237) from!447)) (= (_1!5908 lt!201462) (_2!5909 lt!201473))))))

(assert (=> b!130513 (= lt!201462 (readBytePure!0 (_1!5909 lt!201473)))))

(assert (=> b!130513 (= lt!201473 (reader!0 thiss!1634 (_2!5907 lt!201465)))))

(declare-fun b!130514 () Bool)

(assert (=> b!130514 (= e!86482 (invariant!0 (currentBit!5860 thiss!1634) (currentByte!5865 thiss!1634) (size!2731 (buf!3092 (_2!5907 lt!201465)))))))

(assert (= (and start!25654 res!108179) b!130511))

(assert (= (and b!130511 res!108178) b!130506))

(assert (= (and b!130506 res!108177) b!130504))

(assert (= (and b!130504 res!108176) b!130512))

(assert (= (and b!130512 res!108180) b!130508))

(assert (= (and b!130508 res!108183) b!130509))

(assert (= (and b!130509 res!108185) b!130513))

(assert (= (and b!130512 res!108186) b!130503))

(assert (= (and b!130503 res!108182) b!130505))

(assert (= (and b!130505 res!108175) b!130510))

(assert (= (and b!130510 (not res!108184)) b!130501))

(assert (= (and b!130512 res!108187) b!130514))

(assert (= (and b!130512 res!108181) b!130507))

(assert (= start!25654 b!130502))

(declare-fun m!196837 () Bool)

(assert (=> b!130511 m!196837))

(declare-fun m!196839 () Bool)

(assert (=> b!130510 m!196839))

(declare-fun m!196841 () Bool)

(assert (=> b!130510 m!196841))

(declare-fun m!196843 () Bool)

(assert (=> b!130510 m!196843))

(declare-fun m!196845 () Bool)

(assert (=> b!130510 m!196845))

(declare-fun m!196847 () Bool)

(assert (=> b!130509 m!196847))

(declare-fun m!196849 () Bool)

(assert (=> b!130505 m!196849))

(declare-fun m!196851 () Bool)

(assert (=> b!130508 m!196851))

(declare-fun m!196853 () Bool)

(assert (=> b!130508 m!196853))

(declare-fun m!196855 () Bool)

(assert (=> b!130512 m!196855))

(declare-fun m!196857 () Bool)

(assert (=> b!130512 m!196857))

(declare-fun m!196859 () Bool)

(assert (=> b!130512 m!196859))

(declare-fun m!196861 () Bool)

(assert (=> b!130512 m!196861))

(declare-fun m!196863 () Bool)

(assert (=> b!130512 m!196863))

(declare-fun m!196865 () Bool)

(assert (=> b!130512 m!196865))

(assert (=> b!130512 m!196845))

(declare-fun m!196867 () Bool)

(assert (=> b!130512 m!196867))

(declare-fun m!196869 () Bool)

(assert (=> b!130512 m!196869))

(declare-fun m!196871 () Bool)

(assert (=> b!130512 m!196871))

(declare-fun m!196873 () Bool)

(assert (=> b!130512 m!196873))

(declare-fun m!196875 () Bool)

(assert (=> b!130512 m!196875))

(declare-fun m!196877 () Bool)

(assert (=> b!130512 m!196877))

(declare-fun m!196879 () Bool)

(assert (=> b!130512 m!196879))

(declare-fun m!196881 () Bool)

(assert (=> b!130512 m!196881))

(assert (=> b!130512 m!196867))

(declare-fun m!196883 () Bool)

(assert (=> b!130501 m!196883))

(declare-fun m!196885 () Bool)

(assert (=> start!25654 m!196885))

(declare-fun m!196887 () Bool)

(assert (=> start!25654 m!196887))

(declare-fun m!196889 () Bool)

(assert (=> b!130503 m!196889))

(assert (=> b!130503 m!196851))

(declare-fun m!196891 () Bool)

(assert (=> b!130514 m!196891))

(declare-fun m!196893 () Bool)

(assert (=> b!130504 m!196893))

(declare-fun m!196895 () Bool)

(assert (=> b!130502 m!196895))

(assert (=> b!130513 m!196867))

(declare-fun m!196897 () Bool)

(assert (=> b!130513 m!196897))

(declare-fun m!196899 () Bool)

(assert (=> b!130513 m!196899))

(push 1)

(assert (not b!130508))

(assert (not b!130510))

(assert (not b!130512))

(assert (not b!130509))

(assert (not b!130513))

(assert (not b!130511))

(assert (not start!25654))

(assert (not b!130514))

(assert (not b!130505))

(assert (not b!130502))

(assert (not b!130504))

(assert (not b!130501))

(assert (not b!130503))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

