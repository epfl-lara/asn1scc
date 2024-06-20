; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55132 () Bool)

(assert start!55132)

(declare-fun res!215585 () Bool)

(declare-fun e!178348 () Bool)

(assert (=> start!55132 (=> (not res!215585) (not e!178348))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55132 (= res!215585 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55132 e!178348))

(assert (=> start!55132 true))

(declare-datatypes ((array!13968 0))(
  ( (array!13969 (arr!7111 (Array (_ BitVec 32) (_ BitVec 8))) (size!6124 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11170 0))(
  ( (BitStream!11171 (buf!6646 array!13968) (currentByte!12191 (_ BitVec 32)) (currentBit!12186 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11170)

(declare-fun e!178346 () Bool)

(declare-fun inv!12 (BitStream!11170) Bool)

(assert (=> start!55132 (and (inv!12 thiss!1754) e!178346)))

(declare-fun b!257229 () Bool)

(declare-fun res!215586 () Bool)

(assert (=> b!257229 (=> (not res!215586) (not e!178348))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257229 (= res!215586 (validate_offset_bits!1 ((_ sign_extend 32) (size!6124 (buf!6646 thiss!1754))) ((_ sign_extend 32) (currentByte!12191 thiss!1754)) ((_ sign_extend 32) (currentBit!12186 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257230 () Bool)

(declare-fun e!178347 () Bool)

(assert (=> b!257230 (= e!178348 e!178347)))

(declare-fun res!215584 () Bool)

(assert (=> b!257230 (=> (not res!215584) (not e!178347))))

(declare-datatypes ((tuple2!21998 0))(
  ( (tuple2!21999 (_1!11935 Bool) (_2!11935 BitStream!11170)) )
))
(declare-fun lt!398600 () tuple2!21998)

(declare-fun expected!109 () Bool)

(assert (=> b!257230 (= res!215584 (not (= (_1!11935 lt!398600) expected!109)))))

(declare-fun readBit!0 (BitStream!11170) tuple2!21998)

(assert (=> b!257230 (= lt!398600 (readBit!0 thiss!1754))))

(declare-fun b!257231 () Bool)

(declare-fun res!215587 () Bool)

(assert (=> b!257231 (=> (not res!215587) (not e!178348))))

(assert (=> b!257231 (= res!215587 (not (= from!526 nBits!535)))))

(declare-fun b!257232 () Bool)

(assert (=> b!257232 (= e!178347 false)))

(declare-fun lt!398599 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257232 (= lt!398599 (bitIndex!0 (size!6124 (buf!6646 (_2!11935 lt!398600))) (currentByte!12191 (_2!11935 lt!398600)) (currentBit!12186 (_2!11935 lt!398600))))))

(declare-fun lt!398598 () (_ BitVec 64))

(assert (=> b!257232 (= lt!398598 (bitIndex!0 (size!6124 (buf!6646 thiss!1754)) (currentByte!12191 thiss!1754) (currentBit!12186 thiss!1754)))))

(declare-fun b!257233 () Bool)

(declare-fun array_inv!5865 (array!13968) Bool)

(assert (=> b!257233 (= e!178346 (array_inv!5865 (buf!6646 thiss!1754)))))

(assert (= (and start!55132 res!215585) b!257229))

(assert (= (and b!257229 res!215586) b!257231))

(assert (= (and b!257231 res!215587) b!257230))

(assert (= (and b!257230 res!215584) b!257232))

(assert (= start!55132 b!257233))

(declare-fun m!386777 () Bool)

(assert (=> b!257232 m!386777))

(declare-fun m!386779 () Bool)

(assert (=> b!257232 m!386779))

(declare-fun m!386781 () Bool)

(assert (=> start!55132 m!386781))

(declare-fun m!386783 () Bool)

(assert (=> b!257230 m!386783))

(declare-fun m!386785 () Bool)

(assert (=> b!257233 m!386785))

(declare-fun m!386787 () Bool)

(assert (=> b!257229 m!386787))

(push 1)

(assert (not start!55132))

(assert (not b!257229))

(assert (not b!257232))

(assert (not b!257233))

(assert (not b!257230))

(check-sat)

(pop 1)

