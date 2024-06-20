; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55820 () Bool)

(assert start!55820)

(declare-fun b!259401 () Bool)

(declare-fun e!179992 () Bool)

(declare-fun from!526 () (_ BitVec 64))

(assert (=> b!259401 (= e!179992 (not (or (not (= (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((array!14188 0))(
  ( (array!14189 (arr!7200 (Array (_ BitVec 32) (_ BitVec 8))) (size!6213 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11348 0))(
  ( (BitStream!11349 (buf!6735 array!14188) (currentByte!12379 (_ BitVec 32)) (currentBit!12374 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22230 0))(
  ( (tuple2!22231 (_1!12051 Bool) (_2!12051 BitStream!11348)) )
))
(declare-fun lt!401230 () tuple2!22230)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259401 (validate_offset_bits!1 ((_ sign_extend 32) (size!6213 (buf!6735 (_2!12051 lt!401230)))) ((_ sign_extend 32) (currentByte!12379 (_2!12051 lt!401230))) ((_ sign_extend 32) (currentBit!12374 (_2!12051 lt!401230))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18469 0))(
  ( (Unit!18470) )
))
(declare-fun lt!401231 () Unit!18469)

(declare-fun thiss!1754 () BitStream!11348)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11348 BitStream!11348 (_ BitVec 64) (_ BitVec 64)) Unit!18469)

(assert (=> b!259401 (= lt!401231 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12051 lt!401230) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!217300 () Bool)

(declare-fun e!179995 () Bool)

(assert (=> start!55820 (=> (not res!217300) (not e!179995))))

(assert (=> start!55820 (= res!217300 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55820 e!179995))

(assert (=> start!55820 true))

(declare-fun e!179994 () Bool)

(declare-fun inv!12 (BitStream!11348) Bool)

(assert (=> start!55820 (and (inv!12 thiss!1754) e!179994)))

(declare-fun b!259402 () Bool)

(declare-fun res!217299 () Bool)

(assert (=> b!259402 (=> (not res!217299) (not e!179995))))

(assert (=> b!259402 (= res!217299 (validate_offset_bits!1 ((_ sign_extend 32) (size!6213 (buf!6735 thiss!1754))) ((_ sign_extend 32) (currentByte!12379 thiss!1754)) ((_ sign_extend 32) (currentBit!12374 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259403 () Bool)

(assert (=> b!259403 (= e!179995 e!179992)))

(declare-fun res!217298 () Bool)

(assert (=> b!259403 (=> (not res!217298) (not e!179992))))

(declare-fun expected!109 () Bool)

(assert (=> b!259403 (= res!217298 (= (_1!12051 lt!401230) expected!109))))

(declare-fun readBit!0 (BitStream!11348) tuple2!22230)

(assert (=> b!259403 (= lt!401230 (readBit!0 thiss!1754))))

(declare-fun b!259404 () Bool)

(declare-fun res!217297 () Bool)

(assert (=> b!259404 (=> (not res!217297) (not e!179995))))

(assert (=> b!259404 (= res!217297 (not (= from!526 nBits!535)))))

(declare-fun b!259405 () Bool)

(declare-fun array_inv!5954 (array!14188) Bool)

(assert (=> b!259405 (= e!179994 (array_inv!5954 (buf!6735 thiss!1754)))))

(assert (= (and start!55820 res!217300) b!259402))

(assert (= (and b!259402 res!217299) b!259404))

(assert (= (and b!259404 res!217297) b!259403))

(assert (= (and b!259403 res!217298) b!259401))

(assert (= start!55820 b!259405))

(declare-fun m!388727 () Bool)

(assert (=> b!259401 m!388727))

(declare-fun m!388729 () Bool)

(assert (=> b!259401 m!388729))

(declare-fun m!388731 () Bool)

(assert (=> b!259402 m!388731))

(declare-fun m!388733 () Bool)

(assert (=> b!259403 m!388733))

(declare-fun m!388735 () Bool)

(assert (=> b!259405 m!388735))

(declare-fun m!388737 () Bool)

(assert (=> start!55820 m!388737))

(push 1)

(assert (not b!259402))

(assert (not b!259401))

(assert (not b!259405))

(assert (not start!55820))

(assert (not b!259403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

