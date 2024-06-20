; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27466 () Bool)

(assert start!27466)

(declare-fun e!94145 () Bool)

(declare-fun b!141312 () Bool)

(declare-datatypes ((array!6481 0))(
  ( (array!6482 (arr!3641 (Array (_ BitVec 32) (_ BitVec 8))) (size!2934 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6481)

(declare-datatypes ((BitStream!5126 0))(
  ( (BitStream!5127 (buf!3355 array!6481) (currentByte!6215 (_ BitVec 32)) (currentBit!6210 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12488 0))(
  ( (tuple2!12489 (_1!6574 BitStream!5126) (_2!6574 (_ BitVec 8))) )
))
(declare-fun lt!219419 () tuple2!12488)

(declare-datatypes ((tuple2!12490 0))(
  ( (tuple2!12491 (_1!6575 BitStream!5126) (_2!6575 BitStream!5126)) )
))
(declare-fun lt!219420 () tuple2!12490)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!141312 (= e!94145 (and (= (_2!6574 lt!219419) (select (arr!3641 arr!237) from!447)) (= (_1!6574 lt!219419) (_2!6575 lt!219420))))))

(declare-fun readBytePure!0 (BitStream!5126) tuple2!12488)

(assert (=> b!141312 (= lt!219419 (readBytePure!0 (_1!6575 lt!219420)))))

(declare-fun thiss!1634 () BitStream!5126)

(declare-datatypes ((Unit!8850 0))(
  ( (Unit!8851) )
))
(declare-datatypes ((tuple2!12492 0))(
  ( (tuple2!12493 (_1!6576 Unit!8850) (_2!6576 BitStream!5126)) )
))
(declare-fun lt!219422 () tuple2!12492)

(declare-fun reader!0 (BitStream!5126 BitStream!5126) tuple2!12490)

(assert (=> b!141312 (= lt!219420 (reader!0 thiss!1634 (_2!6576 lt!219422)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!12494 0))(
  ( (tuple2!12495 (_1!6577 BitStream!5126) (_2!6577 array!6481)) )
))
(declare-fun lt!219428 () tuple2!12494)

(declare-fun b!141313 () Bool)

(declare-fun e!94147 () Bool)

(declare-fun arrayRangesEq!250 (array!6481 array!6481 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141313 (= e!94147 (not (arrayRangesEq!250 arr!237 (_2!6577 lt!219428) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141314 () Bool)

(declare-fun res!117868 () Bool)

(assert (=> b!141314 (=> (not res!117868) (not e!94145))))

(declare-fun isPrefixOf!0 (BitStream!5126 BitStream!5126) Bool)

(assert (=> b!141314 (= res!117868 (isPrefixOf!0 thiss!1634 (_2!6576 lt!219422)))))

(declare-fun b!141315 () Bool)

(declare-fun res!117871 () Bool)

(declare-fun e!94149 () Bool)

(assert (=> b!141315 (=> (not res!117871) (not e!94149))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141315 (= res!117871 (invariant!0 (currentBit!6210 thiss!1634) (currentByte!6215 thiss!1634) (size!2934 (buf!3355 thiss!1634))))))

(declare-fun res!117862 () Bool)

(assert (=> start!27466 (=> (not res!117862) (not e!94149))))

(assert (=> start!27466 (= res!117862 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2934 arr!237))))))

(assert (=> start!27466 e!94149))

(assert (=> start!27466 true))

(declare-fun array_inv!2723 (array!6481) Bool)

(assert (=> start!27466 (array_inv!2723 arr!237)))

(declare-fun e!94143 () Bool)

(declare-fun inv!12 (BitStream!5126) Bool)

(assert (=> start!27466 (and (inv!12 thiss!1634) e!94143)))

(declare-fun b!141316 () Bool)

(declare-fun res!117869 () Bool)

(assert (=> b!141316 (=> (not res!117869) (not e!94149))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141316 (= res!117869 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2934 (buf!3355 thiss!1634))) ((_ sign_extend 32) (currentByte!6215 thiss!1634)) ((_ sign_extend 32) (currentBit!6210 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141317 () Bool)

(declare-fun e!94142 () Bool)

(assert (=> b!141317 (= e!94142 (not e!94147))))

(declare-fun res!117863 () Bool)

(assert (=> b!141317 (=> res!117863 e!94147)))

(declare-fun lt!219421 () tuple2!12490)

(assert (=> b!141317 (= res!117863 (or (not (= (size!2934 (_2!6577 lt!219428)) (size!2934 arr!237))) (not (= (_1!6577 lt!219428) (_2!6575 lt!219421)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5126 array!6481 (_ BitVec 32) (_ BitVec 32)) tuple2!12494)

(assert (=> b!141317 (= lt!219428 (readByteArrayLoopPure!0 (_1!6575 lt!219421) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!219427 () tuple2!12492)

(declare-fun lt!219424 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141317 (validate_offset_bits!1 ((_ sign_extend 32) (size!2934 (buf!3355 (_2!6576 lt!219427)))) ((_ sign_extend 32) (currentByte!6215 (_2!6576 lt!219422))) ((_ sign_extend 32) (currentBit!6210 (_2!6576 lt!219422))) lt!219424)))

(declare-fun lt!219426 () Unit!8850)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5126 array!6481 (_ BitVec 64)) Unit!8850)

(assert (=> b!141317 (= lt!219426 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6576 lt!219422) (buf!3355 (_2!6576 lt!219427)) lt!219424))))

(assert (=> b!141317 (= lt!219421 (reader!0 (_2!6576 lt!219422) (_2!6576 lt!219427)))))

(declare-fun b!141318 () Bool)

(assert (=> b!141318 (= e!94149 (not true))))

(declare-fun lt!219423 () Bool)

(assert (=> b!141318 (= lt!219423 (isPrefixOf!0 thiss!1634 (_2!6576 lt!219422)))))

(declare-fun e!94148 () Bool)

(assert (=> b!141318 e!94148))

(declare-fun res!117870 () Bool)

(assert (=> b!141318 (=> (not res!117870) (not e!94148))))

(assert (=> b!141318 (= res!117870 (= (size!2934 (buf!3355 (_2!6576 lt!219422))) (size!2934 (buf!3355 (_2!6576 lt!219427)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5126 array!6481 (_ BitVec 32) (_ BitVec 32)) tuple2!12492)

(assert (=> b!141318 (= lt!219427 (appendByteArrayLoop!0 (_2!6576 lt!219422) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!141318 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2934 (buf!3355 (_2!6576 lt!219422)))) ((_ sign_extend 32) (currentByte!6215 (_2!6576 lt!219422))) ((_ sign_extend 32) (currentBit!6210 (_2!6576 lt!219422))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219425 () Unit!8850)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5126 BitStream!5126 (_ BitVec 64) (_ BitVec 32)) Unit!8850)

(assert (=> b!141318 (= lt!219425 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6576 lt!219422) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141318 e!94145))

(declare-fun res!117865 () Bool)

(assert (=> b!141318 (=> (not res!117865) (not e!94145))))

(assert (=> b!141318 (= res!117865 (= (size!2934 (buf!3355 thiss!1634)) (size!2934 (buf!3355 (_2!6576 lt!219422)))))))

(declare-fun appendByte!0 (BitStream!5126 (_ BitVec 8)) tuple2!12492)

(assert (=> b!141318 (= lt!219422 (appendByte!0 thiss!1634 (select (arr!3641 arr!237) from!447)))))

(declare-fun b!141319 () Bool)

(declare-fun res!117867 () Bool)

(assert (=> b!141319 (=> (not res!117867) (not e!94145))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141319 (= res!117867 (= (bitIndex!0 (size!2934 (buf!3355 (_2!6576 lt!219422))) (currentByte!6215 (_2!6576 lt!219422)) (currentBit!6210 (_2!6576 lt!219422))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2934 (buf!3355 thiss!1634)) (currentByte!6215 thiss!1634) (currentBit!6210 thiss!1634)))))))

(declare-fun b!141320 () Bool)

(declare-fun res!117864 () Bool)

(assert (=> b!141320 (=> (not res!117864) (not e!94142))))

(assert (=> b!141320 (= res!117864 (isPrefixOf!0 (_2!6576 lt!219422) (_2!6576 lt!219427)))))

(declare-fun b!141321 () Bool)

(declare-fun res!117866 () Bool)

(assert (=> b!141321 (=> (not res!117866) (not e!94149))))

(assert (=> b!141321 (= res!117866 (bvslt from!447 to!404))))

(declare-fun b!141322 () Bool)

(assert (=> b!141322 (= e!94148 e!94142)))

(declare-fun res!117861 () Bool)

(assert (=> b!141322 (=> (not res!117861) (not e!94142))))

(assert (=> b!141322 (= res!117861 (= (bitIndex!0 (size!2934 (buf!3355 (_2!6576 lt!219427))) (currentByte!6215 (_2!6576 lt!219427)) (currentBit!6210 (_2!6576 lt!219427))) (bvadd (bitIndex!0 (size!2934 (buf!3355 (_2!6576 lt!219422))) (currentByte!6215 (_2!6576 lt!219422)) (currentBit!6210 (_2!6576 lt!219422))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219424))))))

(assert (=> b!141322 (= lt!219424 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141323 () Bool)

(assert (=> b!141323 (= e!94143 (array_inv!2723 (buf!3355 thiss!1634)))))

(assert (= (and start!27466 res!117862) b!141316))

(assert (= (and b!141316 res!117869) b!141321))

(assert (= (and b!141321 res!117866) b!141315))

(assert (= (and b!141315 res!117871) b!141318))

(assert (= (and b!141318 res!117865) b!141319))

(assert (= (and b!141319 res!117867) b!141314))

(assert (= (and b!141314 res!117868) b!141312))

(assert (= (and b!141318 res!117870) b!141322))

(assert (= (and b!141322 res!117861) b!141320))

(assert (= (and b!141320 res!117864) b!141317))

(assert (= (and b!141317 (not res!117863)) b!141313))

(assert (= start!27466 b!141323))

(declare-fun m!217161 () Bool)

(assert (=> b!141318 m!217161))

(declare-fun m!217163 () Bool)

(assert (=> b!141318 m!217163))

(declare-fun m!217165 () Bool)

(assert (=> b!141318 m!217165))

(declare-fun m!217167 () Bool)

(assert (=> b!141318 m!217167))

(assert (=> b!141318 m!217167))

(declare-fun m!217169 () Bool)

(assert (=> b!141318 m!217169))

(declare-fun m!217171 () Bool)

(assert (=> b!141318 m!217171))

(declare-fun m!217173 () Bool)

(assert (=> b!141320 m!217173))

(declare-fun m!217175 () Bool)

(assert (=> b!141313 m!217175))

(assert (=> b!141312 m!217167))

(declare-fun m!217177 () Bool)

(assert (=> b!141312 m!217177))

(declare-fun m!217179 () Bool)

(assert (=> b!141312 m!217179))

(declare-fun m!217181 () Bool)

(assert (=> start!27466 m!217181))

(declare-fun m!217183 () Bool)

(assert (=> start!27466 m!217183))

(declare-fun m!217185 () Bool)

(assert (=> b!141317 m!217185))

(declare-fun m!217187 () Bool)

(assert (=> b!141317 m!217187))

(declare-fun m!217189 () Bool)

(assert (=> b!141317 m!217189))

(declare-fun m!217191 () Bool)

(assert (=> b!141317 m!217191))

(declare-fun m!217193 () Bool)

(assert (=> b!141319 m!217193))

(declare-fun m!217195 () Bool)

(assert (=> b!141319 m!217195))

(assert (=> b!141314 m!217163))

(declare-fun m!217197 () Bool)

(assert (=> b!141315 m!217197))

(declare-fun m!217199 () Bool)

(assert (=> b!141322 m!217199))

(assert (=> b!141322 m!217193))

(declare-fun m!217201 () Bool)

(assert (=> b!141323 m!217201))

(declare-fun m!217203 () Bool)

(assert (=> b!141316 m!217203))

(push 1)

(assert (not b!141323))

(assert (not b!141320))

(assert (not b!141314))

(assert (not b!141313))

(assert (not b!141318))

(assert (not b!141316))

(assert (not b!141322))

(assert (not b!141312))

(assert (not b!141315))

(assert (not b!141317))

(assert (not start!27466))

(assert (not b!141319))

(check-sat)

