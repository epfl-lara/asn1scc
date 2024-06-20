; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27592 () Bool)

(assert start!27592)

(declare-fun b!142127 () Bool)

(declare-fun res!118614 () Bool)

(declare-fun e!94672 () Bool)

(assert (=> b!142127 (=> (not res!118614) (not e!94672))))

(declare-datatypes ((array!6514 0))(
  ( (array!6515 (arr!3662 (Array (_ BitVec 32) (_ BitVec 8))) (size!2949 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5156 0))(
  ( (BitStream!5157 (buf!3373 array!6514) (currentByte!6242 (_ BitVec 32)) (currentBit!6237 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5156)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142127 (= res!118614 (invariant!0 (currentBit!6237 thiss!1634) (currentByte!6242 thiss!1634) (size!2949 (buf!3373 thiss!1634))))))

(declare-fun b!142128 () Bool)

(declare-fun e!94673 () Bool)

(assert (=> b!142128 (= e!94672 (not e!94673))))

(declare-fun res!118612 () Bool)

(assert (=> b!142128 (=> res!118612 e!94673)))

(declare-fun lt!220420 () (_ BitVec 64))

(declare-datatypes ((Unit!8886 0))(
  ( (Unit!8887) )
))
(declare-datatypes ((tuple2!12614 0))(
  ( (tuple2!12615 (_1!6640 Unit!8886) (_2!6640 BitStream!5156)) )
))
(declare-fun lt!220424 () tuple2!12614)

(assert (=> b!142128 (= res!118612 (bvsgt lt!220420 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2949 (buf!3373 (_2!6640 lt!220424)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142128 (= lt!220420 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2949 (buf!3373 (_2!6640 lt!220424))) (currentByte!6242 thiss!1634) (currentBit!6237 thiss!1634))))))

(declare-fun e!94680 () Bool)

(assert (=> b!142128 e!94680))

(declare-fun res!118609 () Bool)

(assert (=> b!142128 (=> (not res!118609) (not e!94680))))

(declare-fun lt!220416 () tuple2!12614)

(declare-fun isPrefixOf!0 (BitStream!5156 BitStream!5156) Bool)

(assert (=> b!142128 (= res!118609 (isPrefixOf!0 thiss!1634 (_2!6640 lt!220416)))))

(declare-fun lt!220415 () Unit!8886)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5156 BitStream!5156 BitStream!5156) Unit!8886)

(assert (=> b!142128 (= lt!220415 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6640 lt!220424) (_2!6640 lt!220416)))))

(declare-fun e!94671 () Bool)

(assert (=> b!142128 e!94671))

(declare-fun res!118608 () Bool)

(assert (=> b!142128 (=> (not res!118608) (not e!94671))))

