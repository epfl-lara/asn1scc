; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54858 () Bool)

(assert start!54858)

(declare-fun b!256750 () Bool)

(declare-fun e!177974 () Bool)

(declare-datatypes ((array!13889 0))(
  ( (array!13890 (arr!7082 (Array (_ BitVec 32) (_ BitVec 8))) (size!6095 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11112 0))(
  ( (BitStream!11113 (buf!6617 array!13889) (currentByte!12105 (_ BitVec 32)) (currentBit!12100 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11112)

(declare-fun array_inv!5836 (array!13889) Bool)

(assert (=> b!256750 (= e!177974 (array_inv!5836 (buf!6617 thiss!1754)))))

(declare-fun b!256747 () Bool)

(declare-fun res!215189 () Bool)

(declare-fun e!177975 () Bool)

(assert (=> b!256747 (=> (not res!215189) (not e!177975))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256747 (= res!215189 (validate_offset_bits!1 ((_ sign_extend 32) (size!6095 (buf!6617 thiss!1754))) ((_ sign_extend 32) (currentByte!12105 thiss!1754)) ((_ sign_extend 32) (currentBit!12100 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256749 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256749 (= e!177975 (not (invariant!0 (currentBit!12100 thiss!1754) (currentByte!12105 thiss!1754) (size!6095 (buf!6617 thiss!1754)))))))

(declare-fun res!215190 () Bool)

(assert (=> start!54858 (=> (not res!215190) (not e!177975))))

(assert (=> start!54858 (= res!215190 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54858 e!177975))

(assert (=> start!54858 true))

(declare-fun inv!12 (BitStream!11112) Bool)

(assert (=> start!54858 (and (inv!12 thiss!1754) e!177974)))

(declare-fun b!256748 () Bool)

(declare-fun res!215191 () Bool)

(assert (=> b!256748 (=> (not res!215191) (not e!177975))))

(assert (=> b!256748 (= res!215191 (= from!526 nBits!535))))

(assert (= (and start!54858 res!215190) b!256747))

(assert (= (and b!256747 res!215189) b!256748))

(assert (= (and b!256748 res!215191) b!256749))

(assert (= start!54858 b!256750))

(declare-fun m!386347 () Bool)

(assert (=> b!256750 m!386347))

(declare-fun m!386349 () Bool)

(assert (=> b!256747 m!386349))

(declare-fun m!386351 () Bool)

(assert (=> b!256749 m!386351))

(declare-fun m!386353 () Bool)

(assert (=> start!54858 m!386353))

(check-sat (not start!54858) (not b!256747) (not b!256749) (not b!256750))
(check-sat)
(get-model)

(declare-fun d!86108 () Bool)

(assert (=> d!86108 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12100 thiss!1754) (currentByte!12105 thiss!1754) (size!6095 (buf!6617 thiss!1754))))))

(declare-fun bs!21765 () Bool)

(assert (= bs!21765 d!86108))

(assert (=> bs!21765 m!386351))

(assert (=> start!54858 d!86108))

(declare-fun d!86112 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86112 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6095 (buf!6617 thiss!1754))) ((_ sign_extend 32) (currentByte!12105 thiss!1754)) ((_ sign_extend 32) (currentBit!12100 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6095 (buf!6617 thiss!1754))) ((_ sign_extend 32) (currentByte!12105 thiss!1754)) ((_ sign_extend 32) (currentBit!12100 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21766 () Bool)

(assert (= bs!21766 d!86112))

(declare-fun m!386363 () Bool)

(assert (=> bs!21766 m!386363))

(assert (=> b!256747 d!86112))

(declare-fun d!86116 () Bool)

(assert (=> d!86116 (= (invariant!0 (currentBit!12100 thiss!1754) (currentByte!12105 thiss!1754) (size!6095 (buf!6617 thiss!1754))) (and (bvsge (currentBit!12100 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12100 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12105 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12105 thiss!1754) (size!6095 (buf!6617 thiss!1754))) (and (= (currentBit!12100 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12105 thiss!1754) (size!6095 (buf!6617 thiss!1754)))))))))

(assert (=> b!256749 d!86116))

(declare-fun d!86126 () Bool)

(assert (=> d!86126 (= (array_inv!5836 (buf!6617 thiss!1754)) (bvsge (size!6095 (buf!6617 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256750 d!86126))

(check-sat (not d!86112) (not d!86108))
(check-sat)
