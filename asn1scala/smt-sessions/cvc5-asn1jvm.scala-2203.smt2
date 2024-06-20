; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55822 () Bool)

(assert start!55822)

(declare-fun b!259416 () Bool)

(declare-fun res!217311 () Bool)

(declare-fun e!180007 () Bool)

(assert (=> b!259416 (=> (not res!217311) (not e!180007))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259416 (= res!217311 (not (= from!526 nBits!535)))))

(declare-fun b!259417 () Bool)

(declare-fun e!180004 () Bool)

(assert (=> b!259417 (= e!180007 e!180004)))

(declare-fun res!217310 () Bool)

(assert (=> b!259417 (=> (not res!217310) (not e!180004))))

(declare-datatypes ((array!14190 0))(
  ( (array!14191 (arr!7201 (Array (_ BitVec 32) (_ BitVec 8))) (size!6214 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11350 0))(
  ( (BitStream!11351 (buf!6736 array!14190) (currentByte!12380 (_ BitVec 32)) (currentBit!12375 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22232 0))(
  ( (tuple2!22233 (_1!12052 Bool) (_2!12052 BitStream!11350)) )
))
(declare-fun lt!401236 () tuple2!22232)

(declare-fun expected!109 () Bool)

(assert (=> b!259417 (= res!217310 (= (_1!12052 lt!401236) expected!109))))

(declare-fun thiss!1754 () BitStream!11350)

(declare-fun readBit!0 (BitStream!11350) tuple2!22232)

(assert (=> b!259417 (= lt!401236 (readBit!0 thiss!1754))))

(declare-fun b!259418 () Bool)

(declare-fun e!180006 () Bool)

(declare-fun array_inv!5955 (array!14190) Bool)

(assert (=> b!259418 (= e!180006 (array_inv!5955 (buf!6736 thiss!1754)))))

(declare-fun res!217312 () Bool)

(assert (=> start!55822 (=> (not res!217312) (not e!180007))))

(assert (=> start!55822 (= res!217312 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55822 e!180007))

(assert (=> start!55822 true))

(declare-fun inv!12 (BitStream!11350) Bool)

(assert (=> start!55822 (and (inv!12 thiss!1754) e!180006)))

(declare-fun b!259419 () Bool)

(declare-fun res!217309 () Bool)

(assert (=> b!259419 (=> (not res!217309) (not e!180007))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259419 (= res!217309 (validate_offset_bits!1 ((_ sign_extend 32) (size!6214 (buf!6736 thiss!1754))) ((_ sign_extend 32) (currentByte!12380 thiss!1754)) ((_ sign_extend 32) (currentBit!12375 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259420 () Bool)

(assert (=> b!259420 (= e!180004 (not (bvslt (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bvsub nBits!535 from!526))))))

(assert (=> b!259420 (validate_offset_bits!1 ((_ sign_extend 32) (size!6214 (buf!6736 (_2!12052 lt!401236)))) ((_ sign_extend 32) (currentByte!12380 (_2!12052 lt!401236))) ((_ sign_extend 32) (currentBit!12375 (_2!12052 lt!401236))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18471 0))(
  ( (Unit!18472) )
))
(declare-fun lt!401237 () Unit!18471)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11350 BitStream!11350 (_ BitVec 64) (_ BitVec 64)) Unit!18471)

(assert (=> b!259420 (= lt!401237 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12052 lt!401236) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!55822 res!217312) b!259419))

(assert (= (and b!259419 res!217309) b!259416))

(assert (= (and b!259416 res!217311) b!259417))

(assert (= (and b!259417 res!217310) b!259420))

(assert (= start!55822 b!259418))

(declare-fun m!388739 () Bool)

(assert (=> b!259418 m!388739))

(declare-fun m!388741 () Bool)

(assert (=> b!259417 m!388741))

(declare-fun m!388743 () Bool)

(assert (=> start!55822 m!388743))

(declare-fun m!388745 () Bool)

(assert (=> b!259420 m!388745))

(declare-fun m!388747 () Bool)

(assert (=> b!259420 m!388747))

(declare-fun m!388749 () Bool)

(assert (=> b!259419 m!388749))

(push 1)

(assert (not b!259417))

(assert (not b!259418))

(assert (not start!55822))

(assert (not b!259419))

(assert (not b!259420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

