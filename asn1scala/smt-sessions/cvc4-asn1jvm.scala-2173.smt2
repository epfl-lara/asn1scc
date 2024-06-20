; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55142 () Bool)

(assert start!55142)

(declare-fun b!257304 () Bool)

(declare-fun res!215647 () Bool)

(declare-fun e!178406 () Bool)

(assert (=> b!257304 (=> (not res!215647) (not e!178406))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257304 (= res!215647 (not (= from!526 nBits!535)))))

(declare-fun b!257305 () Bool)

(declare-fun e!178405 () Bool)

(assert (=> b!257305 (= e!178405 false)))

(declare-fun lt!398645 () (_ BitVec 64))

(declare-datatypes ((array!13978 0))(
  ( (array!13979 (arr!7116 (Array (_ BitVec 32) (_ BitVec 8))) (size!6129 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11180 0))(
  ( (BitStream!11181 (buf!6651 array!13978) (currentByte!12196 (_ BitVec 32)) (currentBit!12191 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22008 0))(
  ( (tuple2!22009 (_1!11940 Bool) (_2!11940 BitStream!11180)) )
))
(declare-fun lt!398643 () tuple2!22008)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257305 (= lt!398645 (bitIndex!0 (size!6129 (buf!6651 (_2!11940 lt!398643))) (currentByte!12196 (_2!11940 lt!398643)) (currentBit!12191 (_2!11940 lt!398643))))))

(declare-fun lt!398644 () (_ BitVec 64))

(declare-fun thiss!1754 () BitStream!11180)

(assert (=> b!257305 (= lt!398644 (bitIndex!0 (size!6129 (buf!6651 thiss!1754)) (currentByte!12196 thiss!1754) (currentBit!12191 thiss!1754)))))

(declare-fun b!257306 () Bool)

(declare-fun res!215646 () Bool)

(assert (=> b!257306 (=> (not res!215646) (not e!178406))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257306 (= res!215646 (validate_offset_bits!1 ((_ sign_extend 32) (size!6129 (buf!6651 thiss!1754))) ((_ sign_extend 32) (currentByte!12196 thiss!1754)) ((_ sign_extend 32) (currentBit!12191 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257307 () Bool)

(assert (=> b!257307 (= e!178406 e!178405)))

(declare-fun res!215645 () Bool)

(assert (=> b!257307 (=> (not res!215645) (not e!178405))))

(declare-fun expected!109 () Bool)

(assert (=> b!257307 (= res!215645 (and (= (_1!11940 lt!398643) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6129 (buf!6651 thiss!1754)) (size!6129 (buf!6651 (_2!11940 lt!398643))))))))

(declare-fun readBit!0 (BitStream!11180) tuple2!22008)

(assert (=> b!257307 (= lt!398643 (readBit!0 thiss!1754))))

(declare-fun b!257308 () Bool)

(declare-fun e!178407 () Bool)

(declare-fun array_inv!5870 (array!13978) Bool)

(assert (=> b!257308 (= e!178407 (array_inv!5870 (buf!6651 thiss!1754)))))

(declare-fun res!215644 () Bool)

(assert (=> start!55142 (=> (not res!215644) (not e!178406))))

(assert (=> start!55142 (= res!215644 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55142 e!178406))

(assert (=> start!55142 true))

(declare-fun inv!12 (BitStream!11180) Bool)

(assert (=> start!55142 (and (inv!12 thiss!1754) e!178407)))

(assert (= (and start!55142 res!215644) b!257306))

(assert (= (and b!257306 res!215646) b!257304))

(assert (= (and b!257304 res!215647) b!257307))

(assert (= (and b!257307 res!215645) b!257305))

(assert (= start!55142 b!257308))

(declare-fun m!386837 () Bool)

(assert (=> b!257305 m!386837))

(declare-fun m!386839 () Bool)

(assert (=> b!257305 m!386839))

(declare-fun m!386841 () Bool)

(assert (=> start!55142 m!386841))

(declare-fun m!386843 () Bool)

(assert (=> b!257307 m!386843))

(declare-fun m!386845 () Bool)

(assert (=> b!257308 m!386845))

(declare-fun m!386847 () Bool)

(assert (=> b!257306 m!386847))

(push 1)

(assert (not b!257307))

(assert (not start!55142))

(assert (not b!257308))

(assert (not b!257305))

(assert (not b!257306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

