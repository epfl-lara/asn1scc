; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72904 () Bool)

(assert start!72904)

(declare-fun res!266545 () Bool)

(declare-fun e!234111 () Bool)

(assert (=> start!72904 (=> (not res!266545) (not e!234111))))

(declare-datatypes ((array!20902 0))(
  ( (array!20903 (arr!10175 (Array (_ BitVec 32) (_ BitVec 8))) (size!9083 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14328 0))(
  ( (BitStream!14329 (buf!8225 array!20902) (currentByte!15224 (_ BitVec 32)) (currentBit!15219 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14328)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72904 (= res!266545 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9083 (buf!8225 thiss!877))) ((_ sign_extend 32) (currentByte!15224 thiss!877)) ((_ sign_extend 32) (currentBit!15219 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72904 e!234111))

(declare-fun e!234109 () Bool)

(declare-fun inv!12 (BitStream!14328) Bool)

(assert (=> start!72904 (and (inv!12 thiss!877) e!234109)))

(declare-fun b!324773 () Bool)

(declare-fun res!266544 () Bool)

(assert (=> b!324773 (=> (not res!266544) (not e!234111))))

(assert (=> b!324773 (= res!266544 (bvsge (currentBit!15219 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324774 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324774 (= e!234111 (not (invariant!0 (currentBit!15219 thiss!877) (currentByte!15224 thiss!877) (size!9083 (buf!8225 thiss!877)))))))

(declare-fun b!324775 () Bool)

(declare-fun array_inv!8635 (array!20902) Bool)

(assert (=> b!324775 (= e!234109 (array_inv!8635 (buf!8225 thiss!877)))))

(assert (= (and start!72904 res!266545) b!324773))

(assert (= (and b!324773 res!266544) b!324774))

(assert (= start!72904 b!324775))

(declare-fun m!462831 () Bool)

(assert (=> start!72904 m!462831))

(declare-fun m!462833 () Bool)

(assert (=> start!72904 m!462833))

(declare-fun m!462835 () Bool)

(assert (=> b!324774 m!462835))

(declare-fun m!462837 () Bool)

(assert (=> b!324775 m!462837))

(check-sat (not b!324774) (not b!324775) (not start!72904))
(check-sat)
(get-model)

(declare-fun d!106830 () Bool)

(assert (=> d!106830 (= (invariant!0 (currentBit!15219 thiss!877) (currentByte!15224 thiss!877) (size!9083 (buf!8225 thiss!877))) (and (bvsge (currentBit!15219 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15219 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15224 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15224 thiss!877) (size!9083 (buf!8225 thiss!877))) (and (= (currentBit!15219 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15224 thiss!877) (size!9083 (buf!8225 thiss!877)))))))))

(assert (=> b!324774 d!106830))

(declare-fun d!106834 () Bool)

(assert (=> d!106834 (= (array_inv!8635 (buf!8225 thiss!877)) (bvsge (size!9083 (buf!8225 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324775 d!106834))

(declare-fun d!106838 () Bool)

(assert (=> d!106838 (= (remainingBits!0 ((_ sign_extend 32) (size!9083 (buf!8225 thiss!877))) ((_ sign_extend 32) (currentByte!15224 thiss!877)) ((_ sign_extend 32) (currentBit!15219 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9083 (buf!8225 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15224 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15219 thiss!877)))))))

(assert (=> start!72904 d!106838))

(declare-fun d!106844 () Bool)

(assert (=> d!106844 (= (inv!12 thiss!877) (invariant!0 (currentBit!15219 thiss!877) (currentByte!15224 thiss!877) (size!9083 (buf!8225 thiss!877))))))

(declare-fun bs!28130 () Bool)

(assert (= bs!28130 d!106844))

(assert (=> bs!28130 m!462835))

(assert (=> start!72904 d!106844))

(check-sat (not d!106844))
