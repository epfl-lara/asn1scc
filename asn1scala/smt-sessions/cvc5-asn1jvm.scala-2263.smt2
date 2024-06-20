; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57306 () Bool)

(assert start!57306)

(declare-fun res!219790 () Bool)

(declare-fun e!182905 () Bool)

(assert (=> start!57306 (=> (not res!219790) (not e!182905))))

(declare-datatypes ((array!14648 0))(
  ( (array!14649 (arr!7381 (Array (_ BitVec 32) (_ BitVec 8))) (size!6394 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11602 0))(
  ( (BitStream!11603 (buf!6862 array!14648) (currentByte!12705 (_ BitVec 32)) (currentBit!12700 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11602)

(declare-fun w2!580 () BitStream!11602)

(declare-fun isPrefixOf!0 (BitStream!11602 BitStream!11602) Bool)

(assert (=> start!57306 (= res!219790 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57306 e!182905))

(declare-fun e!182903 () Bool)

(declare-fun inv!12 (BitStream!11602) Bool)

(assert (=> start!57306 (and (inv!12 w1!584) e!182903)))

(declare-fun e!182904 () Bool)

(assert (=> start!57306 (and (inv!12 w2!580) e!182904)))

(declare-fun b!262654 () Bool)

(declare-fun array_inv!6118 (array!14648) Bool)

(assert (=> b!262654 (= e!182903 (array_inv!6118 (buf!6862 w1!584)))))

(declare-fun b!262652 () Bool)

(declare-fun e!182906 () Bool)

(assert (=> b!262652 (= e!182905 (not e!182906))))

(declare-fun res!219789 () Bool)

(assert (=> b!262652 (=> res!219789 e!182906)))

(assert (=> b!262652 (= res!219789 (= (size!6394 (buf!6862 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262652 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18731 0))(
  ( (Unit!18732) )
))
(declare-fun lt!404263 () Unit!18731)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11602) Unit!18731)

(assert (=> b!262652 (= lt!404263 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404266 () BitStream!11602)

(assert (=> b!262652 (isPrefixOf!0 lt!404266 lt!404266)))

(declare-fun lt!404264 () Unit!18731)

(assert (=> b!262652 (= lt!404264 (lemmaIsPrefixRefl!0 lt!404266))))

(assert (=> b!262652 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404265 () Unit!18731)

(assert (=> b!262652 (= lt!404265 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262652 (= lt!404266 (BitStream!11603 (buf!6862 w2!580) (currentByte!12705 w1!584) (currentBit!12700 w1!584)))))

(declare-fun b!262655 () Bool)

(assert (=> b!262655 (= e!182904 (array_inv!6118 (buf!6862 w2!580)))))

(declare-fun lt!404267 () (_ BitVec 64))

(declare-fun b!262653 () Bool)

(assert (=> b!262653 (= e!182906 (or (bvsgt (size!6394 (buf!6862 w1!584)) (size!6394 (buf!6862 w2!580))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404267) (bvsle lt!404267 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6394 (buf!6862 w1!584))))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262653 (= lt!404267 (bitIndex!0 (size!6394 (buf!6862 w1!584)) (currentByte!12705 w1!584) (currentBit!12700 w1!584)))))

(assert (= (and start!57306 res!219790) b!262652))

(assert (= (and b!262652 (not res!219789)) b!262653))

(assert (= start!57306 b!262654))

(assert (= start!57306 b!262655))

(declare-fun m!392783 () Bool)

(assert (=> b!262652 m!392783))

(declare-fun m!392785 () Bool)

(assert (=> b!262652 m!392785))

(declare-fun m!392787 () Bool)

(assert (=> b!262652 m!392787))

(declare-fun m!392789 () Bool)

(assert (=> b!262652 m!392789))

(declare-fun m!392791 () Bool)

(assert (=> b!262652 m!392791))

(declare-fun m!392793 () Bool)

(assert (=> b!262652 m!392793))

(declare-fun m!392795 () Bool)

(assert (=> b!262654 m!392795))

(declare-fun m!392797 () Bool)

(assert (=> start!57306 m!392797))

(declare-fun m!392799 () Bool)

(assert (=> start!57306 m!392799))

(declare-fun m!392801 () Bool)

(assert (=> start!57306 m!392801))

(declare-fun m!392803 () Bool)

(assert (=> b!262653 m!392803))

(declare-fun m!392805 () Bool)

(assert (=> b!262655 m!392805))

(push 1)

(assert (not start!57306))

(assert (not b!262654))

(assert (not b!262655))

(assert (not b!262653))

(assert (not b!262652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88636 () Bool)

(declare-fun res!219827 () Bool)

(declare-fun e!182960 () Bool)

(assert (=> d!88636 (=> (not res!219827) (not e!182960))))

(assert (=> d!88636 (= res!219827 (= (size!6394 (buf!6862 w1!584)) (size!6394 (buf!6862 w2!580))))))

(assert (=> d!88636 (= (isPrefixOf!0 w1!584 w2!580) e!182960)))

(declare-fun b!262704 () Bool)

(declare-fun res!219829 () Bool)

(assert (=> b!262704 (=> (not res!219829) (not e!182960))))

(assert (=> b!262704 (= res!219829 (bvsle (bitIndex!0 (size!6394 (buf!6862 w1!584)) (currentByte!12705 w1!584) (currentBit!12700 w1!584)) (bitIndex!0 (size!6394 (buf!6862 w2!580)) (currentByte!12705 w2!580) (currentBit!12700 w2!580))))))

(declare-fun b!262705 () Bool)

(declare-fun e!182961 () Bool)

(assert (=> b!262705 (= e!182960 e!182961)))

(declare-fun res!219828 () Bool)

(assert (=> b!262705 (=> res!219828 e!182961)))

(assert (=> b!262705 (= res!219828 (= (size!6394 (buf!6862 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262706 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14648 array!14648 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262706 (= e!182961 (arrayBitRangesEq!0 (buf!6862 w1!584) (buf!6862 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6394 (buf!6862 w1!584)) (currentByte!12705 w1!584) (currentBit!12700 w1!584))))))

(assert (= (and d!88636 res!219827) b!262704))

(assert (= (and b!262704 res!219829) b!262705))

(assert (= (and b!262705 (not res!219828)) b!262706))

(assert (=> b!262704 m!392803))

(declare-fun m!392873 () Bool)

(assert (=> b!262704 m!392873))

(assert (=> b!262706 m!392803))

(assert (=> b!262706 m!392803))

(declare-fun m!392877 () Bool)

(assert (=> b!262706 m!392877))

(assert (=> start!57306 d!88636))

(declare-fun d!88656 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88656 (= (inv!12 w1!584) (invariant!0 (currentBit!12700 w1!584) (currentByte!12705 w1!584) (size!6394 (buf!6862 w1!584))))))

(declare-fun bs!22485 () Bool)

(assert (= bs!22485 d!88656))

(declare-fun m!392881 () Bool)

(assert (=> bs!22485 m!392881))

(assert (=> start!57306 d!88656))

(declare-fun d!88660 () Bool)

(assert (=> d!88660 (= (inv!12 w2!580) (invariant!0 (currentBit!12700 w2!580) (currentByte!12705 w2!580) (size!6394 (buf!6862 w2!580))))))

(declare-fun bs!22486 () Bool)

(assert (= bs!22486 d!88660))

(declare-fun m!392883 () Bool)

(assert (=> bs!22486 m!392883))

(assert (=> start!57306 d!88660))

(declare-fun d!88662 () Bool)

(assert (=> d!88662 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404305 () Unit!18731)

(declare-fun choose!11 (BitStream!11602) Unit!18731)

(assert (=> d!88662 (= lt!404305 (choose!11 w2!580))))

(assert (=> d!88662 (= (lemmaIsPrefixRefl!0 w2!580) lt!404305)))

(declare-fun bs!22488 () Bool)

(assert (= bs!22488 d!88662))

(assert (=> bs!22488 m!392791))

(declare-fun m!392885 () Bool)

(assert (=> bs!22488 m!392885))

(assert (=> b!262652 d!88662))

(declare-fun d!88664 () Bool)

(assert (=> d!88664 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404306 () Unit!18731)

(assert (=> d!88664 (= lt!404306 (choose!11 w1!584))))

(assert (=> d!88664 (= (lemmaIsPrefixRefl!0 w1!584) lt!404306)))

(declare-fun bs!22489 () Bool)

(assert (= bs!22489 d!88664))

(assert (=> bs!22489 m!392789))

(declare-fun m!392887 () Bool)

(assert (=> bs!22489 m!392887))

(assert (=> b!262652 d!88664))

(declare-fun d!88666 () Bool)

(assert (=> d!88666 (isPrefixOf!0 lt!404266 lt!404266)))

(declare-fun lt!404307 () Unit!18731)

(assert (=> d!88666 (= lt!404307 (choose!11 lt!404266))))

(assert (=> d!88666 (= (lemmaIsPrefixRefl!0 lt!404266) lt!404307)))

(declare-fun bs!22490 () Bool)

(assert (= bs!22490 d!88666))

(assert (=> bs!22490 m!392787))

(declare-fun m!392889 () Bool)

(assert (=> bs!22490 m!392889))

(assert (=> b!262652 d!88666))

(declare-fun d!88668 () Bool)

(declare-fun res!219830 () Bool)

(declare-fun e!182962 () Bool)

(assert (=> d!88668 (=> (not res!219830) (not e!182962))))

(assert (=> d!88668 (= res!219830 (= (size!6394 (buf!6862 lt!404266)) (size!6394 (buf!6862 lt!404266))))))

(assert (=> d!88668 (= (isPrefixOf!0 lt!404266 lt!404266) e!182962)))

(declare-fun b!262707 () Bool)

(declare-fun res!219832 () Bool)

(assert (=> b!262707 (=> (not res!219832) (not e!182962))))

(assert (=> b!262707 (= res!219832 (bvsle (bitIndex!0 (size!6394 (buf!6862 lt!404266)) (currentByte!12705 lt!404266) (currentBit!12700 lt!404266)) (bitIndex!0 (size!6394 (buf!6862 lt!404266)) (currentByte!12705 lt!404266) (currentBit!12700 lt!404266))))))

(declare-fun b!262708 () Bool)

(declare-fun e!182963 () Bool)

(assert (=> b!262708 (= e!182962 e!182963)))

(declare-fun res!219831 () Bool)

(assert (=> b!262708 (=> res!219831 e!182963)))

(assert (=> b!262708 (= res!219831 (= (size!6394 (buf!6862 lt!404266)) #b00000000000000000000000000000000))))

(declare-fun b!262709 () Bool)

(assert (=> b!262709 (= e!182963 (arrayBitRangesEq!0 (buf!6862 lt!404266) (buf!6862 lt!404266) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6394 (buf!6862 lt!404266)) (currentByte!12705 lt!404266) (currentBit!12700 lt!404266))))))

(assert (= (and d!88668 res!219830) b!262707))

(assert (= (and b!262707 res!219832) b!262708))

(assert (= (and b!262708 (not res!219831)) b!262709))

(declare-fun m!392891 () Bool)

(assert (=> b!262707 m!392891))

(assert (=> b!262707 m!392891))

(assert (=> b!262709 m!392891))

(assert (=> b!262709 m!392891))

(declare-fun m!392893 () Bool)

(assert (=> b!262709 m!392893))

(assert (=> b!262652 d!88668))

(declare-fun d!88670 () Bool)

(declare-fun res!219833 () Bool)

(declare-fun e!182964 () Bool)

(assert (=> d!88670 (=> (not res!219833) (not e!182964))))

(assert (=> d!88670 (= res!219833 (= (size!6394 (buf!6862 w1!584)) (size!6394 (buf!6862 w1!584))))))

(assert (=> d!88670 (= (isPrefixOf!0 w1!584 w1!584) e!182964)))

(declare-fun b!262710 () Bool)

(declare-fun res!219835 () Bool)

(assert (=> b!262710 (=> (not res!219835) (not e!182964))))

(assert (=> b!262710 (= res!219835 (bvsle (bitIndex!0 (size!6394 (buf!6862 w1!584)) (currentByte!12705 w1!584) (currentBit!12700 w1!584)) (bitIndex!0 (size!6394 (buf!6862 w1!584)) (currentByte!12705 w1!584) (currentBit!12700 w1!584))))))

(declare-fun b!262711 () Bool)

(declare-fun e!182965 () Bool)

(assert (=> b!262711 (= e!182964 e!182965)))

(declare-fun res!219834 () Bool)

(assert (=> b!262711 (=> res!219834 e!182965)))

(assert (=> b!262711 (= res!219834 (= (size!6394 (buf!6862 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262712 () Bool)

(assert (=> b!262712 (= e!182965 (arrayBitRangesEq!0 (buf!6862 w1!584) (buf!6862 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6394 (buf!6862 w1!584)) (currentByte!12705 w1!584) (currentBit!12700 w1!584))))))

(assert (= (and d!88670 res!219833) b!262710))

(assert (= (and b!262710 res!219835) b!262711))

(assert (= (and b!262711 (not res!219834)) b!262712))

(assert (=> b!262710 m!392803))

(assert (=> b!262710 m!392803))

(assert (=> b!262712 m!392803))

(assert (=> b!262712 m!392803))

(declare-fun m!392895 () Bool)

(assert (=> b!262712 m!392895))

(assert (=> b!262652 d!88670))

(declare-fun d!88672 () Bool)

(declare-fun res!219836 () Bool)

(declare-fun e!182966 () Bool)

(assert (=> d!88672 (=> (not res!219836) (not e!182966))))

(assert (=> d!88672 (= res!219836 (= (size!6394 (buf!6862 w2!580)) (size!6394 (buf!6862 w2!580))))))

(assert (=> d!88672 (= (isPrefixOf!0 w2!580 w2!580) e!182966)))

(declare-fun b!262713 () Bool)

(declare-fun res!219838 () Bool)

(assert (=> b!262713 (=> (not res!219838) (not e!182966))))

(assert (=> b!262713 (= res!219838 (bvsle (bitIndex!0 (size!6394 (buf!6862 w2!580)) (currentByte!12705 w2!580) (currentBit!12700 w2!580)) (bitIndex!0 (size!6394 (buf!6862 w2!580)) (currentByte!12705 w2!580) (currentBit!12700 w2!580))))))

(declare-fun b!262714 () Bool)

(declare-fun e!182967 () Bool)

(assert (=> b!262714 (= e!182966 e!182967)))

(declare-fun res!219837 () Bool)

(assert (=> b!262714 (=> res!219837 e!182967)))

(assert (=> b!262714 (= res!219837 (= (size!6394 (buf!6862 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262715 () Bool)

(assert (=> b!262715 (= e!182967 (arrayBitRangesEq!0 (buf!6862 w2!580) (buf!6862 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6394 (buf!6862 w2!580)) (currentByte!12705 w2!580) (currentBit!12700 w2!580))))))

(assert (= (and d!88672 res!219836) b!262713))

(assert (= (and b!262713 res!219838) b!262714))

(assert (= (and b!262714 (not res!219837)) b!262715))

(assert (=> b!262713 m!392873))

(assert (=> b!262713 m!392873))

(assert (=> b!262715 m!392873))

(assert (=> b!262715 m!392873))

(declare-fun m!392897 () Bool)

(assert (=> b!262715 m!392897))

(assert (=> b!262652 d!88672))

(declare-fun d!88674 () Bool)

(assert (=> d!88674 (= (array_inv!6118 (buf!6862 w2!580)) (bvsge (size!6394 (buf!6862 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262655 d!88674))

(declare-fun d!88676 () Bool)

(declare-fun e!182980 () Bool)

(assert (=> d!88676 e!182980))

(declare-fun res!219862 () Bool)

(assert (=> d!88676 (=> (not res!219862) (not e!182980))))

(declare-fun lt!404364 () (_ BitVec 64))

(declare-fun lt!404360 () (_ BitVec 64))

(declare-fun lt!404361 () (_ BitVec 64))

(assert (=> d!88676 (= res!219862 (= lt!404361 (bvsub lt!404364 lt!404360)))))

(assert (=> d!88676 (or (= (bvand lt!404364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404360 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404364 lt!404360) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88676 (= lt!404360 (remainingBits!0 ((_ sign_extend 32) (size!6394 (buf!6862 w1!584))) ((_ sign_extend 32) (currentByte!12705 w1!584)) ((_ sign_extend 32) (currentBit!12700 w1!584))))))

(declare-fun lt!404362 () (_ BitVec 64))

(declare-fun lt!404359 () (_ BitVec 64))

(assert (=> d!88676 (= lt!404364 (bvmul lt!404362 lt!404359))))

(assert (=> d!88676 (or (= lt!404362 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404359 (bvsdiv (bvmul lt!404362 lt!404359) lt!404362)))))

(assert (=> d!88676 (= lt!404359 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88676 (= lt!404362 ((_ sign_extend 32) (size!6394 (buf!6862 w1!584))))))

(assert (=> d!88676 (= lt!404361 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12705 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12700 w1!584))))))

(assert (=> d!88676 (invariant!0 (currentBit!12700 w1!584) (currentByte!12705 w1!584) (size!6394 (buf!6862 w1!584)))))

(assert (=> d!88676 (= (bitIndex!0 (size!6394 (buf!6862 w1!584)) (currentByte!12705 w1!584) (currentBit!12700 w1!584)) lt!404361)))

(declare-fun b!262738 () Bool)

(declare-fun res!219861 () Bool)

(assert (=> b!262738 (=> (not res!219861) (not e!182980))))

(assert (=> b!262738 (= res!219861 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404361))))

(declare-fun b!262739 () Bool)

(declare-fun lt!404363 () (_ BitVec 64))

(assert (=> b!262739 (= e!182980 (bvsle lt!404361 (bvmul lt!404363 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262739 (or (= lt!404363 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404363 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404363)))))

(assert (=> b!262739 (= lt!404363 ((_ sign_extend 32) (size!6394 (buf!6862 w1!584))))))

(assert (= (and d!88676 res!219862) b!262738))

(assert (= (and b!262738 res!219861) b!262739))

(declare-fun m!392907 () Bool)

(assert (=> d!88676 m!392907))

(assert (=> d!88676 m!392881))

(assert (=> b!262653 d!88676))

(declare-fun d!88684 () Bool)

(assert (=> d!88684 (= (array_inv!6118 (buf!6862 w1!584)) (bvsge (size!6394 (buf!6862 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262654 d!88684))

(push 1)

(assert (not d!88676))

(assert (not d!88662))

(assert (not b!262707))

(assert (not b!262704))

(assert (not d!88660))

(assert (not b!262709))

(assert (not d!88664))

(assert (not d!88666))

(assert (not b!262715))

(assert (not b!262710))

(assert (not b!262713))

(assert (not b!262712))

(assert (not b!262706))

(assert (not d!88656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

