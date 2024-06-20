; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55150 () Bool)

(assert start!55150)

(declare-fun b!257364 () Bool)

(declare-fun e!178456 () Bool)

(assert (=> b!257364 (= e!178456 false)))

(declare-fun lt!398680 () (_ BitVec 64))

(declare-datatypes ((array!13986 0))(
  ( (array!13987 (arr!7120 (Array (_ BitVec 32) (_ BitVec 8))) (size!6133 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11188 0))(
  ( (BitStream!11189 (buf!6655 array!13986) (currentByte!12200 (_ BitVec 32)) (currentBit!12195 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22016 0))(
  ( (tuple2!22017 (_1!11944 Bool) (_2!11944 BitStream!11188)) )
))
(declare-fun lt!398679 () tuple2!22016)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257364 (= lt!398680 (bitIndex!0 (size!6133 (buf!6655 (_2!11944 lt!398679))) (currentByte!12200 (_2!11944 lt!398679)) (currentBit!12195 (_2!11944 lt!398679))))))

(declare-fun lt!398681 () (_ BitVec 64))

(declare-fun thiss!1754 () BitStream!11188)

(assert (=> b!257364 (= lt!398681 (bitIndex!0 (size!6133 (buf!6655 thiss!1754)) (currentByte!12200 thiss!1754) (currentBit!12195 thiss!1754)))))

(declare-fun b!257365 () Bool)

(declare-fun e!178455 () Bool)

(declare-fun array_inv!5874 (array!13986) Bool)

(assert (=> b!257365 (= e!178455 (array_inv!5874 (buf!6655 thiss!1754)))))

(declare-fun b!257366 () Bool)

(declare-fun res!215695 () Bool)

(declare-fun e!178454 () Bool)

(assert (=> b!257366 (=> (not res!215695) (not e!178454))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257366 (= res!215695 (validate_offset_bits!1 ((_ sign_extend 32) (size!6133 (buf!6655 thiss!1754))) ((_ sign_extend 32) (currentByte!12200 thiss!1754)) ((_ sign_extend 32) (currentBit!12195 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257367 () Bool)

(assert (=> b!257367 (= e!178454 e!178456)))

(declare-fun res!215692 () Bool)

(assert (=> b!257367 (=> (not res!215692) (not e!178456))))

(declare-fun expected!109 () Bool)

(assert (=> b!257367 (= res!215692 (and (= (_1!11944 lt!398679) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6133 (buf!6655 thiss!1754)) (size!6133 (buf!6655 (_2!11944 lt!398679))))))))

(declare-fun readBit!0 (BitStream!11188) tuple2!22016)

(assert (=> b!257367 (= lt!398679 (readBit!0 thiss!1754))))

(declare-fun b!257368 () Bool)

(declare-fun res!215694 () Bool)

(assert (=> b!257368 (=> (not res!215694) (not e!178454))))

(assert (=> b!257368 (= res!215694 (not (= from!526 nBits!535)))))

(declare-fun res!215693 () Bool)

(assert (=> start!55150 (=> (not res!215693) (not e!178454))))

(assert (=> start!55150 (= res!215693 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55150 e!178454))

(assert (=> start!55150 true))

(declare-fun inv!12 (BitStream!11188) Bool)

(assert (=> start!55150 (and (inv!12 thiss!1754) e!178455)))

(assert (= (and start!55150 res!215693) b!257366))

(assert (= (and b!257366 res!215695) b!257368))

(assert (= (and b!257368 res!215694) b!257367))

(assert (= (and b!257367 res!215692) b!257364))

(assert (= start!55150 b!257365))

(declare-fun m!386885 () Bool)

(assert (=> b!257367 m!386885))

(declare-fun m!386887 () Bool)

(assert (=> b!257366 m!386887))

(declare-fun m!386889 () Bool)

(assert (=> b!257364 m!386889))

(declare-fun m!386891 () Bool)

(assert (=> b!257364 m!386891))

(declare-fun m!386893 () Bool)

(assert (=> start!55150 m!386893))

(declare-fun m!386895 () Bool)

(assert (=> b!257365 m!386895))

(push 1)

(assert (not start!55150))

(assert (not b!257367))

(assert (not b!257365))

(assert (not b!257364))

(assert (not b!257366))

(check-sat)

(pop 1)

