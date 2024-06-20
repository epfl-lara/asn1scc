; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55826 () Bool)

(assert start!55826)

(declare-fun b!259446 () Bool)

(declare-fun e!180028 () Bool)

(declare-datatypes ((array!14194 0))(
  ( (array!14195 (arr!7203 (Array (_ BitVec 32) (_ BitVec 8))) (size!6216 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11354 0))(
  ( (BitStream!11355 (buf!6738 array!14194) (currentByte!12382 (_ BitVec 32)) (currentBit!12377 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11354)

(declare-fun array_inv!5957 (array!14194) Bool)

(assert (=> b!259446 (= e!180028 (array_inv!5957 (buf!6738 thiss!1754)))))

(declare-fun b!259447 () Bool)

(declare-fun e!180031 () Bool)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> b!259447 (= e!180031 (not (bvslt (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bvsub nBits!535 from!526))))))

(declare-datatypes ((tuple2!22236 0))(
  ( (tuple2!22237 (_1!12054 Bool) (_2!12054 BitStream!11354)) )
))
(declare-fun lt!401248 () tuple2!22236)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259447 (validate_offset_bits!1 ((_ sign_extend 32) (size!6216 (buf!6738 (_2!12054 lt!401248)))) ((_ sign_extend 32) (currentByte!12382 (_2!12054 lt!401248))) ((_ sign_extend 32) (currentBit!12377 (_2!12054 lt!401248))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18475 0))(
  ( (Unit!18476) )
))
(declare-fun lt!401249 () Unit!18475)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11354 BitStream!11354 (_ BitVec 64) (_ BitVec 64)) Unit!18475)

(assert (=> b!259447 (= lt!401249 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12054 lt!401248) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259448 () Bool)

(declare-fun res!217333 () Bool)

(declare-fun e!180030 () Bool)

(assert (=> b!259448 (=> (not res!217333) (not e!180030))))

(assert (=> b!259448 (= res!217333 (validate_offset_bits!1 ((_ sign_extend 32) (size!6216 (buf!6738 thiss!1754))) ((_ sign_extend 32) (currentByte!12382 thiss!1754)) ((_ sign_extend 32) (currentBit!12377 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259449 () Bool)

(assert (=> b!259449 (= e!180030 e!180031)))

(declare-fun res!217334 () Bool)

(assert (=> b!259449 (=> (not res!217334) (not e!180031))))

(declare-fun expected!109 () Bool)

(assert (=> b!259449 (= res!217334 (= (_1!12054 lt!401248) expected!109))))

(declare-fun readBit!0 (BitStream!11354) tuple2!22236)

(assert (=> b!259449 (= lt!401248 (readBit!0 thiss!1754))))

(declare-fun res!217335 () Bool)

(assert (=> start!55826 (=> (not res!217335) (not e!180030))))

(assert (=> start!55826 (= res!217335 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55826 e!180030))

(assert (=> start!55826 true))

(declare-fun inv!12 (BitStream!11354) Bool)

(assert (=> start!55826 (and (inv!12 thiss!1754) e!180028)))

(declare-fun b!259450 () Bool)

(declare-fun res!217336 () Bool)

(assert (=> b!259450 (=> (not res!217336) (not e!180030))))

(assert (=> b!259450 (= res!217336 (not (= from!526 nBits!535)))))

(assert (= (and start!55826 res!217335) b!259448))

(assert (= (and b!259448 res!217333) b!259450))

(assert (= (and b!259450 res!217336) b!259449))

(assert (= (and b!259449 res!217334) b!259447))

(assert (= start!55826 b!259446))

(declare-fun m!388763 () Bool)

(assert (=> b!259448 m!388763))

(declare-fun m!388765 () Bool)

(assert (=> b!259449 m!388765))

(declare-fun m!388767 () Bool)

(assert (=> start!55826 m!388767))

(declare-fun m!388769 () Bool)

(assert (=> b!259446 m!388769))

(declare-fun m!388771 () Bool)

(assert (=> b!259447 m!388771))

(declare-fun m!388773 () Bool)

(assert (=> b!259447 m!388773))

(push 1)

(assert (not start!55826))

(assert (not b!259447))

(assert (not b!259449))

(assert (not b!259446))

(assert (not b!259448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

