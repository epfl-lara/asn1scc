; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54888 () Bool)

(assert start!54888)

(declare-fun b!256783 () Bool)

(declare-fun res!215216 () Bool)

(declare-fun e!178001 () Bool)

(assert (=> b!256783 (=> (not res!215216) (not e!178001))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13898 0))(
  ( (array!13899 (arr!7085 (Array (_ BitVec 32) (_ BitVec 8))) (size!6098 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11118 0))(
  ( (BitStream!11119 (buf!6620 array!13898) (currentByte!12114 (_ BitVec 32)) (currentBit!12109 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11118)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256783 (= res!215216 (validate_offset_bits!1 ((_ sign_extend 32) (size!6098 (buf!6620 thiss!1754))) ((_ sign_extend 32) (currentByte!12114 thiss!1754)) ((_ sign_extend 32) (currentBit!12109 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256785 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256785 (= e!178001 (not (invariant!0 (currentBit!12109 thiss!1754) (currentByte!12114 thiss!1754) (size!6098 (buf!6620 thiss!1754)))))))

(declare-fun b!256786 () Bool)

(declare-fun e!178002 () Bool)

(declare-fun array_inv!5839 (array!13898) Bool)

(assert (=> b!256786 (= e!178002 (array_inv!5839 (buf!6620 thiss!1754)))))

(declare-fun res!215217 () Bool)

(assert (=> start!54888 (=> (not res!215217) (not e!178001))))

(assert (=> start!54888 (= res!215217 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54888 e!178001))

(assert (=> start!54888 true))

(declare-fun inv!12 (BitStream!11118) Bool)

(assert (=> start!54888 (and (inv!12 thiss!1754) e!178002)))

(declare-fun b!256784 () Bool)

(declare-fun res!215218 () Bool)

(assert (=> b!256784 (=> (not res!215218) (not e!178001))))

(assert (=> b!256784 (= res!215218 (= from!526 nBits!535))))

(assert (= (and start!54888 res!215217) b!256783))

(assert (= (and b!256783 res!215216) b!256784))

(assert (= (and b!256784 res!215218) b!256785))

(assert (= start!54888 b!256786))

(declare-fun m!386377 () Bool)

(assert (=> b!256783 m!386377))

(declare-fun m!386379 () Bool)

(assert (=> b!256785 m!386379))

(declare-fun m!386381 () Bool)

(assert (=> b!256786 m!386381))

(declare-fun m!386383 () Bool)

(assert (=> start!54888 m!386383))

(check-sat (not b!256786) (not b!256783) (not start!54888) (not b!256785))
(check-sat)
(get-model)

(declare-fun d!86134 () Bool)

(assert (=> d!86134 (= (array_inv!5839 (buf!6620 thiss!1754)) (bvsge (size!6098 (buf!6620 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256786 d!86134))

(declare-fun d!86138 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86138 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6098 (buf!6620 thiss!1754))) ((_ sign_extend 32) (currentByte!12114 thiss!1754)) ((_ sign_extend 32) (currentBit!12109 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6098 (buf!6620 thiss!1754))) ((_ sign_extend 32) (currentByte!12114 thiss!1754)) ((_ sign_extend 32) (currentBit!12109 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21776 () Bool)

(assert (= bs!21776 d!86138))

(declare-fun m!386395 () Bool)

(assert (=> bs!21776 m!386395))

(assert (=> b!256783 d!86138))

(declare-fun d!86144 () Bool)

(assert (=> d!86144 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12109 thiss!1754) (currentByte!12114 thiss!1754) (size!6098 (buf!6620 thiss!1754))))))

(declare-fun bs!21777 () Bool)

(assert (= bs!21777 d!86144))

(assert (=> bs!21777 m!386379))

(assert (=> start!54888 d!86144))

(declare-fun d!86148 () Bool)

(assert (=> d!86148 (= (invariant!0 (currentBit!12109 thiss!1754) (currentByte!12114 thiss!1754) (size!6098 (buf!6620 thiss!1754))) (and (bvsge (currentBit!12109 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12109 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12114 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12114 thiss!1754) (size!6098 (buf!6620 thiss!1754))) (and (= (currentBit!12109 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12114 thiss!1754) (size!6098 (buf!6620 thiss!1754)))))))))

(assert (=> b!256785 d!86148))

(check-sat (not d!86138) (not d!86144))
