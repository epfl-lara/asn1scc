; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27472 () Bool)

(assert start!27472)

(declare-fun b!141420 () Bool)

(declare-fun res!117969 () Bool)

(declare-fun e!94215 () Bool)

(assert (=> b!141420 (=> (not res!117969) (not e!94215))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!141420 (= res!117969 (bvslt from!447 to!404))))

(declare-fun b!141421 () Bool)

(declare-fun res!117960 () Bool)

(declare-fun e!94214 () Bool)

(assert (=> b!141421 (=> (not res!117960) (not e!94214))))

(declare-datatypes ((array!6487 0))(
  ( (array!6488 (arr!3644 (Array (_ BitVec 32) (_ BitVec 8))) (size!2937 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5132 0))(
  ( (BitStream!5133 (buf!3358 array!6487) (currentByte!6218 (_ BitVec 32)) (currentBit!6213 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8856 0))(
  ( (Unit!8857) )
))
(declare-datatypes ((tuple2!12512 0))(
  ( (tuple2!12513 (_1!6586 Unit!8856) (_2!6586 BitStream!5132)) )
))
(declare-fun lt!219516 () tuple2!12512)

(declare-fun thiss!1634 () BitStream!5132)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141421 (= res!117960 (= (bitIndex!0 (size!2937 (buf!3358 (_2!6586 lt!219516))) (currentByte!6218 (_2!6586 lt!219516)) (currentBit!6213 (_2!6586 lt!219516))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2937 (buf!3358 thiss!1634)) (currentByte!6218 thiss!1634) (currentBit!6213 thiss!1634)))))))

(declare-fun b!141422 () Bool)

(declare-fun res!117963 () Bool)

(assert (=> b!141422 (=> (not res!117963) (not e!94215))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141422 (= res!117963 (invariant!0 (currentBit!6213 thiss!1634) (currentByte!6218 thiss!1634) (size!2937 (buf!3358 thiss!1634))))))

(declare-fun arr!237 () array!6487)

(declare-datatypes ((tuple2!12514 0))(
  ( (tuple2!12515 (_1!6587 BitStream!5132) (_2!6587 array!6487)) )
))
(declare-fun lt!219511 () tuple2!12514)

(declare-fun b!141423 () Bool)

(declare-fun e!94218 () Bool)

