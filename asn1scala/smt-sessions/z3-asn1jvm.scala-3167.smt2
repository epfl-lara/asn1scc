; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72762 () Bool)

(assert start!72762)

(declare-fun b!324484 () Bool)

(declare-fun res!266302 () Bool)

(declare-fun e!233918 () Bool)

(assert (=> b!324484 (=> (not res!266302) (not e!233918))))

(declare-datatypes ((array!20860 0))(
  ( (array!20861 (arr!10160 (Array (_ BitVec 32) (_ BitVec 8))) (size!9068 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14298 0))(
  ( (BitStream!14299 (buf!8210 array!20860) (currentByte!15177 (_ BitVec 32)) (currentBit!15172 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14298)

(assert (=> b!324484 (= res!266302 (bvslt (currentBit!15172 thiss!877) #b00000000000000000000000000000111))))

(declare-fun res!266300 () Bool)

(assert (=> start!72762 (=> (not res!266300) (not e!233918))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72762 (= res!266300 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))) ((_ sign_extend 32) (currentByte!15177 thiss!877)) ((_ sign_extend 32) (currentBit!15172 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72762 e!233918))

(declare-fun e!233919 () Bool)

(declare-fun inv!12 (BitStream!14298) Bool)

(assert (=> start!72762 (and (inv!12 thiss!877) e!233919)))

(declare-fun b!324487 () Bool)

(declare-fun array_inv!8620 (array!20860) Bool)

(assert (=> b!324487 (= e!233919 (array_inv!8620 (buf!8210 thiss!877)))))

(declare-fun b!324486 () Bool)

(assert (=> b!324486 (= e!233918 (and (bvsle ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15177 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15172 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15177 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15172 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!324485 () Bool)

(declare-fun res!266301 () Bool)

(assert (=> b!324485 (=> (not res!266301) (not e!233918))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324485 (= res!266301 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9068 (buf!8210 thiss!877)) (currentByte!15177 thiss!877) (currentBit!15172 thiss!877))) (bitIndex!0 (size!9068 (buf!8210 thiss!877)) (currentByte!15177 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15172 thiss!877)))))))

(assert (= (and start!72762 res!266300) b!324484))

(assert (= (and b!324484 res!266302) b!324485))

(assert (= (and b!324485 res!266301) b!324486))

(assert (= start!72762 b!324487))

(declare-fun m!462599 () Bool)

(assert (=> start!72762 m!462599))

(declare-fun m!462601 () Bool)

(assert (=> start!72762 m!462601))

(declare-fun m!462603 () Bool)

(assert (=> b!324487 m!462603))

(declare-fun m!462605 () Bool)

(assert (=> b!324485 m!462605))

(declare-fun m!462607 () Bool)

(assert (=> b!324485 m!462607))

(check-sat (not b!324485) (not start!72762) (not b!324487))
(check-sat)
(get-model)

(declare-fun d!106676 () Bool)

(declare-fun e!233931 () Bool)

(assert (=> d!106676 e!233931))

(declare-fun res!266316 () Bool)

(assert (=> d!106676 (=> (not res!266316) (not e!233931))))

(declare-fun lt!446980 () (_ BitVec 64))

(declare-fun lt!446981 () (_ BitVec 64))

(declare-fun lt!446984 () (_ BitVec 64))

(assert (=> d!106676 (= res!266316 (= lt!446980 (bvsub lt!446981 lt!446984)))))

(assert (=> d!106676 (or (= (bvand lt!446981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446984 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446981 lt!446984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106676 (= lt!446984 (remainingBits!0 ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))) ((_ sign_extend 32) (currentByte!15177 thiss!877)) ((_ sign_extend 32) (currentBit!15172 thiss!877))))))

(declare-fun lt!446979 () (_ BitVec 64))

(declare-fun lt!446982 () (_ BitVec 64))

(assert (=> d!106676 (= lt!446981 (bvmul lt!446979 lt!446982))))

(assert (=> d!106676 (or (= lt!446979 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446982 (bvsdiv (bvmul lt!446979 lt!446982) lt!446979)))))

(assert (=> d!106676 (= lt!446982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106676 (= lt!446979 ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))))))

(assert (=> d!106676 (= lt!446980 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15177 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15172 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106676 (invariant!0 (currentBit!15172 thiss!877) (currentByte!15177 thiss!877) (size!9068 (buf!8210 thiss!877)))))

(assert (=> d!106676 (= (bitIndex!0 (size!9068 (buf!8210 thiss!877)) (currentByte!15177 thiss!877) (currentBit!15172 thiss!877)) lt!446980)))

(declare-fun b!324504 () Bool)

(declare-fun res!266317 () Bool)

(assert (=> b!324504 (=> (not res!266317) (not e!233931))))

(assert (=> b!324504 (= res!266317 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446980))))

(declare-fun b!324505 () Bool)

(declare-fun lt!446983 () (_ BitVec 64))

(assert (=> b!324505 (= e!233931 (bvsle lt!446980 (bvmul lt!446983 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324505 (or (= lt!446983 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446983 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446983)))))

(assert (=> b!324505 (= lt!446983 ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))))))

(assert (= (and d!106676 res!266316) b!324504))

(assert (= (and b!324504 res!266317) b!324505))

(assert (=> d!106676 m!462599))

(declare-fun m!462619 () Bool)

(assert (=> d!106676 m!462619))

(assert (=> b!324485 d!106676))

(declare-fun d!106682 () Bool)

(declare-fun e!233932 () Bool)

(assert (=> d!106682 e!233932))

(declare-fun res!266318 () Bool)

(assert (=> d!106682 (=> (not res!266318) (not e!233932))))

(declare-fun lt!446990 () (_ BitVec 64))

(declare-fun lt!446986 () (_ BitVec 64))

(declare-fun lt!446987 () (_ BitVec 64))

(assert (=> d!106682 (= res!266318 (= lt!446986 (bvsub lt!446987 lt!446990)))))

(assert (=> d!106682 (or (= (bvand lt!446987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446990 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446987 lt!446990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106682 (= lt!446990 (remainingBits!0 ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))) ((_ sign_extend 32) (currentByte!15177 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15172 thiss!877)))))))

(declare-fun lt!446985 () (_ BitVec 64))

(declare-fun lt!446988 () (_ BitVec 64))

(assert (=> d!106682 (= lt!446987 (bvmul lt!446985 lt!446988))))

(assert (=> d!106682 (or (= lt!446985 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446988 (bvsdiv (bvmul lt!446985 lt!446988) lt!446985)))))

(assert (=> d!106682 (= lt!446988 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106682 (= lt!446985 ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))))))

(assert (=> d!106682 (= lt!446986 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15177 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15172 thiss!877)))))))

