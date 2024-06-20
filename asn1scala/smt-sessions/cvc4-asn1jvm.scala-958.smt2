; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27078 () Bool)

(assert start!27078)

(declare-fun b!139313 () Bool)

(declare-fun res!116129 () Bool)

(declare-fun e!92787 () Bool)

(assert (=> b!139313 (=> (not res!116129) (not e!92787))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!139313 (= res!116129 (bvsge from!447 to!404))))

(declare-fun b!139314 () Bool)

(declare-fun e!92783 () Bool)

(declare-datatypes ((array!6343 0))(
  ( (array!6344 (arr!3566 (Array (_ BitVec 32) (_ BitVec 8))) (size!2871 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5006 0))(
  ( (BitStream!5007 (buf!3287 array!6343) (currentByte!6117 (_ BitVec 32)) (currentBit!6112 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5006)

(declare-fun array_inv!2660 (array!6343) Bool)

(assert (=> b!139314 (= e!92783 (array_inv!2660 (buf!3287 thiss!1634)))))

(declare-fun b!139315 () Bool)

(declare-fun e!92784 () Bool)

(assert (=> b!139315 (= e!92787 (not e!92784))))

(declare-fun res!116128 () Bool)

(assert (=> b!139315 (=> res!116128 e!92784)))

(declare-fun lt!217233 () (_ BitVec 64))

(declare-fun lt!217229 () (_ BitVec 64))

(assert (=> b!139315 (= res!116128 (not (= lt!217233 (bvadd lt!217233 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217229)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139315 (= lt!217233 (bitIndex!0 (size!2871 (buf!3287 thiss!1634)) (currentByte!6117 thiss!1634) (currentBit!6112 thiss!1634)))))

(assert (=> b!139315 (= lt!217229 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5006 BitStream!5006) Bool)

(assert (=> b!139315 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8701 0))(
  ( (Unit!8702) )
))
(declare-fun lt!217228 () Unit!8701)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5006) Unit!8701)

(assert (=> b!139315 (= lt!217228 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!116127 () Bool)

(assert (=> start!27078 (=> (not res!116127) (not e!92787))))

(declare-fun arr!237 () array!6343)

(assert (=> start!27078 (= res!116127 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2871 arr!237))))))

(assert (=> start!27078 e!92787))

(assert (=> start!27078 true))

(assert (=> start!27078 (array_inv!2660 arr!237)))

(declare-fun inv!12 (BitStream!5006) Bool)

(assert (=> start!27078 (and (inv!12 thiss!1634) e!92783)))

(declare-fun b!139316 () Bool)

(declare-fun res!116130 () Bool)

(assert (=> b!139316 (=> (not res!116130) (not e!92787))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139316 (= res!116130 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2871 (buf!3287 thiss!1634))) ((_ sign_extend 32) (currentByte!6117 thiss!1634)) ((_ sign_extend 32) (currentBit!6112 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139317 () Bool)

(assert (=> b!139317 (= e!92784 true)))

(declare-datatypes ((tuple2!12202 0))(
  ( (tuple2!12203 (_1!6427 BitStream!5006) (_2!6427 BitStream!5006)) )
))
(declare-fun lt!217231 () tuple2!12202)

(declare-datatypes ((tuple2!12204 0))(
  ( (tuple2!12205 (_1!6428 BitStream!5006) (_2!6428 array!6343)) )
))
(declare-fun lt!217232 () tuple2!12204)

(declare-fun readByteArrayLoopPure!0 (BitStream!5006 array!6343 (_ BitVec 32) (_ BitVec 32)) tuple2!12204)

(assert (=> b!139317 (= lt!217232 (readByteArrayLoopPure!0 (_1!6427 lt!217231) arr!237 from!447 to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139317 (validate_offset_bits!1 ((_ sign_extend 32) (size!2871 (buf!3287 thiss!1634))) ((_ sign_extend 32) (currentByte!6117 thiss!1634)) ((_ sign_extend 32) (currentBit!6112 thiss!1634)) lt!217229)))

(declare-fun lt!217230 () Unit!8701)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5006 array!6343 (_ BitVec 64)) Unit!8701)

(assert (=> b!139317 (= lt!217230 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3287 thiss!1634) lt!217229))))

(declare-fun reader!0 (BitStream!5006 BitStream!5006) tuple2!12202)

(assert (=> b!139317 (= lt!217231 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!27078 res!116127) b!139316))

(assert (= (and b!139316 res!116130) b!139313))

(assert (= (and b!139313 res!116129) b!139315))

(assert (= (and b!139315 (not res!116128)) b!139317))

(assert (= start!27078 b!139314))

(declare-fun m!214317 () Bool)

(assert (=> b!139316 m!214317))

(declare-fun m!214319 () Bool)

(assert (=> b!139314 m!214319))

(declare-fun m!214321 () Bool)

(assert (=> b!139317 m!214321))

(declare-fun m!214323 () Bool)

(assert (=> b!139317 m!214323))

(declare-fun m!214325 () Bool)

(assert (=> b!139317 m!214325))

(declare-fun m!214327 () Bool)

(assert (=> b!139317 m!214327))

(declare-fun m!214329 () Bool)

(assert (=> b!139315 m!214329))

(declare-fun m!214331 () Bool)

(assert (=> b!139315 m!214331))

(declare-fun m!214333 () Bool)

(assert (=> b!139315 m!214333))

(declare-fun m!214335 () Bool)

(assert (=> start!27078 m!214335))

(declare-fun m!214337 () Bool)

(assert (=> start!27078 m!214337))

(push 1)

(assert (not b!139316))

(assert (not b!139314))

(assert (not start!27078))

(assert (not b!139317))

(assert (not b!139315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

