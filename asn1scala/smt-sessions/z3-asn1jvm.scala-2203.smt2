; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55824 () Bool)

(assert start!55824)

(declare-fun b!259432 () Bool)

(declare-fun e!180018 () Bool)

(declare-datatypes ((array!14192 0))(
  ( (array!14193 (arr!7202 (Array (_ BitVec 32) (_ BitVec 8))) (size!6215 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11352 0))(
  ( (BitStream!11353 (buf!6737 array!14192) (currentByte!12381 (_ BitVec 32)) (currentBit!12376 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11352)

(declare-fun array_inv!5956 (array!14192) Bool)

(assert (=> b!259432 (= e!180018 (array_inv!5956 (buf!6737 thiss!1754)))))

(declare-fun b!259433 () Bool)

(declare-fun res!217322 () Bool)

(declare-fun e!180019 () Bool)

(assert (=> b!259433 (=> (not res!217322) (not e!180019))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259433 (= res!217322 (not (= from!526 nBits!535)))))

(declare-fun b!259434 () Bool)

(declare-fun e!180016 () Bool)

(assert (=> b!259434 (= e!180019 e!180016)))

(declare-fun res!217323 () Bool)

(assert (=> b!259434 (=> (not res!217323) (not e!180016))))

(declare-datatypes ((tuple2!22234 0))(
  ( (tuple2!22235 (_1!12053 Bool) (_2!12053 BitStream!11352)) )
))
(declare-fun lt!401242 () tuple2!22234)

(declare-fun expected!109 () Bool)

(assert (=> b!259434 (= res!217323 (= (_1!12053 lt!401242) expected!109))))

(declare-fun readBit!0 (BitStream!11352) tuple2!22234)

(assert (=> b!259434 (= lt!401242 (readBit!0 thiss!1754))))

(declare-fun b!259435 () Bool)

(assert (=> b!259435 (= e!180016 (not (bvslt (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bvsub nBits!535 from!526))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259435 (validate_offset_bits!1 ((_ sign_extend 32) (size!6215 (buf!6737 (_2!12053 lt!401242)))) ((_ sign_extend 32) (currentByte!12381 (_2!12053 lt!401242))) ((_ sign_extend 32) (currentBit!12376 (_2!12053 lt!401242))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18473 0))(
  ( (Unit!18474) )
))
(declare-fun lt!401243 () Unit!18473)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11352 BitStream!11352 (_ BitVec 64) (_ BitVec 64)) Unit!18473)

(assert (=> b!259435 (= lt!401243 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12053 lt!401242) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259431 () Bool)

(declare-fun res!217324 () Bool)

(assert (=> b!259431 (=> (not res!217324) (not e!180019))))

(assert (=> b!259431 (= res!217324 (validate_offset_bits!1 ((_ sign_extend 32) (size!6215 (buf!6737 thiss!1754))) ((_ sign_extend 32) (currentByte!12381 thiss!1754)) ((_ sign_extend 32) (currentBit!12376 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!217321 () Bool)

(assert (=> start!55824 (=> (not res!217321) (not e!180019))))

(assert (=> start!55824 (= res!217321 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55824 e!180019))

(assert (=> start!55824 true))

(declare-fun inv!12 (BitStream!11352) Bool)

(assert (=> start!55824 (and (inv!12 thiss!1754) e!180018)))

(assert (= (and start!55824 res!217321) b!259431))

(assert (= (and b!259431 res!217324) b!259433))

(assert (= (and b!259433 res!217322) b!259434))

(assert (= (and b!259434 res!217323) b!259435))

(assert (= start!55824 b!259432))

(declare-fun m!388751 () Bool)

(assert (=> b!259432 m!388751))

(declare-fun m!388753 () Bool)

(assert (=> b!259431 m!388753))

(declare-fun m!388755 () Bool)

(assert (=> start!55824 m!388755))

(declare-fun m!388757 () Bool)

(assert (=> b!259434 m!388757))

(declare-fun m!388759 () Bool)

(assert (=> b!259435 m!388759))

(declare-fun m!388761 () Bool)

(assert (=> b!259435 m!388761))

(check-sat (not start!55824) (not b!259434) (not b!259435) (not b!259432) (not b!259431))
(check-sat)
