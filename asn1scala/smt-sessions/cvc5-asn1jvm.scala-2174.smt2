; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55144 () Bool)

(assert start!55144)

(declare-fun b!257319 () Bool)

(declare-fun res!215658 () Bool)

(declare-fun e!178420 () Bool)

(assert (=> b!257319 (=> (not res!215658) (not e!178420))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13980 0))(
  ( (array!13981 (arr!7117 (Array (_ BitVec 32) (_ BitVec 8))) (size!6130 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11182 0))(
  ( (BitStream!11183 (buf!6652 array!13980) (currentByte!12197 (_ BitVec 32)) (currentBit!12192 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11182)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257319 (= res!215658 (validate_offset_bits!1 ((_ sign_extend 32) (size!6130 (buf!6652 thiss!1754))) ((_ sign_extend 32) (currentByte!12197 thiss!1754)) ((_ sign_extend 32) (currentBit!12192 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257320 () Bool)

(declare-fun e!178418 () Bool)

(assert (=> b!257320 (= e!178418 false)))

(declare-fun lt!398654 () (_ BitVec 64))

(declare-datatypes ((tuple2!22010 0))(
  ( (tuple2!22011 (_1!11941 Bool) (_2!11941 BitStream!11182)) )
))
(declare-fun lt!398653 () tuple2!22010)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257320 (= lt!398654 (bitIndex!0 (size!6130 (buf!6652 (_2!11941 lt!398653))) (currentByte!12197 (_2!11941 lt!398653)) (currentBit!12192 (_2!11941 lt!398653))))))

(declare-fun lt!398652 () (_ BitVec 64))

(assert (=> b!257320 (= lt!398652 (bitIndex!0 (size!6130 (buf!6652 thiss!1754)) (currentByte!12197 thiss!1754) (currentBit!12192 thiss!1754)))))

(declare-fun b!257321 () Bool)

(declare-fun res!215659 () Bool)

(assert (=> b!257321 (=> (not res!215659) (not e!178420))))

(assert (=> b!257321 (= res!215659 (not (= from!526 nBits!535)))))

(declare-fun b!257322 () Bool)

(assert (=> b!257322 (= e!178420 e!178418)))

(declare-fun res!215657 () Bool)

(assert (=> b!257322 (=> (not res!215657) (not e!178418))))

(declare-fun expected!109 () Bool)

(assert (=> b!257322 (= res!215657 (and (= (_1!11941 lt!398653) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6130 (buf!6652 thiss!1754)) (size!6130 (buf!6652 (_2!11941 lt!398653))))))))

(declare-fun readBit!0 (BitStream!11182) tuple2!22010)

(assert (=> b!257322 (= lt!398653 (readBit!0 thiss!1754))))

(declare-fun b!257323 () Bool)

(declare-fun e!178417 () Bool)

(declare-fun array_inv!5871 (array!13980) Bool)

(assert (=> b!257323 (= e!178417 (array_inv!5871 (buf!6652 thiss!1754)))))

(declare-fun res!215656 () Bool)

(assert (=> start!55144 (=> (not res!215656) (not e!178420))))

(assert (=> start!55144 (= res!215656 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55144 e!178420))

(assert (=> start!55144 true))

(declare-fun inv!12 (BitStream!11182) Bool)

(assert (=> start!55144 (and (inv!12 thiss!1754) e!178417)))

(assert (= (and start!55144 res!215656) b!257319))

(assert (= (and b!257319 res!215658) b!257321))

(assert (= (and b!257321 res!215659) b!257322))

(assert (= (and b!257322 res!215657) b!257320))

(assert (= start!55144 b!257323))

(declare-fun m!386849 () Bool)

(assert (=> b!257319 m!386849))

(declare-fun m!386851 () Bool)

(assert (=> start!55144 m!386851))

(declare-fun m!386853 () Bool)

(assert (=> b!257322 m!386853))

(declare-fun m!386855 () Bool)

(assert (=> b!257320 m!386855))

(declare-fun m!386857 () Bool)

(assert (=> b!257320 m!386857))

(declare-fun m!386859 () Bool)

(assert (=> b!257323 m!386859))

(push 1)

(assert (not b!257320))

(assert (not b!257322))

(assert (not b!257319))

(assert (not start!55144))

(assert (not b!257323))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

