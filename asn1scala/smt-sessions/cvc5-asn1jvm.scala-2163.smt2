; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54886 () Bool)

(assert start!54886)

(declare-fun b!256773 () Bool)

(declare-fun e!177993 () Bool)

(declare-datatypes ((array!13896 0))(
  ( (array!13897 (arr!7084 (Array (_ BitVec 32) (_ BitVec 8))) (size!6097 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11116 0))(
  ( (BitStream!11117 (buf!6619 array!13896) (currentByte!12113 (_ BitVec 32)) (currentBit!12108 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11116)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256773 (= e!177993 (not (invariant!0 (currentBit!12108 thiss!1754) (currentByte!12113 thiss!1754) (size!6097 (buf!6619 thiss!1754)))))))

(declare-fun b!256772 () Bool)

(declare-fun res!215209 () Bool)

(assert (=> b!256772 (=> (not res!215209) (not e!177993))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!256772 (= res!215209 (= from!526 nBits!535))))

(declare-fun b!256774 () Bool)

(declare-fun e!177994 () Bool)

(declare-fun array_inv!5838 (array!13896) Bool)

(assert (=> b!256774 (= e!177994 (array_inv!5838 (buf!6619 thiss!1754)))))

(declare-fun b!256771 () Bool)

(declare-fun res!215208 () Bool)

(assert (=> b!256771 (=> (not res!215208) (not e!177993))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256771 (= res!215208 (validate_offset_bits!1 ((_ sign_extend 32) (size!6097 (buf!6619 thiss!1754))) ((_ sign_extend 32) (currentByte!12113 thiss!1754)) ((_ sign_extend 32) (currentBit!12108 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!215207 () Bool)

(assert (=> start!54886 (=> (not res!215207) (not e!177993))))

(assert (=> start!54886 (= res!215207 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54886 e!177993))

(assert (=> start!54886 true))

(declare-fun inv!12 (BitStream!11116) Bool)

(assert (=> start!54886 (and (inv!12 thiss!1754) e!177994)))

(assert (= (and start!54886 res!215207) b!256771))

(assert (= (and b!256771 res!215208) b!256772))

(assert (= (and b!256772 res!215209) b!256773))

(assert (= start!54886 b!256774))

(declare-fun m!386369 () Bool)

(assert (=> b!256773 m!386369))

(declare-fun m!386371 () Bool)

(assert (=> b!256774 m!386371))

(declare-fun m!386373 () Bool)

(assert (=> b!256771 m!386373))

(declare-fun m!386375 () Bool)

(assert (=> start!54886 m!386375))

(push 1)

(assert (not b!256771))

(assert (not start!54886))

(assert (not b!256773))

(assert (not b!256774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86136 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86136 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6097 (buf!6619 thiss!1754))) ((_ sign_extend 32) (currentByte!12113 thiss!1754)) ((_ sign_extend 32) (currentBit!12108 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6097 (buf!6619 thiss!1754))) ((_ sign_extend 32) (currentByte!12113 thiss!1754)) ((_ sign_extend 32) (currentBit!12108 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21774 () Bool)

(assert (= bs!21774 d!86136))

(declare-fun m!386393 () Bool)

(assert (=> bs!21774 m!386393))

(assert (=> b!256771 d!86136))

(declare-fun d!86140 () Bool)

(assert (=> d!86140 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12108 thiss!1754) (currentByte!12113 thiss!1754) (size!6097 (buf!6619 thiss!1754))))))

(declare-fun bs!21775 () Bool)

(assert (= bs!21775 d!86140))

(assert (=> bs!21775 m!386369))

(assert (=> start!54886 d!86140))

(declare-fun d!86142 () Bool)

(assert (=> d!86142 (= (invariant!0 (currentBit!12108 thiss!1754) (currentByte!12113 thiss!1754) (size!6097 (buf!6619 thiss!1754))) (and (bvsge (currentBit!12108 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12108 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12113 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12113 thiss!1754) (size!6097 (buf!6619 thiss!1754))) (and (= (currentBit!12108 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12113 thiss!1754) (size!6097 (buf!6619 thiss!1754)))))))))

(assert (=> b!256773 d!86142))

(declare-fun d!86150 () Bool)

(assert (=> d!86150 (= (array_inv!5838 (buf!6619 thiss!1754)) (bvsge (size!6097 (buf!6619 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256774 d!86150))

(push 1)

(assert (not d!86140))

(assert (not d!86136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

