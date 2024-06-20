; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55160 () Bool)

(assert start!55160)

(declare-fun b!257439 () Bool)

(declare-fun e!178515 () Bool)

(declare-datatypes ((array!13996 0))(
  ( (array!13997 (arr!7125 (Array (_ BitVec 32) (_ BitVec 8))) (size!6138 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11198 0))(
  ( (BitStream!11199 (buf!6660 array!13996) (currentByte!12205 (_ BitVec 32)) (currentBit!12200 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11198)

(declare-fun array_inv!5879 (array!13996) Bool)

(assert (=> b!257439 (= e!178515 (array_inv!5879 (buf!6660 thiss!1754)))))

(declare-fun b!257440 () Bool)

(declare-fun res!215755 () Bool)

(declare-fun e!178516 () Bool)

(assert (=> b!257440 (=> (not res!215755) (not e!178516))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257440 (= res!215755 (not (= from!526 nBits!535)))))

(declare-fun b!257441 () Bool)

(declare-fun e!178513 () Bool)

(assert (=> b!257441 (= e!178516 e!178513)))

(declare-fun res!215752 () Bool)

(assert (=> b!257441 (=> (not res!215752) (not e!178513))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22026 0))(
  ( (tuple2!22027 (_1!11949 Bool) (_2!11949 BitStream!11198)) )
))
(declare-fun lt!398724 () tuple2!22026)

(assert (=> b!257441 (= res!215752 (and (= (_1!11949 lt!398724) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6138 (buf!6660 thiss!1754)) (size!6138 (buf!6660 (_2!11949 lt!398724))))))))

(declare-fun readBit!0 (BitStream!11198) tuple2!22026)

(assert (=> b!257441 (= lt!398724 (readBit!0 thiss!1754))))

(declare-fun b!257442 () Bool)

(declare-fun res!215754 () Bool)

(assert (=> b!257442 (=> (not res!215754) (not e!178516))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257442 (= res!215754 (validate_offset_bits!1 ((_ sign_extend 32) (size!6138 (buf!6660 thiss!1754))) ((_ sign_extend 32) (currentByte!12205 thiss!1754)) ((_ sign_extend 32) (currentBit!12200 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!215753 () Bool)

(assert (=> start!55160 (=> (not res!215753) (not e!178516))))

(assert (=> start!55160 (= res!215753 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55160 e!178516))

(assert (=> start!55160 true))

(declare-fun inv!12 (BitStream!11198) Bool)

(assert (=> start!55160 (and (inv!12 thiss!1754) e!178515)))

(declare-fun b!257443 () Bool)

(assert (=> b!257443 (= e!178513 false)))

(declare-fun lt!398726 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257443 (= lt!398726 (bitIndex!0 (size!6138 (buf!6660 (_2!11949 lt!398724))) (currentByte!12205 (_2!11949 lt!398724)) (currentBit!12200 (_2!11949 lt!398724))))))

(declare-fun lt!398725 () (_ BitVec 64))

(assert (=> b!257443 (= lt!398725 (bitIndex!0 (size!6138 (buf!6660 thiss!1754)) (currentByte!12205 thiss!1754) (currentBit!12200 thiss!1754)))))

(assert (= (and start!55160 res!215753) b!257442))

(assert (= (and b!257442 res!215754) b!257440))

(assert (= (and b!257440 res!215755) b!257441))

(assert (= (and b!257441 res!215752) b!257443))

(assert (= start!55160 b!257439))

(declare-fun m!386945 () Bool)

(assert (=> start!55160 m!386945))

(declare-fun m!386947 () Bool)

(assert (=> b!257439 m!386947))

(declare-fun m!386949 () Bool)

(assert (=> b!257442 m!386949))

(declare-fun m!386951 () Bool)

(assert (=> b!257443 m!386951))

(declare-fun m!386953 () Bool)

(assert (=> b!257443 m!386953))

(declare-fun m!386955 () Bool)

(assert (=> b!257441 m!386955))

(push 1)

(assert (not b!257443))

(assert (not b!257439))

(assert (not start!55160))

(assert (not b!257441))

(assert (not b!257442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