(assert (=> d!106682 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15172 thiss!877)) (currentByte!15177 thiss!877) (size!9068 (buf!8210 thiss!877)))))

(assert (=> d!106682 (= (bitIndex!0 (size!9068 (buf!8210 thiss!877)) (currentByte!15177 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15172 thiss!877))) lt!446986)))

(declare-fun b!324506 () Bool)

(declare-fun res!266319 () Bool)

(assert (=> b!324506 (=> (not res!266319) (not e!233932))))

(assert (=> b!324506 (= res!266319 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446986))))

(declare-fun b!324507 () Bool)

(declare-fun lt!446989 () (_ BitVec 64))

(assert (=> b!324507 (= e!233932 (bvsle lt!446986 (bvmul lt!446989 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324507 (or (= lt!446989 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446989 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446989)))))

(assert (=> b!324507 (= lt!446989 ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))))))

(assert (= (and d!106682 res!266318) b!324506))

(assert (= (and b!324506 res!266319) b!324507))

(declare-fun m!462621 () Bool)

(assert (=> d!106682 m!462621))

(declare-fun m!462623 () Bool)

(assert (=> d!106682 m!462623))

(assert (=> b!324485 d!106682))

(declare-fun d!106684 () Bool)

(assert (=> d!106684 (= (remainingBits!0 ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))) ((_ sign_extend 32) (currentByte!15177 thiss!877)) ((_ sign_extend 32) (currentBit!15172 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9068 (buf!8210 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15177 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15172 thiss!877)))))))

(assert (=> start!72762 d!106684))

(declare-fun d!106690 () Bool)

(assert (=> d!106690 (= (inv!12 thiss!877) (invariant!0 (currentBit!15172 thiss!877) (currentByte!15177 thiss!877) (size!9068 (buf!8210 thiss!877))))))

(declare-fun bs!28104 () Bool)

(assert (= bs!28104 d!106690))

(assert (=> bs!28104 m!462619))

(assert (=> start!72762 d!106690))

(declare-fun d!106694 () Bool)

(assert (=> d!106694 (= (array_inv!8620 (buf!8210 thiss!877)) (bvsge (size!9068 (buf!8210 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324487 d!106694))

(check-sat (not d!106690) (not d!106682) (not d!106676))
