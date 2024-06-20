; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27792 () Bool)

(assert start!27792)

(declare-fun b!143248 () Bool)

(declare-fun res!119628 () Bool)

(declare-fun e!95412 () Bool)

(assert (=> b!143248 (=> (not res!119628) (not e!95412))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!143248 (= res!119628 (bvslt from!447 to!404))))

(declare-fun b!143249 () Bool)

(declare-fun res!119626 () Bool)

(declare-fun e!95419 () Bool)

(assert (=> b!143249 (=> (not res!119626) (not e!95419))))

(declare-datatypes ((array!6549 0))(
  ( (array!6550 (arr!3687 (Array (_ BitVec 32) (_ BitVec 8))) (size!2964 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5186 0))(
  ( (BitStream!5187 (buf!3393 array!6549) (currentByte!6277 (_ BitVec 32)) (currentBit!6272 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8928 0))(
  ( (Unit!8929) )
))
(declare-datatypes ((tuple2!12744 0))(
  ( (tuple2!12745 (_1!6713 Unit!8928) (_2!6713 BitStream!5186)) )
))
(declare-fun lt!222101 () tuple2!12744)

(declare-fun lt!222100 () tuple2!12744)

(declare-fun isPrefixOf!0 (BitStream!5186 BitStream!5186) Bool)

(assert (=> b!143249 (= res!119626 (isPrefixOf!0 (_2!6713 lt!222101) (_2!6713 lt!222100)))))

(declare-fun b!143250 () Bool)

(declare-fun res!119623 () Bool)

(declare-fun e!95413 () Bool)

(assert (=> b!143250 (=> (not res!119623) (not e!95413))))

(declare-fun thiss!1634 () BitStream!5186)

(assert (=> b!143250 (= res!119623 (isPrefixOf!0 thiss!1634 (_2!6713 lt!222101)))))

(declare-fun b!143251 () Bool)

(declare-fun res!119631 () Bool)

(assert (=> b!143251 (=> (not res!119631) (not e!95412))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143251 (= res!119631 (invariant!0 (currentBit!6272 thiss!1634) (currentByte!6277 thiss!1634) (size!2964 (buf!3393 thiss!1634))))))

(declare-fun b!143252 () Bool)

(declare-fun e!95421 () Bool)

(assert (=> b!143252 (= e!95419 (not e!95421))))

(declare-fun res!119624 () Bool)

(assert (=> b!143252 (=> res!119624 e!95421)))

(declare-datatypes ((tuple2!12746 0))(
  ( (tuple2!12747 (_1!6714 BitStream!5186) (_2!6714 array!6549)) )
))
(declare-fun lt!222105 () tuple2!12746)

(declare-fun arr!237 () array!6549)

(declare-datatypes ((tuple2!12748 0))(
  ( (tuple2!12749 (_1!6715 BitStream!5186) (_2!6715 BitStream!5186)) )
))
(declare-fun lt!222111 () tuple2!12748)

(assert (=> b!143252 (= res!119624 (or (not (= (size!2964 (_2!6714 lt!222105)) (size!2964 arr!237))) (not (= (_1!6714 lt!222105) (_2!6715 lt!222111)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5186 array!6549 (_ BitVec 32) (_ BitVec 32)) tuple2!12746)

(assert (=> b!143252 (= lt!222105 (readByteArrayLoopPure!0 (_1!6715 lt!222111) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!222097 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143252 (validate_offset_bits!1 ((_ sign_extend 32) (size!2964 (buf!3393 (_2!6713 lt!222100)))) ((_ sign_extend 32) (currentByte!6277 (_2!6713 lt!222101))) ((_ sign_extend 32) (currentBit!6272 (_2!6713 lt!222101))) lt!222097)))

(declare-fun lt!222098 () Unit!8928)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5186 array!6549 (_ BitVec 64)) Unit!8928)

(assert (=> b!143252 (= lt!222098 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6713 lt!222101) (buf!3393 (_2!6713 lt!222100)) lt!222097))))

(declare-fun reader!0 (BitStream!5186 BitStream!5186) tuple2!12748)

(assert (=> b!143252 (= lt!222111 (reader!0 (_2!6713 lt!222101) (_2!6713 lt!222100)))))

(declare-fun b!143253 () Bool)

(assert (=> b!143253 (= e!95412 (not (= (size!2964 (buf!3393 thiss!1634)) (size!2964 (buf!3393 (_2!6713 lt!222100))))))))

(declare-fun lt!222109 () tuple2!12748)

(declare-datatypes ((tuple2!12750 0))(
  ( (tuple2!12751 (_1!6716 BitStream!5186) (_2!6716 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5186) tuple2!12750)

(assert (=> b!143253 (= (_2!6716 (readBytePure!0 (_1!6715 lt!222109))) (select (arr!3687 arr!237) from!447))))

(declare-fun lt!222107 () tuple2!12748)

(assert (=> b!143253 (= lt!222107 (reader!0 (_2!6713 lt!222101) (_2!6713 lt!222100)))))

(assert (=> b!143253 (= lt!222109 (reader!0 thiss!1634 (_2!6713 lt!222100)))))

(declare-fun e!95418 () Bool)

(assert (=> b!143253 e!95418))

(declare-fun res!119632 () Bool)

(assert (=> b!143253 (=> (not res!119632) (not e!95418))))

(declare-fun lt!222099 () tuple2!12750)

(declare-fun lt!222108 () tuple2!12750)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143253 (= res!119632 (= (bitIndex!0 (size!2964 (buf!3393 (_1!6716 lt!222099))) (currentByte!6277 (_1!6716 lt!222099)) (currentBit!6272 (_1!6716 lt!222099))) (bitIndex!0 (size!2964 (buf!3393 (_1!6716 lt!222108))) (currentByte!6277 (_1!6716 lt!222108)) (currentBit!6272 (_1!6716 lt!222108)))))))

(declare-fun lt!222110 () Unit!8928)

(declare-fun lt!222104 () BitStream!5186)

(declare-fun readBytePrefixLemma!0 (BitStream!5186 BitStream!5186) Unit!8928)

(assert (=> b!143253 (= lt!222110 (readBytePrefixLemma!0 lt!222104 (_2!6713 lt!222100)))))

(assert (=> b!143253 (= lt!222108 (readBytePure!0 (BitStream!5187 (buf!3393 (_2!6713 lt!222100)) (currentByte!6277 thiss!1634) (currentBit!6272 thiss!1634))))))

(assert (=> b!143253 (= lt!222099 (readBytePure!0 lt!222104))))

(assert (=> b!143253 (= lt!222104 (BitStream!5187 (buf!3393 (_2!6713 lt!222101)) (currentByte!6277 thiss!1634) (currentBit!6272 thiss!1634)))))

(declare-fun e!95420 () Bool)

(assert (=> b!143253 e!95420))

(declare-fun res!119627 () Bool)

(assert (=> b!143253 (=> (not res!119627) (not e!95420))))

(assert (=> b!143253 (= res!119627 (isPrefixOf!0 thiss!1634 (_2!6713 lt!222100)))))

(declare-fun lt!222106 () Unit!8928)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5186 BitStream!5186 BitStream!5186) Unit!8928)

(assert (=> b!143253 (= lt!222106 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6713 lt!222101) (_2!6713 lt!222100)))))

(declare-fun e!95414 () Bool)

(assert (=> b!143253 e!95414))

(declare-fun res!119625 () Bool)

(assert (=> b!143253 (=> (not res!119625) (not e!95414))))

(assert (=> b!143253 (= res!119625 (= (size!2964 (buf!3393 (_2!6713 lt!222101))) (size!2964 (buf!3393 (_2!6713 lt!222100)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5186 array!6549 (_ BitVec 32) (_ BitVec 32)) tuple2!12744)

(assert (=> b!143253 (= lt!222100 (appendByteArrayLoop!0 (_2!6713 lt!222101) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143253 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2964 (buf!3393 (_2!6713 lt!222101)))) ((_ sign_extend 32) (currentByte!6277 (_2!6713 lt!222101))) ((_ sign_extend 32) (currentBit!6272 (_2!6713 lt!222101))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222112 () Unit!8928)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5186 BitStream!5186 (_ BitVec 64) (_ BitVec 32)) Unit!8928)

(assert (=> b!143253 (= lt!222112 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6713 lt!222101) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143253 e!95413))

(declare-fun res!119630 () Bool)

(assert (=> b!143253 (=> (not res!119630) (not e!95413))))

(assert (=> b!143253 (= res!119630 (= (size!2964 (buf!3393 thiss!1634)) (size!2964 (buf!3393 (_2!6713 lt!222101)))))))

(declare-fun appendByte!0 (BitStream!5186 (_ BitVec 8)) tuple2!12744)

(assert (=> b!143253 (= lt!222101 (appendByte!0 thiss!1634 (select (arr!3687 arr!237) from!447)))))

(declare-fun b!143254 () Bool)

(assert (=> b!143254 (= e!95418 (= (_2!6716 lt!222099) (_2!6716 lt!222108)))))

(declare-fun b!143255 () Bool)

(assert (=> b!143255 (= e!95414 e!95419)))

(declare-fun res!119633 () Bool)

(assert (=> b!143255 (=> (not res!119633) (not e!95419))))

(assert (=> b!143255 (= res!119633 (= (bitIndex!0 (size!2964 (buf!3393 (_2!6713 lt!222100))) (currentByte!6277 (_2!6713 lt!222100)) (currentBit!6272 (_2!6713 lt!222100))) (bvadd (bitIndex!0 (size!2964 (buf!3393 (_2!6713 lt!222101))) (currentByte!6277 (_2!6713 lt!222101)) (currentBit!6272 (_2!6713 lt!222101))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222097))))))

(assert (=> b!143255 (= lt!222097 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143256 () Bool)

(declare-fun res!119621 () Bool)

(assert (=> b!143256 (=> (not res!119621) (not e!95412))))

(assert (=> b!143256 (= res!119621 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2964 (buf!3393 thiss!1634))) ((_ sign_extend 32) (currentByte!6277 thiss!1634)) ((_ sign_extend 32) (currentBit!6272 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143257 () Bool)

(declare-fun res!119622 () Bool)

(assert (=> b!143257 (=> (not res!119622) (not e!95413))))

(assert (=> b!143257 (= res!119622 (= (bitIndex!0 (size!2964 (buf!3393 (_2!6713 lt!222101))) (currentByte!6277 (_2!6713 lt!222101)) (currentBit!6272 (_2!6713 lt!222101))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2964 (buf!3393 thiss!1634)) (currentByte!6277 thiss!1634) (currentBit!6272 thiss!1634)))))))

(declare-fun lt!222102 () tuple2!12750)

(declare-fun b!143258 () Bool)

(declare-fun lt!222103 () tuple2!12748)

(assert (=> b!143258 (= e!95413 (and (= (_2!6716 lt!222102) (select (arr!3687 arr!237) from!447)) (= (_1!6716 lt!222102) (_2!6715 lt!222103))))))

(assert (=> b!143258 (= lt!222102 (readBytePure!0 (_1!6715 lt!222103)))))

(assert (=> b!143258 (= lt!222103 (reader!0 thiss!1634 (_2!6713 lt!222101)))))

(declare-fun b!143259 () Bool)

(declare-fun arrayRangesEq!280 (array!6549 array!6549 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143259 (= e!95421 (not (arrayRangesEq!280 arr!237 (_2!6714 lt!222105) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143260 () Bool)

(declare-fun e!95415 () Bool)

(declare-fun array_inv!2753 (array!6549) Bool)

(assert (=> b!143260 (= e!95415 (array_inv!2753 (buf!3393 thiss!1634)))))

(declare-fun b!143261 () Bool)

(assert (=> b!143261 (= e!95420 (invariant!0 (currentBit!6272 thiss!1634) (currentByte!6277 thiss!1634) (size!2964 (buf!3393 (_2!6713 lt!222101)))))))

(declare-fun res!119629 () Bool)

(assert (=> start!27792 (=> (not res!119629) (not e!95412))))

(assert (=> start!27792 (= res!119629 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2964 arr!237))))))

(assert (=> start!27792 e!95412))

(assert (=> start!27792 true))

(assert (=> start!27792 (array_inv!2753 arr!237)))

(declare-fun inv!12 (BitStream!5186) Bool)

(assert (=> start!27792 (and (inv!12 thiss!1634) e!95415)))

(assert (= (and start!27792 res!119629) b!143256))

(assert (= (and b!143256 res!119621) b!143248))

(assert (= (and b!143248 res!119628) b!143251))

(assert (= (and b!143251 res!119631) b!143253))

(assert (= (and b!143253 res!119630) b!143257))

(assert (= (and b!143257 res!119622) b!143250))

(assert (= (and b!143250 res!119623) b!143258))

(assert (= (and b!143253 res!119625) b!143255))

(assert (= (and b!143255 res!119633) b!143249))

(assert (= (and b!143249 res!119626) b!143252))

(assert (= (and b!143252 (not res!119624)) b!143259))

(assert (= (and b!143253 res!119627) b!143261))

(assert (= (and b!143253 res!119632) b!143254))

(assert (= start!27792 b!143260))

(declare-fun m!219933 () Bool)

(assert (=> b!143261 m!219933))

(declare-fun m!219935 () Bool)

(assert (=> b!143258 m!219935))

(declare-fun m!219937 () Bool)

(assert (=> b!143258 m!219937))

(declare-fun m!219939 () Bool)

(assert (=> b!143258 m!219939))

(declare-fun m!219941 () Bool)

(assert (=> b!143260 m!219941))

(declare-fun m!219943 () Bool)

(assert (=> b!143252 m!219943))

(declare-fun m!219945 () Bool)

(assert (=> b!143252 m!219945))

(declare-fun m!219947 () Bool)

(assert (=> b!143252 m!219947))

(declare-fun m!219949 () Bool)

(assert (=> b!143252 m!219949))

(declare-fun m!219951 () Bool)

(assert (=> b!143256 m!219951))

(declare-fun m!219953 () Bool)

(assert (=> b!143257 m!219953))

(declare-fun m!219955 () Bool)

(assert (=> b!143257 m!219955))

(declare-fun m!219957 () Bool)

(assert (=> b!143249 m!219957))

(declare-fun m!219959 () Bool)

(assert (=> b!143259 m!219959))

(declare-fun m!219961 () Bool)

(assert (=> b!143255 m!219961))

(assert (=> b!143255 m!219953))

(declare-fun m!219963 () Bool)

(assert (=> b!143250 m!219963))

(declare-fun m!219965 () Bool)

(assert (=> b!143253 m!219965))

(declare-fun m!219967 () Bool)

(assert (=> b!143253 m!219967))

(declare-fun m!219969 () Bool)

(assert (=> b!143253 m!219969))

(declare-fun m!219971 () Bool)

(assert (=> b!143253 m!219971))

(declare-fun m!219973 () Bool)

(assert (=> b!143253 m!219973))

(declare-fun m!219975 () Bool)

(assert (=> b!143253 m!219975))

(declare-fun m!219977 () Bool)

(assert (=> b!143253 m!219977))

(declare-fun m!219979 () Bool)

(assert (=> b!143253 m!219979))

(declare-fun m!219981 () Bool)

(assert (=> b!143253 m!219981))

(assert (=> b!143253 m!219935))

(declare-fun m!219983 () Bool)

(assert (=> b!143253 m!219983))

(assert (=> b!143253 m!219935))

(assert (=> b!143253 m!219949))

(declare-fun m!219985 () Bool)

(assert (=> b!143253 m!219985))

(declare-fun m!219987 () Bool)

(assert (=> b!143253 m!219987))

(declare-fun m!219989 () Bool)

(assert (=> b!143253 m!219989))

(declare-fun m!219991 () Bool)

(assert (=> b!143251 m!219991))

(declare-fun m!219993 () Bool)

(assert (=> start!27792 m!219993))

(declare-fun m!219995 () Bool)

(assert (=> start!27792 m!219995))

(push 1)

(assert (not b!143250))

(assert (not b!143257))

(assert (not b!143249))

(assert (not b!143261))

(assert (not start!27792))

(assert (not b!143252))

(assert (not b!143251))