(declare-fun arrayRangesEq!253 (array!6487 array!6487 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141423 (= e!94218 (not (arrayRangesEq!253 arr!237 (_2!6587 lt!219511) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141424 () Bool)

(declare-fun e!94217 () Bool)

(declare-fun array_inv!2726 (array!6487) Bool)

(assert (=> b!141424 (= e!94217 (array_inv!2726 (buf!3358 thiss!1634)))))

(declare-fun b!141425 () Bool)

(declare-fun res!117970 () Bool)

(assert (=> b!141425 (=> (not res!117970) (not e!94214))))

(declare-fun isPrefixOf!0 (BitStream!5132 BitStream!5132) Bool)

(assert (=> b!141425 (= res!117970 (isPrefixOf!0 thiss!1634 (_2!6586 lt!219516)))))

(declare-fun b!141426 () Bool)

(declare-fun e!94216 () Bool)

(assert (=> b!141426 (= e!94216 (not e!94218))))

(declare-fun res!117968 () Bool)

(assert (=> b!141426 (=> res!117968 e!94218)))

(declare-datatypes ((tuple2!12516 0))(
  ( (tuple2!12517 (_1!6588 BitStream!5132) (_2!6588 BitStream!5132)) )
))
(declare-fun lt!219510 () tuple2!12516)

(assert (=> b!141426 (= res!117968 (or (not (= (size!2937 (_2!6587 lt!219511)) (size!2937 arr!237))) (not (= (_1!6587 lt!219511) (_2!6588 lt!219510)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5132 array!6487 (_ BitVec 32) (_ BitVec 32)) tuple2!12514)

(assert (=> b!141426 (= lt!219511 (readByteArrayLoopPure!0 (_1!6588 lt!219510) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!219513 () tuple2!12512)

(declare-fun lt!219515 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141426 (validate_offset_bits!1 ((_ sign_extend 32) (size!2937 (buf!3358 (_2!6586 lt!219513)))) ((_ sign_extend 32) (currentByte!6218 (_2!6586 lt!219516))) ((_ sign_extend 32) (currentBit!6213 (_2!6586 lt!219516))) lt!219515)))

(declare-fun lt!219517 () Unit!8856)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5132 array!6487 (_ BitVec 64)) Unit!8856)

(assert (=> b!141426 (= lt!219517 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6586 lt!219516) (buf!3358 (_2!6586 lt!219513)) lt!219515))))

(declare-fun reader!0 (BitStream!5132 BitStream!5132) tuple2!12516)

(assert (=> b!141426 (= lt!219510 (reader!0 (_2!6586 lt!219516) (_2!6586 lt!219513)))))

(declare-fun res!117961 () Bool)

(assert (=> start!27472 (=> (not res!117961) (not e!94215))))

(assert (=> start!27472 (= res!117961 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2937 arr!237))))))

(assert (=> start!27472 e!94215))

(assert (=> start!27472 true))

(assert (=> start!27472 (array_inv!2726 arr!237)))

(declare-fun inv!12 (BitStream!5132) Bool)

(assert (=> start!27472 (and (inv!12 thiss!1634) e!94217)))

(declare-fun b!141427 () Bool)

(declare-fun res!117966 () Bool)

(assert (=> b!141427 (=> (not res!117966) (not e!94215))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141427 (= res!117966 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2937 (buf!3358 thiss!1634))) ((_ sign_extend 32) (currentByte!6218 thiss!1634)) ((_ sign_extend 32) (currentBit!6213 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141428 () Bool)

(assert (=> b!141428 (= e!94215 (not (isPrefixOf!0 (_2!6586 lt!219516) (_2!6586 lt!219513))))))

(declare-fun lt!219512 () Bool)

(assert (=> b!141428 (= lt!219512 (isPrefixOf!0 thiss!1634 (_2!6586 lt!219516)))))

(declare-fun e!94221 () Bool)

(assert (=> b!141428 e!94221))

(declare-fun res!117962 () Bool)

(assert (=> b!141428 (=> (not res!117962) (not e!94221))))

(assert (=> b!141428 (= res!117962 (= (size!2937 (buf!3358 (_2!6586 lt!219516))) (size!2937 (buf!3358 (_2!6586 lt!219513)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5132 array!6487 (_ BitVec 32) (_ BitVec 32)) tuple2!12512)

(assert (=> b!141428 (= lt!219513 (appendByteArrayLoop!0 (_2!6586 lt!219516) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!141428 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2937 (buf!3358 (_2!6586 lt!219516)))) ((_ sign_extend 32) (currentByte!6218 (_2!6586 lt!219516))) ((_ sign_extend 32) (currentBit!6213 (_2!6586 lt!219516))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219518 () Unit!8856)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5132 BitStream!5132 (_ BitVec 64) (_ BitVec 32)) Unit!8856)

(assert (=> b!141428 (= lt!219518 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6586 lt!219516) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141428 e!94214))

(declare-fun res!117964 () Bool)

(assert (=> b!141428 (=> (not res!117964) (not e!94214))))

(assert (=> b!141428 (= res!117964 (= (size!2937 (buf!3358 thiss!1634)) (size!2937 (buf!3358 (_2!6586 lt!219516)))))))

(declare-fun appendByte!0 (BitStream!5132 (_ BitVec 8)) tuple2!12512)

(assert (=> b!141428 (= lt!219516 (appendByte!0 thiss!1634 (select (arr!3644 arr!237) from!447)))))

(declare-fun b!141429 () Bool)

(declare-fun res!117965 () Bool)

(assert (=> b!141429 (=> (not res!117965) (not e!94216))))

(assert (=> b!141429 (= res!117965 (isPrefixOf!0 (_2!6586 lt!219516) (_2!6586 lt!219513)))))

(declare-fun b!141430 () Bool)

(assert (=> b!141430 (= e!94221 e!94216)))

(declare-fun res!117967 () Bool)

(assert (=> b!141430 (=> (not res!117967) (not e!94216))))

(assert (=> b!141430 (= res!117967 (= (bitIndex!0 (size!2937 (buf!3358 (_2!6586 lt!219513))) (currentByte!6218 (_2!6586 lt!219513)) (currentBit!6213 (_2!6586 lt!219513))) (bvadd (bitIndex!0 (size!2937 (buf!3358 (_2!6586 lt!219516))) (currentByte!6218 (_2!6586 lt!219516)) (currentBit!6213 (_2!6586 lt!219516))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219515))))))

(assert (=> b!141430 (= lt!219515 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-datatypes ((tuple2!12518 0))(
  ( (tuple2!12519 (_1!6589 BitStream!5132) (_2!6589 (_ BitVec 8))) )
))
(declare-fun lt!219509 () tuple2!12518)

(declare-fun b!141431 () Bool)

(declare-fun lt!219514 () tuple2!12516)

(assert (=> b!141431 (= e!94214 (and (= (_2!6589 lt!219509) (select (arr!3644 arr!237) from!447)) (= (_1!6589 lt!219509) (_2!6588 lt!219514))))))

(declare-fun readBytePure!0 (BitStream!5132) tuple2!12518)

(assert (=> b!141431 (= lt!219509 (readBytePure!0 (_1!6588 lt!219514)))))

(assert (=> b!141431 (= lt!219514 (reader!0 thiss!1634 (_2!6586 lt!219516)))))

(assert (= (and start!27472 res!117961) b!141427))

(assert (= (and b!141427 res!117966) b!141420))

(assert (= (and b!141420 res!117969) b!141422))

(assert (= (and b!141422 res!117963) b!141428))

(assert (= (and b!141428 res!117964) b!141421))

(assert (= (and b!141421 res!117960) b!141425))

(assert (= (and b!141425 res!117970) b!141431))

(assert (= (and b!141428 res!117962) b!141430))

(assert (= (and b!141430 res!117967) b!141429))

(assert (= (and b!141429 res!117965) b!141426))

(assert (= (and b!141426 (not res!117968)) b!141423))

(assert (= start!27472 b!141424))

(declare-fun m!217293 () Bool)

(assert (=> b!141430 m!217293))

(declare-fun m!217295 () Bool)

(assert (=> b!141430 m!217295))

(declare-fun m!217297 () Bool)

(assert (=> b!141428 m!217297))

(declare-fun m!217299 () Bool)

(assert (=> b!141428 m!217299))

(declare-fun m!217301 () Bool)

(assert (=> b!141428 m!217301))

(declare-fun m!217303 () Bool)

(assert (=> b!141428 m!217303))

(declare-fun m!217305 () Bool)

(assert (=> b!141428 m!217305))

(declare-fun m!217307 () Bool)

(assert (=> b!141428 m!217307))

(assert (=> b!141428 m!217305))

(declare-fun m!217309 () Bool)

(assert (=> b!141428 m!217309))

(declare-fun m!217311 () Bool)

(assert (=> b!141424 m!217311))

(assert (=> b!141421 m!217295))

(declare-fun m!217313 () Bool)

(assert (=> b!141421 m!217313))

(declare-fun m!217315 () Bool)

(assert (=> start!27472 m!217315))

(declare-fun m!217317 () Bool)

(assert (=> start!27472 m!217317))

(declare-fun m!217319 () Bool)

(assert (=> b!141426 m!217319))

(declare-fun m!217321 () Bool)

(assert (=> b!141426 m!217321))

(declare-fun m!217323 () Bool)

(assert (=> b!141426 m!217323))

(declare-fun m!217325 () Bool)

(assert (=> b!141426 m!217325))

(assert (=> b!141429 m!217297))

(declare-fun m!217327 () Bool)

(assert (=> b!141427 m!217327))

(assert (=> b!141425 m!217301))

(declare-fun m!217329 () Bool)

(assert (=> b!141422 m!217329))

(declare-fun m!217331 () Bool)

(assert (=> b!141423 m!217331))

(assert (=> b!141431 m!217305))

(declare-fun m!217333 () Bool)

(assert (=> b!141431 m!217333))

(declare-fun m!217335 () Bool)

(assert (=> b!141431 m!217335))

(push 1)

(assert (not b!141427))

(assert (not b!141430))

(assert (not b!141426))

(assert (not b!141423))

(assert (not b!141424))

(assert (not b!141431))

(assert (not b!141428))

(assert (not start!27472))

(assert (not b!141425))

(assert (not b!141421))

(assert (not b!141422))

(assert (not b!141429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

