; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25498 () Bool)

(assert start!25498)

(declare-fun b!129165 () Bool)

(declare-fun e!85622 () Bool)

(declare-fun e!85616 () Bool)

(assert (=> b!129165 (= e!85622 e!85616)))

(declare-fun res!106945 () Bool)

(assert (=> b!129165 (=> (not res!106945) (not e!85616))))

(declare-datatypes ((array!5983 0))(
  ( (array!5984 (arr!3324 (Array (_ BitVec 32) (_ BitVec 8))) (size!2707 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4678 0))(
  ( (BitStream!4679 (buf!3065 array!5983) (currentByte!5826 (_ BitVec 32)) (currentBit!5821 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8019 0))(
  ( (Unit!8020) )
))
(declare-datatypes ((tuple2!11014 0))(
  ( (tuple2!11015 (_1!5804 Unit!8019) (_2!5804 BitStream!4678)) )
))
(declare-fun lt!199822 () tuple2!11014)

(declare-fun lt!199832 () (_ BitVec 64))

(declare-fun lt!199824 () tuple2!11014)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129165 (= res!106945 (= (bitIndex!0 (size!2707 (buf!3065 (_2!5804 lt!199824))) (currentByte!5826 (_2!5804 lt!199824)) (currentBit!5821 (_2!5804 lt!199824))) (bvadd (bitIndex!0 (size!2707 (buf!3065 (_2!5804 lt!199822))) (currentByte!5826 (_2!5804 lt!199822)) (currentBit!5821 (_2!5804 lt!199822))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!199832))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!129165 (= lt!199832 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129166 () Bool)

(declare-fun res!106949 () Bool)

(declare-fun e!85615 () Bool)

(assert (=> b!129166 (=> (not res!106949) (not e!85615))))

(declare-fun thiss!1634 () BitStream!4678)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129166 (= res!106949 (invariant!0 (currentBit!5821 thiss!1634) (currentByte!5826 thiss!1634) (size!2707 (buf!3065 thiss!1634))))))

(declare-fun b!129167 () Bool)

(declare-fun res!106942 () Bool)

(assert (=> b!129167 (=> (not res!106942) (not e!85615))))

(assert (=> b!129167 (= res!106942 (bvslt from!447 to!404))))

(declare-fun b!129168 () Bool)

(assert (=> b!129168 (= e!85615 (not true))))

(declare-fun lt!199826 () Bool)

(declare-fun isPrefixOf!0 (BitStream!4678 BitStream!4678) Bool)

(assert (=> b!129168 (= lt!199826 (isPrefixOf!0 (_2!5804 lt!199822) (_2!5804 lt!199824)))))

(declare-fun lt!199831 () Bool)

(assert (=> b!129168 (= lt!199831 (isPrefixOf!0 thiss!1634 (_2!5804 lt!199822)))))

(assert (=> b!129168 e!85622))

(declare-fun res!106947 () Bool)

(assert (=> b!129168 (=> (not res!106947) (not e!85622))))

(assert (=> b!129168 (= res!106947 (= (size!2707 (buf!3065 (_2!5804 lt!199822))) (size!2707 (buf!3065 (_2!5804 lt!199824)))))))

(declare-fun arr!237 () array!5983)

(declare-fun appendByteArrayLoop!0 (BitStream!4678 array!5983 (_ BitVec 32) (_ BitVec 32)) tuple2!11014)

(assert (=> b!129168 (= lt!199824 (appendByteArrayLoop!0 (_2!5804 lt!199822) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129168 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2707 (buf!3065 (_2!5804 lt!199822)))) ((_ sign_extend 32) (currentByte!5826 (_2!5804 lt!199822))) ((_ sign_extend 32) (currentBit!5821 (_2!5804 lt!199822))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199825 () Unit!8019)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4678 BitStream!4678 (_ BitVec 64) (_ BitVec 32)) Unit!8019)

(assert (=> b!129168 (= lt!199825 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5804 lt!199822) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!85619 () Bool)

(assert (=> b!129168 e!85619))

(declare-fun res!106951 () Bool)

(assert (=> b!129168 (=> (not res!106951) (not e!85619))))

(assert (=> b!129168 (= res!106951 (= (size!2707 (buf!3065 thiss!1634)) (size!2707 (buf!3065 (_2!5804 lt!199822)))))))

(declare-fun appendByte!0 (BitStream!4678 (_ BitVec 8)) tuple2!11014)

(assert (=> b!129168 (= lt!199822 (appendByte!0 thiss!1634 (select (arr!3324 arr!237) from!447)))))

(declare-fun res!106948 () Bool)

(assert (=> start!25498 (=> (not res!106948) (not e!85615))))

(assert (=> start!25498 (= res!106948 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2707 arr!237))))))

(assert (=> start!25498 e!85615))

(assert (=> start!25498 true))

(declare-fun array_inv!2496 (array!5983) Bool)

(assert (=> start!25498 (array_inv!2496 arr!237)))

(declare-fun e!85618 () Bool)

(declare-fun inv!12 (BitStream!4678) Bool)

(assert (=> start!25498 (and (inv!12 thiss!1634) e!85618)))

(declare-datatypes ((tuple2!11016 0))(
  ( (tuple2!11017 (_1!5805 BitStream!4678) (_2!5805 BitStream!4678)) )
))
(declare-fun lt!199823 () tuple2!11016)

(declare-datatypes ((tuple2!11018 0))(
  ( (tuple2!11019 (_1!5806 BitStream!4678) (_2!5806 (_ BitVec 8))) )
))
(declare-fun lt!199827 () tuple2!11018)

(declare-fun b!129169 () Bool)

(assert (=> b!129169 (= e!85619 (and (= (_2!5806 lt!199827) (select (arr!3324 arr!237) from!447)) (= (_1!5806 lt!199827) (_2!5805 lt!199823))))))

(declare-fun readBytePure!0 (BitStream!4678) tuple2!11018)

(assert (=> b!129169 (= lt!199827 (readBytePure!0 (_1!5805 lt!199823)))))

(declare-fun reader!0 (BitStream!4678 BitStream!4678) tuple2!11016)

(assert (=> b!129169 (= lt!199823 (reader!0 thiss!1634 (_2!5804 lt!199822)))))

(declare-fun b!129170 () Bool)

(declare-fun e!85620 () Bool)

(assert (=> b!129170 (= e!85616 (not e!85620))))

(declare-fun res!106950 () Bool)

(assert (=> b!129170 (=> res!106950 e!85620)))

(declare-datatypes ((tuple2!11020 0))(
  ( (tuple2!11021 (_1!5807 BitStream!4678) (_2!5807 array!5983)) )
))
(declare-fun lt!199828 () tuple2!11020)

(declare-fun lt!199829 () tuple2!11016)

(assert (=> b!129170 (= res!106950 (or (not (= (size!2707 (_2!5807 lt!199828)) (size!2707 arr!237))) (not (= (_1!5807 lt!199828) (_2!5805 lt!199829)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4678 array!5983 (_ BitVec 32) (_ BitVec 32)) tuple2!11020)

(assert (=> b!129170 (= lt!199828 (readByteArrayLoopPure!0 (_1!5805 lt!199829) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129170 (validate_offset_bits!1 ((_ sign_extend 32) (size!2707 (buf!3065 (_2!5804 lt!199824)))) ((_ sign_extend 32) (currentByte!5826 (_2!5804 lt!199822))) ((_ sign_extend 32) (currentBit!5821 (_2!5804 lt!199822))) lt!199832)))

(declare-fun lt!199830 () Unit!8019)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4678 array!5983 (_ BitVec 64)) Unit!8019)

(assert (=> b!129170 (= lt!199830 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5804 lt!199822) (buf!3065 (_2!5804 lt!199824)) lt!199832))))

(assert (=> b!129170 (= lt!199829 (reader!0 (_2!5804 lt!199822) (_2!5804 lt!199824)))))

(declare-fun b!129171 () Bool)

(assert (=> b!129171 (= e!85618 (array_inv!2496 (buf!3065 thiss!1634)))))

(declare-fun b!129172 () Bool)

(declare-fun res!106944 () Bool)

(assert (=> b!129172 (=> (not res!106944) (not e!85616))))

(assert (=> b!129172 (= res!106944 (isPrefixOf!0 (_2!5804 lt!199822) (_2!5804 lt!199824)))))

(declare-fun b!129173 () Bool)

(declare-fun res!106946 () Bool)

(assert (=> b!129173 (=> (not res!106946) (not e!85615))))

(assert (=> b!129173 (= res!106946 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2707 (buf!3065 thiss!1634))) ((_ sign_extend 32) (currentByte!5826 thiss!1634)) ((_ sign_extend 32) (currentBit!5821 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129174 () Bool)

(declare-fun res!106943 () Bool)

(assert (=> b!129174 (=> (not res!106943) (not e!85619))))

(assert (=> b!129174 (= res!106943 (= (bitIndex!0 (size!2707 (buf!3065 (_2!5804 lt!199822))) (currentByte!5826 (_2!5804 lt!199822)) (currentBit!5821 (_2!5804 lt!199822))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2707 (buf!3065 thiss!1634)) (currentByte!5826 thiss!1634) (currentBit!5821 thiss!1634)))))))

(declare-fun b!129175 () Bool)

(declare-fun res!106941 () Bool)

(assert (=> b!129175 (=> (not res!106941) (not e!85619))))

(assert (=> b!129175 (= res!106941 (isPrefixOf!0 thiss!1634 (_2!5804 lt!199822)))))

(declare-fun b!129176 () Bool)

(declare-fun arrayRangesEq!110 (array!5983 array!5983 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129176 (= e!85620 (not (arrayRangesEq!110 arr!237 (_2!5807 lt!199828) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!25498 res!106948) b!129173))

(assert (= (and b!129173 res!106946) b!129167))

(assert (= (and b!129167 res!106942) b!129166))

(assert (= (and b!129166 res!106949) b!129168))

(assert (= (and b!129168 res!106951) b!129174))

(assert (= (and b!129174 res!106943) b!129175))

(assert (= (and b!129175 res!106941) b!129169))

(assert (= (and b!129168 res!106947) b!129165))

(assert (= (and b!129165 res!106945) b!129172))

(assert (= (and b!129172 res!106944) b!129170))

(assert (= (and b!129170 (not res!106950)) b!129176))

(assert (= start!25498 b!129171))

(declare-fun m!194953 () Bool)

(assert (=> start!25498 m!194953))

(declare-fun m!194955 () Bool)

(assert (=> start!25498 m!194955))

(declare-fun m!194957 () Bool)

(assert (=> b!129173 m!194957))

(declare-fun m!194959 () Bool)

(assert (=> b!129168 m!194959))

(declare-fun m!194961 () Bool)

(assert (=> b!129168 m!194961))

(declare-fun m!194963 () Bool)

(assert (=> b!129168 m!194963))

(declare-fun m!194965 () Bool)

(assert (=> b!129168 m!194965))

(declare-fun m!194967 () Bool)

(assert (=> b!129168 m!194967))

(declare-fun m!194969 () Bool)

(assert (=> b!129168 m!194969))

(declare-fun m!194971 () Bool)

(assert (=> b!129168 m!194971))

(assert (=> b!129168 m!194969))

(declare-fun m!194973 () Bool)

(assert (=> b!129174 m!194973))

(declare-fun m!194975 () Bool)

(assert (=> b!129174 m!194975))

(declare-fun m!194977 () Bool)

(assert (=> b!129176 m!194977))

(declare-fun m!194979 () Bool)

(assert (=> b!129171 m!194979))

(declare-fun m!194981 () Bool)

(assert (=> b!129170 m!194981))

(declare-fun m!194983 () Bool)

(assert (=> b!129170 m!194983))

(declare-fun m!194985 () Bool)

(assert (=> b!129170 m!194985))

(declare-fun m!194987 () Bool)

(assert (=> b!129170 m!194987))

(declare-fun m!194989 () Bool)

(assert (=> b!129166 m!194989))

(assert (=> b!129175 m!194961))

(assert (=> b!129169 m!194969))

(declare-fun m!194991 () Bool)

(assert (=> b!129169 m!194991))

(declare-fun m!194993 () Bool)

(assert (=> b!129169 m!194993))

(declare-fun m!194995 () Bool)

(assert (=> b!129165 m!194995))

(assert (=> b!129165 m!194973))

(assert (=> b!129172 m!194965))

(push 1)

(assert (not b!129169))

(assert (not start!25498))

(assert (not b!129171))

(assert (not b!129174))

(assert (not b!129166))

(assert (not b!129173))

(assert (not b!129168))

(assert (not b!129175))

(assert (not b!129165))

(assert (not b!129176))

(assert (not b!129170))

(assert (not b!129172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

