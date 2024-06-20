; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27082 () Bool)

(assert start!27082)

(declare-fun b!139343 () Bool)

(declare-fun res!116151 () Bool)

(declare-fun e!92815 () Bool)

(assert (=> b!139343 (=> (not res!116151) (not e!92815))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6347 0))(
  ( (array!6348 (arr!3568 (Array (_ BitVec 32) (_ BitVec 8))) (size!2873 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5010 0))(
  ( (BitStream!5011 (buf!3289 array!6347) (currentByte!6119 (_ BitVec 32)) (currentBit!6114 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5010)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139343 (= res!116151 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2873 (buf!3289 thiss!1634))) ((_ sign_extend 32) (currentByte!6119 thiss!1634)) ((_ sign_extend 32) (currentBit!6114 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!116154 () Bool)

(assert (=> start!27082 (=> (not res!116154) (not e!92815))))

(declare-fun arr!237 () array!6347)

(assert (=> start!27082 (= res!116154 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2873 arr!237))))))

(assert (=> start!27082 e!92815))

(assert (=> start!27082 true))

(declare-fun array_inv!2662 (array!6347) Bool)

(assert (=> start!27082 (array_inv!2662 arr!237)))

(declare-fun e!92814 () Bool)

(declare-fun inv!12 (BitStream!5010) Bool)

(assert (=> start!27082 (and (inv!12 thiss!1634) e!92814)))

(declare-fun b!139344 () Bool)

(declare-fun e!92817 () Bool)

(assert (=> b!139344 (= e!92817 true)))

(declare-datatypes ((tuple2!12210 0))(
  ( (tuple2!12211 (_1!6431 BitStream!5010) (_2!6431 array!6347)) )
))
(declare-fun lt!217264 () tuple2!12210)

(declare-datatypes ((tuple2!12212 0))(
  ( (tuple2!12213 (_1!6432 BitStream!5010) (_2!6432 BitStream!5010)) )
))
(declare-fun lt!217266 () tuple2!12212)

(declare-fun readByteArrayLoopPure!0 (BitStream!5010 array!6347 (_ BitVec 32) (_ BitVec 32)) tuple2!12210)

(assert (=> b!139344 (= lt!217264 (readByteArrayLoopPure!0 (_1!6432 lt!217266) arr!237 from!447 to!404))))

(declare-fun lt!217265 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139344 (validate_offset_bits!1 ((_ sign_extend 32) (size!2873 (buf!3289 thiss!1634))) ((_ sign_extend 32) (currentByte!6119 thiss!1634)) ((_ sign_extend 32) (currentBit!6114 thiss!1634)) lt!217265)))

(declare-datatypes ((Unit!8705 0))(
  ( (Unit!8706) )
))
(declare-fun lt!217267 () Unit!8705)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5010 array!6347 (_ BitVec 64)) Unit!8705)

(assert (=> b!139344 (= lt!217267 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3289 thiss!1634) lt!217265))))

(declare-fun reader!0 (BitStream!5010 BitStream!5010) tuple2!12212)

(assert (=> b!139344 (= lt!217266 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139345 () Bool)

(assert (=> b!139345 (= e!92814 (array_inv!2662 (buf!3289 thiss!1634)))))

(declare-fun b!139346 () Bool)

(declare-fun res!116152 () Bool)

(assert (=> b!139346 (=> (not res!116152) (not e!92815))))

(assert (=> b!139346 (= res!116152 (bvsge from!447 to!404))))

(declare-fun b!139347 () Bool)

(assert (=> b!139347 (= e!92815 (not e!92817))))

(declare-fun res!116153 () Bool)

(assert (=> b!139347 (=> res!116153 e!92817)))

(declare-fun lt!217268 () (_ BitVec 64))

(assert (=> b!139347 (= res!116153 (not (= lt!217268 (bvadd lt!217268 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217265)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139347 (= lt!217268 (bitIndex!0 (size!2873 (buf!3289 thiss!1634)) (currentByte!6119 thiss!1634) (currentBit!6114 thiss!1634)))))

(assert (=> b!139347 (= lt!217265 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5010 BitStream!5010) Bool)

(assert (=> b!139347 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!217269 () Unit!8705)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5010) Unit!8705)

(assert (=> b!139347 (= lt!217269 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (= (and start!27082 res!116154) b!139343))

(assert (= (and b!139343 res!116151) b!139346))

(assert (= (and b!139346 res!116152) b!139347))

(assert (= (and b!139347 (not res!116153)) b!139344))

(assert (= start!27082 b!139345))

(declare-fun m!214361 () Bool)

(assert (=> start!27082 m!214361))

(declare-fun m!214363 () Bool)

(assert (=> start!27082 m!214363))

(declare-fun m!214365 () Bool)

(assert (=> b!139343 m!214365))

(declare-fun m!214367 () Bool)

(assert (=> b!139344 m!214367))

(declare-fun m!214369 () Bool)

(assert (=> b!139344 m!214369))

(declare-fun m!214371 () Bool)

(assert (=> b!139344 m!214371))

(declare-fun m!214373 () Bool)

(assert (=> b!139344 m!214373))

(declare-fun m!214375 () Bool)

(assert (=> b!139347 m!214375))

(declare-fun m!214377 () Bool)

(assert (=> b!139347 m!214377))

(declare-fun m!214379 () Bool)

(assert (=> b!139347 m!214379))

(declare-fun m!214381 () Bool)

(assert (=> b!139345 m!214381))

(check-sat (not b!139347) (not b!139343) (not b!139344) (not b!139345) (not start!27082))
