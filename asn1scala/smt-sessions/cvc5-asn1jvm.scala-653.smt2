; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18316 () Bool)

(assert start!18316)

(declare-fun b!90793 () Bool)

(declare-fun res!74904 () Bool)

(declare-fun e!59748 () Bool)

(assert (=> b!90793 (=> (not res!74904) (not e!59748))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!90793 (= res!74904 (bvslt i!576 nBits!336))))

(declare-fun b!90794 () Bool)

(declare-fun e!59746 () Bool)

(assert (=> b!90794 (= e!59746 e!59748)))

(declare-fun res!74903 () Bool)

(assert (=> b!90794 (=> (not res!74903) (not e!59748))))

(declare-fun lt!137414 () (_ BitVec 64))

(declare-fun lt!137416 () (_ BitVec 64))

(assert (=> b!90794 (= res!74903 (= lt!137414 (bvadd lt!137416 ((_ sign_extend 32) i!576))))))

(declare-datatypes ((array!4251 0))(
  ( (array!4252 (arr!2553 (Array (_ BitVec 32) (_ BitVec 8))) (size!1916 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3394 0))(
  ( (BitStream!3395 (buf!2306 array!4251) (currentByte!4587 (_ BitVec 32)) (currentBit!4582 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3394)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!90794 (= lt!137414 (bitIndex!0 (size!1916 (buf!2306 thiss!1152)) (currentByte!4587 thiss!1152) (currentBit!4582 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3394)

(assert (=> b!90794 (= lt!137416 (bitIndex!0 (size!1916 (buf!2306 thiss!1151)) (currentByte!4587 thiss!1151) (currentBit!4582 thiss!1151)))))

(declare-fun res!74911 () Bool)

(assert (=> start!18316 (=> (not res!74911) (not e!59746))))

(assert (=> start!18316 (= res!74911 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18316 e!59746))

(declare-fun e!59744 () Bool)

(declare-fun inv!12 (BitStream!3394) Bool)

(assert (=> start!18316 (and (inv!12 thiss!1152) e!59744)))

(declare-fun e!59745 () Bool)

(assert (=> start!18316 (and (inv!12 thiss!1151) e!59745)))

(assert (=> start!18316 true))

(declare-fun b!90795 () Bool)

(declare-fun e!59743 () Bool)

(declare-fun e!59739 () Bool)

(assert (=> b!90795 (= e!59743 e!59739)))

(declare-fun res!74910 () Bool)

(assert (=> b!90795 (=> (not res!74910) (not e!59739))))

(declare-fun lt!137413 () Bool)

(declare-datatypes ((Unit!5824 0))(
  ( (Unit!5825) )
))
(declare-datatypes ((tuple2!7558 0))(
  ( (tuple2!7559 (_1!4024 Unit!5824) (_2!4024 BitStream!3394)) )
))
(declare-fun lt!137418 () tuple2!7558)

(declare-datatypes ((tuple2!7560 0))(
  ( (tuple2!7561 (_1!4025 BitStream!3394) (_2!4025 Bool)) )
))
(declare-fun lt!137417 () tuple2!7560)

(assert (=> b!90795 (= res!74910 (and (= (_2!4025 lt!137417) lt!137413) (= (_1!4025 lt!137417) (_2!4024 lt!137418))))))

(declare-fun readBitPure!0 (BitStream!3394) tuple2!7560)

(declare-fun readerFrom!0 (BitStream!3394 (_ BitVec 32) (_ BitVec 32)) BitStream!3394)

(assert (=> b!90795 (= lt!137417 (readBitPure!0 (readerFrom!0 (_2!4024 lt!137418) (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152))))))

(declare-fun b!90796 () Bool)

(declare-fun e!59747 () Bool)

(assert (=> b!90796 (= e!59747 e!59743)))

(declare-fun res!74906 () Bool)

(assert (=> b!90796 (=> (not res!74906) (not e!59743))))

(declare-fun lt!137415 () (_ BitVec 64))

(assert (=> b!90796 (= res!74906 (= lt!137415 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137414)))))

(assert (=> b!90796 (= lt!137415 (bitIndex!0 (size!1916 (buf!2306 (_2!4024 lt!137418))) (currentByte!4587 (_2!4024 lt!137418)) (currentBit!4582 (_2!4024 lt!137418))))))

(declare-fun b!90797 () Bool)

(declare-fun res!74909 () Bool)

(assert (=> b!90797 (=> (not res!74909) (not e!59746))))

(assert (=> b!90797 (= res!74909 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!90798 () Bool)

(declare-fun res!74900 () Bool)

(assert (=> b!90798 (=> (not res!74900) (not e!59746))))

(assert (=> b!90798 (= res!74900 (and (bvsle i!576 nBits!336) (= (size!1916 (buf!2306 thiss!1152)) (size!1916 (buf!2306 thiss!1151)))))))

(declare-fun b!90799 () Bool)

(declare-fun res!74899 () Bool)

(assert (=> b!90799 (=> (not res!74899) (not e!59746))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90799 (= res!74899 (validate_offset_bits!1 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1151))) ((_ sign_extend 32) (currentByte!4587 thiss!1151)) ((_ sign_extend 32) (currentBit!4582 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!90800 () Bool)

(declare-fun res!74901 () Bool)

(assert (=> b!90800 (=> (not res!74901) (not e!59743))))

(declare-fun isPrefixOf!0 (BitStream!3394 BitStream!3394) Bool)

(assert (=> b!90800 (= res!74901 (isPrefixOf!0 thiss!1152 (_2!4024 lt!137418)))))

(declare-fun b!90801 () Bool)

(declare-fun e!59742 () Bool)

(assert (=> b!90801 (= e!59742 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1916 (buf!2306 (_2!4024 lt!137418))) (size!1916 (buf!2306 thiss!1151)))) (let ((bdg!4255 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) (let ((bdg!4256 (bvand lt!137416 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!4256 (bvand bdg!4255 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!4256 (bvand (bvadd lt!137416 bdg!4255) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!90802 () Bool)

(declare-fun array_inv!1762 (array!4251) Bool)

(assert (=> b!90802 (= e!59745 (array_inv!1762 (buf!2306 thiss!1151)))))

(declare-fun b!90803 () Bool)

(assert (=> b!90803 (= e!59744 (array_inv!1762 (buf!2306 thiss!1152)))))

(declare-fun b!90804 () Bool)

(assert (=> b!90804 (= e!59748 (not e!59742))))

(declare-fun res!74898 () Bool)

(assert (=> b!90804 (=> res!74898 e!59742)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!90804 (= res!74898 (not (invariant!0 (currentBit!4582 (_2!4024 lt!137418)) (currentByte!4587 (_2!4024 lt!137418)) (size!1916 (buf!2306 (_2!4024 lt!137418))))))))

(assert (=> b!90804 e!59747))

(declare-fun res!74908 () Bool)

(assert (=> b!90804 (=> (not res!74908) (not e!59747))))

(assert (=> b!90804 (= res!74908 (= (size!1916 (buf!2306 thiss!1152)) (size!1916 (buf!2306 (_2!4024 lt!137418)))))))

(declare-fun appendBit!0 (BitStream!3394 Bool) tuple2!7558)

(assert (=> b!90804 (= lt!137418 (appendBit!0 thiss!1152 lt!137413))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!90804 (= lt!137413 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90805 () Bool)

(declare-fun res!74902 () Bool)

(assert (=> b!90805 (=> (not res!74902) (not e!59746))))

(assert (=> b!90805 (= res!74902 (invariant!0 (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152) (size!1916 (buf!2306 thiss!1152))))))

(declare-fun b!90806 () Bool)

(assert (=> b!90806 (= e!59739 (= (bitIndex!0 (size!1916 (buf!2306 (_1!4025 lt!137417))) (currentByte!4587 (_1!4025 lt!137417)) (currentBit!4582 (_1!4025 lt!137417))) lt!137415))))

(declare-fun b!90807 () Bool)

(declare-fun res!74907 () Bool)

(assert (=> b!90807 (=> (not res!74907) (not e!59748))))

(assert (=> b!90807 (= res!74907 (validate_offset_bits!1 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1152))) ((_ sign_extend 32) (currentByte!4587 thiss!1152)) ((_ sign_extend 32) (currentBit!4582 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!90808 () Bool)

(declare-fun res!74905 () Bool)

(assert (=> b!90808 (=> (not res!74905) (not e!59746))))

(assert (=> b!90808 (= res!74905 (invariant!0 (currentBit!4582 thiss!1151) (currentByte!4587 thiss!1151) (size!1916 (buf!2306 thiss!1151))))))

(assert (= (and start!18316 res!74911) b!90799))

(assert (= (and b!90799 res!74899) b!90808))

(assert (= (and b!90808 res!74905) b!90797))

(assert (= (and b!90797 res!74909) b!90805))

(assert (= (and b!90805 res!74902) b!90798))

(assert (= (and b!90798 res!74900) b!90794))

(assert (= (and b!90794 res!74903) b!90807))

(assert (= (and b!90807 res!74907) b!90793))

(assert (= (and b!90793 res!74904) b!90804))

(assert (= (and b!90804 res!74908) b!90796))

(assert (= (and b!90796 res!74906) b!90800))

(assert (= (and b!90800 res!74901) b!90795))

(assert (= (and b!90795 res!74910) b!90806))

(assert (= (and b!90804 (not res!74898)) b!90801))

(assert (= start!18316 b!90803))

(assert (= start!18316 b!90802))

(declare-fun m!135137 () Bool)

(assert (=> b!90802 m!135137))

(declare-fun m!135139 () Bool)

(assert (=> start!18316 m!135139))

(declare-fun m!135141 () Bool)

(assert (=> start!18316 m!135141))

(declare-fun m!135143 () Bool)

(assert (=> b!90796 m!135143))

(declare-fun m!135145 () Bool)

(assert (=> b!90808 m!135145))

(declare-fun m!135147 () Bool)

(assert (=> b!90806 m!135147))

(declare-fun m!135149 () Bool)

(assert (=> b!90795 m!135149))

(assert (=> b!90795 m!135149))

(declare-fun m!135151 () Bool)

(assert (=> b!90795 m!135151))

(declare-fun m!135153 () Bool)

(assert (=> b!90794 m!135153))

(declare-fun m!135155 () Bool)

(assert (=> b!90794 m!135155))

(declare-fun m!135157 () Bool)

(assert (=> b!90803 m!135157))

(declare-fun m!135159 () Bool)

(assert (=> b!90805 m!135159))

(declare-fun m!135161 () Bool)

(assert (=> b!90804 m!135161))

(declare-fun m!135163 () Bool)

(assert (=> b!90804 m!135163))

(declare-fun m!135165 () Bool)

(assert (=> b!90799 m!135165))

(declare-fun m!135167 () Bool)

(assert (=> b!90800 m!135167))

(declare-fun m!135169 () Bool)

(assert (=> b!90807 m!135169))

(push 1)

(assert (not b!90806))

(assert (not b!90807))

(assert (not b!90794))

(assert (not b!90796))

(assert (not b!90803))

(assert (not b!90805))

(assert (not b!90800))

(assert (not start!18316))

(assert (not b!90804))

(assert (not b!90795))

(assert (not b!90802))

(assert (not b!90799))

(assert (not b!90808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28272 () Bool)

(assert (=> d!28272 (= (array_inv!1762 (buf!2306 thiss!1151)) (bvsge (size!1916 (buf!2306 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!90802 d!28272))

(declare-fun d!28276 () Bool)

(assert (=> d!28276 (= (invariant!0 (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152) (size!1916 (buf!2306 thiss!1152))) (and (bvsge (currentBit!4582 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4582 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4587 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4587 thiss!1152) (size!1916 (buf!2306 thiss!1152))) (and (= (currentBit!4582 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4587 thiss!1152) (size!1916 (buf!2306 thiss!1152)))))))))

(assert (=> b!90805 d!28276))

(declare-fun d!28280 () Bool)

(declare-fun e!59823 () Bool)

(assert (=> d!28280 e!59823))

(declare-fun res!75019 () Bool)

(assert (=> d!28280 (=> (not res!75019) (not e!59823))))

(declare-fun lt!137491 () (_ BitVec 64))

(declare-fun lt!137490 () (_ BitVec 64))

(declare-fun lt!137493 () (_ BitVec 64))

(assert (=> d!28280 (= res!75019 (= lt!137491 (bvsub lt!137490 lt!137493)))))

(assert (=> d!28280 (or (= (bvand lt!137490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137490 lt!137493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28280 (= lt!137493 (remainingBits!0 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1152))) ((_ sign_extend 32) (currentByte!4587 thiss!1152)) ((_ sign_extend 32) (currentBit!4582 thiss!1152))))))

(declare-fun lt!137489 () (_ BitVec 64))

(declare-fun lt!137488 () (_ BitVec 64))

(assert (=> d!28280 (= lt!137490 (bvmul lt!137489 lt!137488))))

(assert (=> d!28280 (or (= lt!137489 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137488 (bvsdiv (bvmul lt!137489 lt!137488) lt!137489)))))

(assert (=> d!28280 (= lt!137488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28280 (= lt!137489 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1152))))))

(assert (=> d!28280 (= lt!137491 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4587 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4582 thiss!1152))))))

(assert (=> d!28280 (invariant!0 (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152) (size!1916 (buf!2306 thiss!1152)))))

(assert (=> d!28280 (= (bitIndex!0 (size!1916 (buf!2306 thiss!1152)) (currentByte!4587 thiss!1152) (currentBit!4582 thiss!1152)) lt!137491)))

(declare-fun b!90927 () Bool)

(declare-fun res!75020 () Bool)

(assert (=> b!90927 (=> (not res!75020) (not e!59823))))

(assert (=> b!90927 (= res!75020 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137491))))

(declare-fun b!90928 () Bool)

(declare-fun lt!137492 () (_ BitVec 64))

(assert (=> b!90928 (= e!59823 (bvsle lt!137491 (bvmul lt!137492 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90928 (or (= lt!137492 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137492 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137492)))))

(assert (=> b!90928 (= lt!137492 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1152))))))

(assert (= (and d!28280 res!75019) b!90927))

(assert (= (and b!90927 res!75020) b!90928))

(declare-fun m!135251 () Bool)

(assert (=> d!28280 m!135251))

(assert (=> d!28280 m!135159))

(assert (=> b!90794 d!28280))

(declare-fun d!28296 () Bool)

(declare-fun e!59824 () Bool)

(assert (=> d!28296 e!59824))

(declare-fun res!75021 () Bool)

(assert (=> d!28296 (=> (not res!75021) (not e!59824))))

(declare-fun lt!137497 () (_ BitVec 64))

(declare-fun lt!137496 () (_ BitVec 64))

(declare-fun lt!137499 () (_ BitVec 64))

(assert (=> d!28296 (= res!75021 (= lt!137497 (bvsub lt!137496 lt!137499)))))

(assert (=> d!28296 (or (= (bvand lt!137496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137499 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137496 lt!137499) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28296 (= lt!137499 (remainingBits!0 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1151))) ((_ sign_extend 32) (currentByte!4587 thiss!1151)) ((_ sign_extend 32) (currentBit!4582 thiss!1151))))))

(declare-fun lt!137495 () (_ BitVec 64))

(declare-fun lt!137494 () (_ BitVec 64))

(assert (=> d!28296 (= lt!137496 (bvmul lt!137495 lt!137494))))

(assert (=> d!28296 (or (= lt!137495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137494 (bvsdiv (bvmul lt!137495 lt!137494) lt!137495)))))

(assert (=> d!28296 (= lt!137494 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28296 (= lt!137495 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1151))))))

(assert (=> d!28296 (= lt!137497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4587 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4582 thiss!1151))))))

(assert (=> d!28296 (invariant!0 (currentBit!4582 thiss!1151) (currentByte!4587 thiss!1151) (size!1916 (buf!2306 thiss!1151)))))

(assert (=> d!28296 (= (bitIndex!0 (size!1916 (buf!2306 thiss!1151)) (currentByte!4587 thiss!1151) (currentBit!4582 thiss!1151)) lt!137497)))

(declare-fun b!90929 () Bool)

(declare-fun res!75022 () Bool)

(assert (=> b!90929 (=> (not res!75022) (not e!59824))))

(assert (=> b!90929 (= res!75022 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137497))))

(declare-fun b!90930 () Bool)

(declare-fun lt!137498 () (_ BitVec 64))

(assert (=> b!90930 (= e!59824 (bvsle lt!137497 (bvmul lt!137498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90930 (or (= lt!137498 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137498 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137498)))))

(assert (=> b!90930 (= lt!137498 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1151))))))

(assert (= (and d!28296 res!75021) b!90929))

(assert (= (and b!90929 res!75022) b!90930))

(declare-fun m!135255 () Bool)

(assert (=> d!28296 m!135255))

(assert (=> d!28296 m!135145))

(assert (=> b!90794 d!28296))

(declare-fun d!28300 () Bool)

(assert (=> d!28300 (= (invariant!0 (currentBit!4582 (_2!4024 lt!137418)) (currentByte!4587 (_2!4024 lt!137418)) (size!1916 (buf!2306 (_2!4024 lt!137418)))) (and (bvsge (currentBit!4582 (_2!4024 lt!137418)) #b00000000000000000000000000000000) (bvslt (currentBit!4582 (_2!4024 lt!137418)) #b00000000000000000000000000001000) (bvsge (currentByte!4587 (_2!4024 lt!137418)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4587 (_2!4024 lt!137418)) (size!1916 (buf!2306 (_2!4024 lt!137418)))) (and (= (currentBit!4582 (_2!4024 lt!137418)) #b00000000000000000000000000000000) (= (currentByte!4587 (_2!4024 lt!137418)) (size!1916 (buf!2306 (_2!4024 lt!137418))))))))))

(assert (=> b!90804 d!28300))

(declare-fun b!90967 () Bool)

(declare-fun res!75060 () Bool)

(declare-fun e!59843 () Bool)

(assert (=> b!90967 (=> (not res!75060) (not e!59843))))

(declare-fun lt!137541 () tuple2!7558)

(assert (=> b!90967 (= res!75060 (isPrefixOf!0 thiss!1152 (_2!4024 lt!137541)))))

(declare-fun d!28302 () Bool)

(assert (=> d!28302 e!59843))

(declare-fun res!75058 () Bool)

(assert (=> d!28302 (=> (not res!75058) (not e!59843))))

(assert (=> d!28302 (= res!75058 (= (size!1916 (buf!2306 thiss!1152)) (size!1916 (buf!2306 (_2!4024 lt!137541)))))))

(declare-fun choose!16 (BitStream!3394 Bool) tuple2!7558)

(assert (=> d!28302 (= lt!137541 (choose!16 thiss!1152 lt!137413))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28302 (validate_offset_bit!0 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1152))) ((_ sign_extend 32) (currentByte!4587 thiss!1152)) ((_ sign_extend 32) (currentBit!4582 thiss!1152)))))

(assert (=> d!28302 (= (appendBit!0 thiss!1152 lt!137413) lt!137541)))

(declare-fun b!90968 () Bool)

(declare-fun e!59844 () Bool)

(assert (=> b!90968 (= e!59843 e!59844)))

(declare-fun res!75057 () Bool)

(assert (=> b!90968 (=> (not res!75057) (not e!59844))))

(declare-fun lt!137544 () tuple2!7560)

(assert (=> b!90968 (= res!75057 (and (= (_2!4025 lt!137544) lt!137413) (= (_1!4025 lt!137544) (_2!4024 lt!137541))))))

(assert (=> b!90968 (= lt!137544 (readBitPure!0 (readerFrom!0 (_2!4024 lt!137541) (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152))))))

(declare-fun b!90969 () Bool)

(assert (=> b!90969 (= e!59844 (= (bitIndex!0 (size!1916 (buf!2306 (_1!4025 lt!137544))) (currentByte!4587 (_1!4025 lt!137544)) (currentBit!4582 (_1!4025 lt!137544))) (bitIndex!0 (size!1916 (buf!2306 (_2!4024 lt!137541))) (currentByte!4587 (_2!4024 lt!137541)) (currentBit!4582 (_2!4024 lt!137541)))))))

(declare-fun b!90966 () Bool)

(declare-fun res!75059 () Bool)

(assert (=> b!90966 (=> (not res!75059) (not e!59843))))

(declare-fun lt!137543 () (_ BitVec 64))

(declare-fun lt!137542 () (_ BitVec 64))

(assert (=> b!90966 (= res!75059 (= (bitIndex!0 (size!1916 (buf!2306 (_2!4024 lt!137541))) (currentByte!4587 (_2!4024 lt!137541)) (currentBit!4582 (_2!4024 lt!137541))) (bvadd lt!137542 lt!137543)))))

(assert (=> b!90966 (or (not (= (bvand lt!137542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137543 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137542 lt!137543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90966 (= lt!137543 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!90966 (= lt!137542 (bitIndex!0 (size!1916 (buf!2306 thiss!1152)) (currentByte!4587 thiss!1152) (currentBit!4582 thiss!1152)))))

(assert (= (and d!28302 res!75058) b!90966))

(assert (= (and b!90966 res!75059) b!90967))

(assert (= (and b!90967 res!75060) b!90968))

(assert (= (and b!90968 res!75057) b!90969))

(declare-fun m!135279 () Bool)

(assert (=> d!28302 m!135279))

(declare-fun m!135283 () Bool)

(assert (=> d!28302 m!135283))

(declare-fun m!135285 () Bool)

(assert (=> b!90966 m!135285))

(assert (=> b!90966 m!135153))

(declare-fun m!135287 () Bool)

(assert (=> b!90968 m!135287))

(assert (=> b!90968 m!135287))

(declare-fun m!135289 () Bool)

(assert (=> b!90968 m!135289))

(declare-fun m!135291 () Bool)

(assert (=> b!90969 m!135291))

(assert (=> b!90969 m!135285))

(declare-fun m!135293 () Bool)

(assert (=> b!90967 m!135293))

(assert (=> b!90804 d!28302))

(declare-fun d!28318 () Bool)

(assert (=> d!28318 (= (array_inv!1762 (buf!2306 thiss!1152)) (bvsge (size!1916 (buf!2306 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!90803 d!28318))

(declare-fun d!28320 () Bool)

(assert (=> d!28320 (= (invariant!0 (currentBit!4582 thiss!1151) (currentByte!4587 thiss!1151) (size!1916 (buf!2306 thiss!1151))) (and (bvsge (currentBit!4582 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4582 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4587 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4587 thiss!1151) (size!1916 (buf!2306 thiss!1151))) (and (= (currentBit!4582 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4587 thiss!1151) (size!1916 (buf!2306 thiss!1151)))))))))

(assert (=> b!90808 d!28320))

(declare-fun d!28322 () Bool)

(assert (=> d!28322 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1152))) ((_ sign_extend 32) (currentByte!4587 thiss!1152)) ((_ sign_extend 32) (currentBit!4582 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1152))) ((_ sign_extend 32) (currentByte!4587 thiss!1152)) ((_ sign_extend 32) (currentBit!4582 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6993 () Bool)

(assert (= bs!6993 d!28322))

(assert (=> bs!6993 m!135251))

(assert (=> b!90807 d!28322))

(declare-fun d!28330 () Bool)

(declare-fun e!59852 () Bool)

(assert (=> d!28330 e!59852))

(declare-fun res!75072 () Bool)

(assert (=> d!28330 (=> (not res!75072) (not e!59852))))

(declare-fun lt!137566 () (_ BitVec 64))

(declare-fun lt!137565 () (_ BitVec 64))

(declare-fun lt!137568 () (_ BitVec 64))

(assert (=> d!28330 (= res!75072 (= lt!137566 (bvsub lt!137565 lt!137568)))))

(assert (=> d!28330 (or (= (bvand lt!137565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137568 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137565 lt!137568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28330 (= lt!137568 (remainingBits!0 ((_ sign_extend 32) (size!1916 (buf!2306 (_2!4024 lt!137418)))) ((_ sign_extend 32) (currentByte!4587 (_2!4024 lt!137418))) ((_ sign_extend 32) (currentBit!4582 (_2!4024 lt!137418)))))))

(declare-fun lt!137564 () (_ BitVec 64))

(declare-fun lt!137563 () (_ BitVec 64))

(assert (=> d!28330 (= lt!137565 (bvmul lt!137564 lt!137563))))

(assert (=> d!28330 (or (= lt!137564 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137563 (bvsdiv (bvmul lt!137564 lt!137563) lt!137564)))))

(assert (=> d!28330 (= lt!137563 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28330 (= lt!137564 ((_ sign_extend 32) (size!1916 (buf!2306 (_2!4024 lt!137418)))))))

(assert (=> d!28330 (= lt!137566 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4587 (_2!4024 lt!137418))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4582 (_2!4024 lt!137418)))))))

(assert (=> d!28330 (invariant!0 (currentBit!4582 (_2!4024 lt!137418)) (currentByte!4587 (_2!4024 lt!137418)) (size!1916 (buf!2306 (_2!4024 lt!137418))))))

(assert (=> d!28330 (= (bitIndex!0 (size!1916 (buf!2306 (_2!4024 lt!137418))) (currentByte!4587 (_2!4024 lt!137418)) (currentBit!4582 (_2!4024 lt!137418))) lt!137566)))

(declare-fun b!90981 () Bool)

(declare-fun res!75073 () Bool)

(assert (=> b!90981 (=> (not res!75073) (not e!59852))))

(assert (=> b!90981 (= res!75073 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137566))))

(declare-fun b!90982 () Bool)

(declare-fun lt!137567 () (_ BitVec 64))

(assert (=> b!90982 (= e!59852 (bvsle lt!137566 (bvmul lt!137567 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90982 (or (= lt!137567 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137567 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137567)))))

(assert (=> b!90982 (= lt!137567 ((_ sign_extend 32) (size!1916 (buf!2306 (_2!4024 lt!137418)))))))

(assert (= (and d!28330 res!75072) b!90981))

(assert (= (and b!90981 res!75073) b!90982))

(declare-fun m!135299 () Bool)

(assert (=> d!28330 m!135299))

(assert (=> d!28330 m!135161))

(assert (=> b!90796 d!28330))

(declare-fun d!28332 () Bool)

(declare-datatypes ((tuple2!7574 0))(
  ( (tuple2!7575 (_1!4032 Bool) (_2!4032 BitStream!3394)) )
))
(declare-fun lt!137583 () tuple2!7574)

(declare-fun readBit!0 (BitStream!3394) tuple2!7574)

(assert (=> d!28332 (= lt!137583 (readBit!0 (readerFrom!0 (_2!4024 lt!137418) (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152))))))

(assert (=> d!28332 (= (readBitPure!0 (readerFrom!0 (_2!4024 lt!137418) (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152))) (tuple2!7561 (_2!4032 lt!137583) (_1!4032 lt!137583)))))

(declare-fun bs!6997 () Bool)

(assert (= bs!6997 d!28332))

(assert (=> bs!6997 m!135149))

(declare-fun m!135301 () Bool)

(assert (=> bs!6997 m!135301))

(assert (=> b!90795 d!28332))

(declare-fun d!28350 () Bool)

(declare-fun e!59857 () Bool)

(assert (=> d!28350 e!59857))

(declare-fun res!75081 () Bool)

(assert (=> d!28350 (=> (not res!75081) (not e!59857))))

(assert (=> d!28350 (= res!75081 (invariant!0 (currentBit!4582 (_2!4024 lt!137418)) (currentByte!4587 (_2!4024 lt!137418)) (size!1916 (buf!2306 (_2!4024 lt!137418)))))))

(assert (=> d!28350 (= (readerFrom!0 (_2!4024 lt!137418) (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152)) (BitStream!3395 (buf!2306 (_2!4024 lt!137418)) (currentByte!4587 thiss!1152) (currentBit!4582 thiss!1152)))))

(declare-fun b!90989 () Bool)

(assert (=> b!90989 (= e!59857 (invariant!0 (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152) (size!1916 (buf!2306 (_2!4024 lt!137418)))))))

(assert (= (and d!28350 res!75081) b!90989))

(assert (=> d!28350 m!135161))

(declare-fun m!135303 () Bool)

(assert (=> b!90989 m!135303))

(assert (=> b!90795 d!28350))

(declare-fun d!28352 () Bool)

(declare-fun e!59858 () Bool)

(assert (=> d!28352 e!59858))

(declare-fun res!75082 () Bool)

(assert (=> d!28352 (=> (not res!75082) (not e!59858))))

(declare-fun lt!137587 () (_ BitVec 64))

(declare-fun lt!137586 () (_ BitVec 64))

(declare-fun lt!137589 () (_ BitVec 64))

(assert (=> d!28352 (= res!75082 (= lt!137587 (bvsub lt!137586 lt!137589)))))

(assert (=> d!28352 (or (= (bvand lt!137586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137586 lt!137589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28352 (= lt!137589 (remainingBits!0 ((_ sign_extend 32) (size!1916 (buf!2306 (_1!4025 lt!137417)))) ((_ sign_extend 32) (currentByte!4587 (_1!4025 lt!137417))) ((_ sign_extend 32) (currentBit!4582 (_1!4025 lt!137417)))))))

(declare-fun lt!137585 () (_ BitVec 64))

(declare-fun lt!137584 () (_ BitVec 64))

(assert (=> d!28352 (= lt!137586 (bvmul lt!137585 lt!137584))))

(assert (=> d!28352 (or (= lt!137585 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137584 (bvsdiv (bvmul lt!137585 lt!137584) lt!137585)))))

(assert (=> d!28352 (= lt!137584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28352 (= lt!137585 ((_ sign_extend 32) (size!1916 (buf!2306 (_1!4025 lt!137417)))))))

(assert (=> d!28352 (= lt!137587 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4587 (_1!4025 lt!137417))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4582 (_1!4025 lt!137417)))))))

(assert (=> d!28352 (invariant!0 (currentBit!4582 (_1!4025 lt!137417)) (currentByte!4587 (_1!4025 lt!137417)) (size!1916 (buf!2306 (_1!4025 lt!137417))))))

(assert (=> d!28352 (= (bitIndex!0 (size!1916 (buf!2306 (_1!4025 lt!137417))) (currentByte!4587 (_1!4025 lt!137417)) (currentBit!4582 (_1!4025 lt!137417))) lt!137587)))

(declare-fun b!90990 () Bool)

(declare-fun res!75083 () Bool)

(assert (=> b!90990 (=> (not res!75083) (not e!59858))))

(assert (=> b!90990 (= res!75083 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137587))))

(declare-fun b!90991 () Bool)

(declare-fun lt!137588 () (_ BitVec 64))

(assert (=> b!90991 (= e!59858 (bvsle lt!137587 (bvmul lt!137588 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90991 (or (= lt!137588 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137588 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137588)))))

(assert (=> b!90991 (= lt!137588 ((_ sign_extend 32) (size!1916 (buf!2306 (_1!4025 lt!137417)))))))

(assert (= (and d!28352 res!75082) b!90990))

(assert (= (and b!90990 res!75083) b!90991))

(declare-fun m!135305 () Bool)

(assert (=> d!28352 m!135305))

(declare-fun m!135307 () Bool)

(assert (=> d!28352 m!135307))

(assert (=> b!90806 d!28352))

(declare-fun d!28354 () Bool)

(declare-fun res!75090 () Bool)

(declare-fun e!59863 () Bool)

(assert (=> d!28354 (=> (not res!75090) (not e!59863))))

(assert (=> d!28354 (= res!75090 (= (size!1916 (buf!2306 thiss!1152)) (size!1916 (buf!2306 (_2!4024 lt!137418)))))))

(assert (=> d!28354 (= (isPrefixOf!0 thiss!1152 (_2!4024 lt!137418)) e!59863)))

(declare-fun b!90998 () Bool)

(declare-fun res!75091 () Bool)

(assert (=> b!90998 (=> (not res!75091) (not e!59863))))

(assert (=> b!90998 (= res!75091 (bvsle (bitIndex!0 (size!1916 (buf!2306 thiss!1152)) (currentByte!4587 thiss!1152) (currentBit!4582 thiss!1152)) (bitIndex!0 (size!1916 (buf!2306 (_2!4024 lt!137418))) (currentByte!4587 (_2!4024 lt!137418)) (currentBit!4582 (_2!4024 lt!137418)))))))

(declare-fun b!90999 () Bool)

(declare-fun e!59864 () Bool)

(assert (=> b!90999 (= e!59863 e!59864)))

(declare-fun res!75092 () Bool)

(assert (=> b!90999 (=> res!75092 e!59864)))

(assert (=> b!90999 (= res!75092 (= (size!1916 (buf!2306 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!91000 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4251 array!4251 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91000 (= e!59864 (arrayBitRangesEq!0 (buf!2306 thiss!1152) (buf!2306 (_2!4024 lt!137418)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1916 (buf!2306 thiss!1152)) (currentByte!4587 thiss!1152) (currentBit!4582 thiss!1152))))))

(assert (= (and d!28354 res!75090) b!90998))

(assert (= (and b!90998 res!75091) b!90999))

(assert (= (and b!90999 (not res!75092)) b!91000))

(assert (=> b!90998 m!135153))

(assert (=> b!90998 m!135143))

(assert (=> b!91000 m!135153))

(assert (=> b!91000 m!135153))

(declare-fun m!135309 () Bool)

(assert (=> b!91000 m!135309))

(assert (=> b!90800 d!28354))

(declare-fun d!28356 () Bool)

(assert (=> d!28356 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1151))) ((_ sign_extend 32) (currentByte!4587 thiss!1151)) ((_ sign_extend 32) (currentBit!4582 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1916 (buf!2306 thiss!1151))) ((_ sign_extend 32) (currentByte!4587 thiss!1151)) ((_ sign_extend 32) (currentBit!4582 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6998 () Bool)

(assert (= bs!6998 d!28356))

(assert (=> bs!6998 m!135255))

(assert (=> b!90799 d!28356))

(declare-fun d!28358 () Bool)

(assert (=> d!28358 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4582 thiss!1152) (currentByte!4587 thiss!1152) (size!1916 (buf!2306 thiss!1152))))))

(declare-fun bs!6999 () Bool)

(assert (= bs!6999 d!28358))

(assert (=> bs!6999 m!135159))

(assert (=> start!18316 d!28358))

(declare-fun d!28360 () Bool)

(assert (=> d!28360 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4582 thiss!1151) (currentByte!4587 thiss!1151) (size!1916 (buf!2306 thiss!1151))))))

(declare-fun bs!7000 () Bool)

(assert (= bs!7000 d!28360))

(assert (=> bs!7000 m!135145))

(assert (=> start!18316 d!28360))

(push 1)

(assert (not d!28352))

(assert (not d!28330))

(assert (not b!90969))

(assert (not b!90968))

(assert (not d!28350))

(assert (not d!28322))

(assert (not b!90998))

(assert (not d!28302))

(assert (not b!91000))

(assert (not b!90989))

(assert (not d!28356))

(assert (not d!28332))

(assert (not d!28296))

(assert (not b!90967))

(assert (not d!28360))

(assert (not d!28358))

(assert (not b!90966))

(assert (not d!28280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

