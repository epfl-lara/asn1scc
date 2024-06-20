; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72902 () Bool)

(assert start!72902)

(declare-fun res!266538 () Bool)

(declare-fun e!234102 () Bool)

(assert (=> start!72902 (=> (not res!266538) (not e!234102))))

(declare-datatypes ((array!20900 0))(
  ( (array!20901 (arr!10174 (Array (_ BitVec 32) (_ BitVec 8))) (size!9082 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14326 0))(
  ( (BitStream!14327 (buf!8224 array!20900) (currentByte!15223 (_ BitVec 32)) (currentBit!15218 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14326)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72902 (= res!266538 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9082 (buf!8224 thiss!877))) ((_ sign_extend 32) (currentByte!15223 thiss!877)) ((_ sign_extend 32) (currentBit!15218 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72902 e!234102))

(declare-fun e!234100 () Bool)

(declare-fun inv!12 (BitStream!14326) Bool)

(assert (=> start!72902 (and (inv!12 thiss!877) e!234100)))

(declare-fun b!324764 () Bool)

(declare-fun res!266539 () Bool)

(assert (=> b!324764 (=> (not res!266539) (not e!234102))))

(assert (=> b!324764 (= res!266539 (bvsge (currentBit!15218 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324765 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324765 (= e!234102 (not (invariant!0 (currentBit!15218 thiss!877) (currentByte!15223 thiss!877) (size!9082 (buf!8224 thiss!877)))))))

(declare-fun b!324766 () Bool)

(declare-fun array_inv!8634 (array!20900) Bool)

(assert (=> b!324766 (= e!234100 (array_inv!8634 (buf!8224 thiss!877)))))

(assert (= (and start!72902 res!266538) b!324764))

(assert (= (and b!324764 res!266539) b!324765))

(assert (= start!72902 b!324766))

(declare-fun m!462823 () Bool)

(assert (=> start!72902 m!462823))

(declare-fun m!462825 () Bool)

(assert (=> start!72902 m!462825))

(declare-fun m!462827 () Bool)

(assert (=> b!324765 m!462827))

(declare-fun m!462829 () Bool)

(assert (=> b!324766 m!462829))

(push 1)

(assert (not b!324765))

(assert (not b!324766))

(assert (not start!72902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106832 () Bool)

(assert (=> d!106832 (= (invariant!0 (currentBit!15218 thiss!877) (currentByte!15223 thiss!877) (size!9082 (buf!8224 thiss!877))) (and (bvsge (currentBit!15218 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15218 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15223 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15223 thiss!877) (size!9082 (buf!8224 thiss!877))) (and (= (currentBit!15218 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15223 thiss!877) (size!9082 (buf!8224 thiss!877)))))))))

(assert (=> b!324765 d!106832))

(declare-fun d!106840 () Bool)

(assert (=> d!106840 (= (array_inv!8634 (buf!8224 thiss!877)) (bvsge (size!9082 (buf!8224 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324766 d!106840))

(declare-fun d!106842 () Bool)

(assert (=> d!106842 (= (remainingBits!0 ((_ sign_extend 32) (size!9082 (buf!8224 thiss!877))) ((_ sign_extend 32) (currentByte!15223 thiss!877)) ((_ sign_extend 32) (currentBit!15218 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9082 (buf!8224 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15223 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15218 thiss!877)))))))

(assert (=> start!72902 d!106842))

(declare-fun d!106850 () Bool)

(assert (=> d!106850 (= (inv!12 thiss!877) (invariant!0 (currentBit!15218 thiss!877) (currentByte!15223 thiss!877) (size!9082 (buf!8224 thiss!877))))))

(declare-fun bs!28132 () Bool)

(assert (= bs!28132 d!106850))

(assert (=> bs!28132 m!462827))

(assert (=> start!72902 d!106850))

(push 1)

(assert (not d!106850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

