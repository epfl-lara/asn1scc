; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73042 () Bool)

(assert start!73042)

(declare-fun b!325035 () Bool)

(declare-fun e!234297 () Bool)

(declare-datatypes ((array!20950 0))(
  ( (array!20951 (arr!10193 (Array (_ BitVec 32) (_ BitVec 8))) (size!9101 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14364 0))(
  ( (BitStream!14365 (buf!8243 array!20950) (currentByte!15269 (_ BitVec 32)) (currentBit!15264 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14364)

(declare-fun lt!447422 () (_ BitVec 64))

(assert (=> b!325035 (= e!234297 (and (bvsle ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447422 #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt lt!447422 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325035 (= lt!447422 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15269 thiss!877))))))

(declare-fun b!325034 () Bool)

(declare-fun res!266751 () Bool)

(assert (=> b!325034 (=> (not res!266751) (not e!234297))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325034 (= res!266751 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9101 (buf!8243 thiss!877)) (currentByte!15269 thiss!877) (currentBit!15264 thiss!877))) (bitIndex!0 (size!9101 (buf!8243 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15269 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!325033 () Bool)

(declare-fun res!266752 () Bool)

(assert (=> b!325033 (=> (not res!266752) (not e!234297))))

(assert (=> b!325033 (= res!266752 (bvsge (currentBit!15264 thiss!877) #b00000000000000000000000000000111))))

(declare-fun res!266750 () Bool)

(assert (=> start!73042 (=> (not res!266750) (not e!234297))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73042 (= res!266750 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))) ((_ sign_extend 32) (currentByte!15269 thiss!877)) ((_ sign_extend 32) (currentBit!15264 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73042 e!234297))

(declare-fun e!234296 () Bool)

(declare-fun inv!12 (BitStream!14364) Bool)

(assert (=> start!73042 (and (inv!12 thiss!877) e!234296)))

(declare-fun b!325036 () Bool)

(declare-fun array_inv!8653 (array!20950) Bool)

(assert (=> b!325036 (= e!234296 (array_inv!8653 (buf!8243 thiss!877)))))

(assert (= (and start!73042 res!266750) b!325033))

(assert (= (and b!325033 res!266752) b!325034))

(assert (= (and b!325034 res!266751) b!325035))

(assert (= start!73042 b!325036))

(declare-fun m!463049 () Bool)

(assert (=> b!325034 m!463049))

(declare-fun m!463051 () Bool)

(assert (=> b!325034 m!463051))

(declare-fun m!463053 () Bool)

(assert (=> start!73042 m!463053))

(declare-fun m!463055 () Bool)

(assert (=> start!73042 m!463055))

(declare-fun m!463057 () Bool)

(assert (=> b!325036 m!463057))

(check-sat (not b!325034) (not start!73042) (not b!325036))
(check-sat)
(get-model)

(declare-fun d!106962 () Bool)

(declare-fun e!234309 () Bool)

(assert (=> d!106962 e!234309))

(declare-fun res!266766 () Bool)

(assert (=> d!106962 (=> (not res!266766) (not e!234309))))

(declare-fun lt!447438 () (_ BitVec 64))

(declare-fun lt!447441 () (_ BitVec 64))

(declare-fun lt!447440 () (_ BitVec 64))

(assert (=> d!106962 (= res!266766 (= lt!447441 (bvsub lt!447440 lt!447438)))))

(assert (=> d!106962 (or (= (bvand lt!447440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447440 lt!447438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106962 (= lt!447438 (remainingBits!0 ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))) ((_ sign_extend 32) (currentByte!15269 thiss!877)) ((_ sign_extend 32) (currentBit!15264 thiss!877))))))

(declare-fun lt!447442 () (_ BitVec 64))

(declare-fun lt!447443 () (_ BitVec 64))

(assert (=> d!106962 (= lt!447440 (bvmul lt!447442 lt!447443))))

(assert (=> d!106962 (or (= lt!447442 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447443 (bvsdiv (bvmul lt!447442 lt!447443) lt!447442)))))

(assert (=> d!106962 (= lt!447443 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106962 (= lt!447442 ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))))))

(assert (=> d!106962 (= lt!447441 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15269 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15264 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106962 (invariant!0 (currentBit!15264 thiss!877) (currentByte!15269 thiss!877) (size!9101 (buf!8243 thiss!877)))))

(assert (=> d!106962 (= (bitIndex!0 (size!9101 (buf!8243 thiss!877)) (currentByte!15269 thiss!877) (currentBit!15264 thiss!877)) lt!447441)))

(declare-fun b!325053 () Bool)

(declare-fun res!266767 () Bool)

(assert (=> b!325053 (=> (not res!266767) (not e!234309))))

(assert (=> b!325053 (= res!266767 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447441))))

(declare-fun b!325054 () Bool)

(declare-fun lt!447439 () (_ BitVec 64))

(assert (=> b!325054 (= e!234309 (bvsle lt!447441 (bvmul lt!447439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325054 (or (= lt!447439 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447439 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447439)))))

(assert (=> b!325054 (= lt!447439 ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))))))

(assert (= (and d!106962 res!266766) b!325053))

(assert (= (and b!325053 res!266767) b!325054))

(assert (=> d!106962 m!463053))

(declare-fun m!463069 () Bool)

(assert (=> d!106962 m!463069))

(assert (=> b!325034 d!106962))

(declare-fun d!106966 () Bool)

(declare-fun e!234310 () Bool)

(assert (=> d!106966 e!234310))

(declare-fun res!266768 () Bool)

(assert (=> d!106966 (=> (not res!266768) (not e!234310))))

(declare-fun lt!447447 () (_ BitVec 64))

(declare-fun lt!447446 () (_ BitVec 64))

(declare-fun lt!447444 () (_ BitVec 64))

(assert (=> d!106966 (= res!266768 (= lt!447447 (bvsub lt!447446 lt!447444)))))

(assert (=> d!106966 (or (= (bvand lt!447446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447446 lt!447444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106966 (= lt!447444 (remainingBits!0 ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15269 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447448 () (_ BitVec 64))

(declare-fun lt!447449 () (_ BitVec 64))

(assert (=> d!106966 (= lt!447446 (bvmul lt!447448 lt!447449))))

(assert (=> d!106966 (or (= lt!447448 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447449 (bvsdiv (bvmul lt!447448 lt!447449) lt!447448)))))

(assert (=> d!106966 (= lt!447449 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106966 (= lt!447448 ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))))))

(assert (=> d!106966 (= lt!447447 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15269 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106966 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15269 thiss!877)) (size!9101 (buf!8243 thiss!877)))))

(assert (=> d!106966 (= (bitIndex!0 (size!9101 (buf!8243 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15269 thiss!877)) #b00000000000000000000000000000000) lt!447447)))

(declare-fun b!325055 () Bool)

(declare-fun res!266769 () Bool)

(assert (=> b!325055 (=> (not res!266769) (not e!234310))))

(assert (=> b!325055 (= res!266769 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447447))))

(declare-fun b!325056 () Bool)

(declare-fun lt!447445 () (_ BitVec 64))

(assert (=> b!325056 (= e!234310 (bvsle lt!447447 (bvmul lt!447445 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325056 (or (= lt!447445 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447445 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447445)))))

(assert (=> b!325056 (= lt!447445 ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))))))

(assert (= (and d!106966 res!266768) b!325055))

(assert (= (and b!325055 res!266769) b!325056))

(declare-fun m!463071 () Bool)

(assert (=> d!106966 m!463071))

(declare-fun m!463073 () Bool)

(assert (=> d!106966 m!463073))

(assert (=> b!325034 d!106966))

(declare-fun d!106970 () Bool)

(assert (=> d!106970 (= (remainingBits!0 ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))) ((_ sign_extend 32) (currentByte!15269 thiss!877)) ((_ sign_extend 32) (currentBit!15264 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9101 (buf!8243 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15269 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15264 thiss!877)))))))

(assert (=> start!73042 d!106970))

(declare-fun d!106976 () Bool)

(assert (=> d!106976 (= (inv!12 thiss!877) (invariant!0 (currentBit!15264 thiss!877) (currentByte!15269 thiss!877) (size!9101 (buf!8243 thiss!877))))))

(declare-fun bs!28161 () Bool)

(assert (= bs!28161 d!106976))

(assert (=> bs!28161 m!463069))

(assert (=> start!73042 d!106976))

(declare-fun d!106978 () Bool)

(assert (=> d!106978 (= (array_inv!8653 (buf!8243 thiss!877)) (bvsge (size!9101 (buf!8243 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325036 d!106978))

(check-sat (not d!106966) (not d!106962) (not d!106976))