(assert (=> b!142128 (= res!118608 (= (size!2949 (buf!3373 (_2!6640 lt!220424))) (size!2949 (buf!3373 (_2!6640 lt!220416)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6514)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!5156 array!6514 (_ BitVec 32) (_ BitVec 32)) tuple2!12614)

(assert (=> b!142128 (= lt!220416 (appendByteArrayLoop!0 (_2!6640 lt!220424) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142128 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2949 (buf!3373 (_2!6640 lt!220424)))) ((_ sign_extend 32) (currentByte!6242 (_2!6640 lt!220424))) ((_ sign_extend 32) (currentBit!6237 (_2!6640 lt!220424))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!220414 () Unit!8886)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5156 BitStream!5156 (_ BitVec 64) (_ BitVec 32)) Unit!8886)

(assert (=> b!142128 (= lt!220414 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6640 lt!220424) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94674 () Bool)

(assert (=> b!142128 e!94674))

(declare-fun res!118616 () Bool)

(assert (=> b!142128 (=> (not res!118616) (not e!94674))))

(assert (=> b!142128 (= res!118616 (= (size!2949 (buf!3373 thiss!1634)) (size!2949 (buf!3373 (_2!6640 lt!220424)))))))

(declare-fun appendByte!0 (BitStream!5156 (_ BitVec 8)) tuple2!12614)

(assert (=> b!142128 (= lt!220424 (appendByte!0 thiss!1634 (select (arr!3662 arr!237) from!447)))))

(declare-fun b!142129 () Bool)

(declare-fun res!118606 () Bool)

(declare-fun e!94679 () Bool)

(assert (=> b!142129 (=> (not res!118606) (not e!94679))))

(assert (=> b!142129 (= res!118606 (isPrefixOf!0 (_2!6640 lt!220424) (_2!6640 lt!220416)))))

(declare-fun b!142130 () Bool)

(assert (=> b!142130 (= e!94671 e!94679)))

(declare-fun res!118615 () Bool)

(assert (=> b!142130 (=> (not res!118615) (not e!94679))))

(declare-fun lt!220419 () (_ BitVec 64))

(assert (=> b!142130 (= res!118615 (= (bitIndex!0 (size!2949 (buf!3373 (_2!6640 lt!220416))) (currentByte!6242 (_2!6640 lt!220416)) (currentBit!6237 (_2!6640 lt!220416))) (bvadd (bitIndex!0 (size!2949 (buf!3373 (_2!6640 lt!220424))) (currentByte!6242 (_2!6640 lt!220424)) (currentBit!6237 (_2!6640 lt!220424))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!220419))))))

(assert (=> b!142130 (= lt!220419 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142131 () Bool)

(declare-fun res!118613 () Bool)

(assert (=> b!142131 (=> (not res!118613) (not e!94674))))

(assert (=> b!142131 (= res!118613 (isPrefixOf!0 thiss!1634 (_2!6640 lt!220424)))))

(declare-datatypes ((tuple2!12616 0))(
  ( (tuple2!12617 (_1!6641 BitStream!5156) (_2!6641 array!6514)) )
))
(declare-fun lt!220423 () tuple2!12616)

(declare-fun b!142132 () Bool)

(declare-fun e!94675 () Bool)

(declare-fun arrayRangesEq!265 (array!6514 array!6514 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142132 (= e!94675 (not (arrayRangesEq!265 arr!237 (_2!6641 lt!220423) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142133 () Bool)

(declare-fun res!118618 () Bool)

(assert (=> b!142133 (=> (not res!118618) (not e!94672))))

(assert (=> b!142133 (= res!118618 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2949 (buf!3373 thiss!1634))) ((_ sign_extend 32) (currentByte!6242 thiss!1634)) ((_ sign_extend 32) (currentBit!6237 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!118610 () Bool)

(assert (=> start!27592 (=> (not res!118610) (not e!94672))))

(assert (=> start!27592 (= res!118610 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2949 arr!237))))))

(assert (=> start!27592 e!94672))

(assert (=> start!27592 true))

(declare-fun array_inv!2738 (array!6514) Bool)

(assert (=> start!27592 (array_inv!2738 arr!237)))

(declare-fun e!94677 () Bool)

(declare-fun inv!12 (BitStream!5156) Bool)

(assert (=> start!27592 (and (inv!12 thiss!1634) e!94677)))

(declare-fun b!142126 () Bool)

(assert (=> b!142126 (= e!94680 (invariant!0 (currentBit!6237 thiss!1634) (currentByte!6242 thiss!1634) (size!2949 (buf!3373 (_2!6640 lt!220424)))))))

(declare-fun b!142134 () Bool)

(assert (=> b!142134 (= e!94673 (bvsle lt!220420 (bitIndex!0 (size!2949 (buf!3373 (_2!6640 lt!220416))) (currentByte!6242 (_2!6640 lt!220416)) (currentBit!6237 (_2!6640 lt!220416)))))))

(declare-fun b!142135 () Bool)

(declare-fun res!118617 () Bool)

(assert (=> b!142135 (=> (not res!118617) (not e!94674))))

(assert (=> b!142135 (= res!118617 (= (bitIndex!0 (size!2949 (buf!3373 (_2!6640 lt!220424))) (currentByte!6242 (_2!6640 lt!220424)) (currentBit!6237 (_2!6640 lt!220424))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2949 (buf!3373 thiss!1634)) (currentByte!6242 thiss!1634) (currentBit!6237 thiss!1634)))))))

(declare-datatypes ((tuple2!12618 0))(
  ( (tuple2!12619 (_1!6642 BitStream!5156) (_2!6642 (_ BitVec 8))) )
))
(declare-fun lt!220422 () tuple2!12618)

(declare-datatypes ((tuple2!12620 0))(
  ( (tuple2!12621 (_1!6643 BitStream!5156) (_2!6643 BitStream!5156)) )
))
(declare-fun lt!220421 () tuple2!12620)

(declare-fun b!142136 () Bool)

(assert (=> b!142136 (= e!94674 (and (= (_2!6642 lt!220422) (select (arr!3662 arr!237) from!447)) (= (_1!6642 lt!220422) (_2!6643 lt!220421))))))

(declare-fun readBytePure!0 (BitStream!5156) tuple2!12618)

(assert (=> b!142136 (= lt!220422 (readBytePure!0 (_1!6643 lt!220421)))))

(declare-fun reader!0 (BitStream!5156 BitStream!5156) tuple2!12620)

(assert (=> b!142136 (= lt!220421 (reader!0 thiss!1634 (_2!6640 lt!220424)))))

(declare-fun b!142137 () Bool)

(assert (=> b!142137 (= e!94677 (array_inv!2738 (buf!3373 thiss!1634)))))

(declare-fun b!142138 () Bool)

(assert (=> b!142138 (= e!94679 (not e!94675))))

(declare-fun res!118607 () Bool)

(assert (=> b!142138 (=> res!118607 e!94675)))

(declare-fun lt!220417 () tuple2!12620)

(assert (=> b!142138 (= res!118607 (or (not (= (size!2949 (_2!6641 lt!220423)) (size!2949 arr!237))) (not (= (_1!6641 lt!220423) (_2!6643 lt!220417)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5156 array!6514 (_ BitVec 32) (_ BitVec 32)) tuple2!12616)

(assert (=> b!142138 (= lt!220423 (readByteArrayLoopPure!0 (_1!6643 lt!220417) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142138 (validate_offset_bits!1 ((_ sign_extend 32) (size!2949 (buf!3373 (_2!6640 lt!220416)))) ((_ sign_extend 32) (currentByte!6242 (_2!6640 lt!220424))) ((_ sign_extend 32) (currentBit!6237 (_2!6640 lt!220424))) lt!220419)))

(declare-fun lt!220418 () Unit!8886)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5156 array!6514 (_ BitVec 64)) Unit!8886)

(assert (=> b!142138 (= lt!220418 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6640 lt!220424) (buf!3373 (_2!6640 lt!220416)) lt!220419))))

(assert (=> b!142138 (= lt!220417 (reader!0 (_2!6640 lt!220424) (_2!6640 lt!220416)))))

(declare-fun b!142139 () Bool)

(declare-fun res!118611 () Bool)

(assert (=> b!142139 (=> (not res!118611) (not e!94672))))

(assert (=> b!142139 (= res!118611 (bvslt from!447 to!404))))

(assert (= (and start!27592 res!118610) b!142133))

(assert (= (and b!142133 res!118618) b!142139))

(assert (= (and b!142139 res!118611) b!142127))

(assert (= (and b!142127 res!118614) b!142128))

(assert (= (and b!142128 res!118616) b!142135))

(assert (= (and b!142135 res!118617) b!142131))

(assert (= (and b!142131 res!118613) b!142136))

(assert (= (and b!142128 res!118608) b!142130))

(assert (= (and b!142130 res!118615) b!142129))

(assert (= (and b!142129 res!118606) b!142138))

(assert (= (and b!142138 (not res!118607)) b!142132))

(assert (= (and b!142128 res!118609) b!142126))

(assert (= (and b!142128 (not res!118612)) b!142134))

(assert (= start!27592 b!142137))

(declare-fun m!218263 () Bool)

(assert (=> b!142135 m!218263))

(declare-fun m!218265 () Bool)

(assert (=> b!142135 m!218265))

(declare-fun m!218267 () Bool)

(assert (=> b!142132 m!218267))

(declare-fun m!218269 () Bool)

(assert (=> b!142131 m!218269))

(declare-fun m!218271 () Bool)

(assert (=> b!142134 m!218271))

(declare-fun m!218273 () Bool)

(assert (=> b!142128 m!218273))

(declare-fun m!218275 () Bool)

(assert (=> b!142128 m!218275))

(declare-fun m!218277 () Bool)

(assert (=> b!142128 m!218277))

(declare-fun m!218279 () Bool)

(assert (=> b!142128 m!218279))

(declare-fun m!218281 () Bool)

(assert (=> b!142128 m!218281))

(declare-fun m!218283 () Bool)

(assert (=> b!142128 m!218283))

(declare-fun m!218285 () Bool)

(assert (=> b!142128 m!218285))

(declare-fun m!218287 () Bool)

(assert (=> b!142128 m!218287))

(assert (=> b!142128 m!218283))

(declare-fun m!218289 () Bool)

(assert (=> b!142127 m!218289))

(declare-fun m!218291 () Bool)

(assert (=> b!142133 m!218291))

(declare-fun m!218293 () Bool)

(assert (=> b!142129 m!218293))

(assert (=> b!142130 m!218271))

(assert (=> b!142130 m!218263))

(declare-fun m!218295 () Bool)

(assert (=> start!27592 m!218295))

(declare-fun m!218297 () Bool)

(assert (=> start!27592 m!218297))

(declare-fun m!218299 () Bool)

(assert (=> b!142126 m!218299))

(assert (=> b!142136 m!218283))

(declare-fun m!218301 () Bool)

(assert (=> b!142136 m!218301))

(declare-fun m!218303 () Bool)

(assert (=> b!142136 m!218303))

(declare-fun m!218305 () Bool)

(assert (=> b!142137 m!218305))

(declare-fun m!218307 () Bool)

(assert (=> b!142138 m!218307))

(declare-fun m!218309 () Bool)

(assert (=> b!142138 m!218309))

(declare-fun m!218311 () Bool)

(assert (=> b!142138 m!218311))

(declare-fun m!218313 () Bool)

(assert (=> b!142138 m!218313))

(push 1)

(assert (not b!142130))

(assert (not b!142134))

(assert (not b!142133))

(assert (not b!142132))

(assert (not b!142127))

(assert (not b!142129))

(assert (not start!27592))

(assert (not b!142137))

(assert (not b!142136))

(assert (not b!142138))

(assert (not b!142135))

(assert (not b!142131))

(assert (not b!142128))

(assert (not b!142126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

