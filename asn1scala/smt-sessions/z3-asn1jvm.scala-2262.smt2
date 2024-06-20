; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57272 () Bool)

(assert start!57272)

(declare-fun b!262559 () Bool)

(declare-fun e!182822 () Bool)

(declare-datatypes ((array!14641 0))(
  ( (array!14642 (arr!7379 (Array (_ BitVec 32) (_ BitVec 8))) (size!6392 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11598 0))(
  ( (BitStream!11599 (buf!6860 array!14641) (currentByte!12700 (_ BitVec 32)) (currentBit!12695 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11598)

(declare-fun array_inv!6116 (array!14641) Bool)

(assert (=> b!262559 (= e!182822 (array_inv!6116 (buf!6860 w2!580)))))

(declare-fun res!219705 () Bool)

(declare-fun e!182826 () Bool)

(assert (=> start!57272 (=> (not res!219705) (not e!182826))))

(declare-fun w1!584 () BitStream!11598)

(declare-fun isPrefixOf!0 (BitStream!11598 BitStream!11598) Bool)

(assert (=> start!57272 (= res!219705 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57272 e!182826))

(declare-fun e!182824 () Bool)

(declare-fun inv!12 (BitStream!11598) Bool)

(assert (=> start!57272 (and (inv!12 w1!584) e!182824)))

(assert (=> start!57272 (and (inv!12 w2!580) e!182822)))

(declare-fun b!262556 () Bool)

(declare-fun e!182821 () Bool)

(assert (=> b!262556 (= e!182826 (not e!182821))))

(declare-fun res!219706 () Bool)

(assert (=> b!262556 (=> res!219706 e!182821)))

(assert (=> b!262556 (= res!219706 (= (size!6392 (buf!6860 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262556 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18727 0))(
  ( (Unit!18728) )
))
(declare-fun lt!404164 () Unit!18727)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11598) Unit!18727)

(assert (=> b!262556 (= lt!404164 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404168 () BitStream!11598)

(assert (=> b!262556 (isPrefixOf!0 lt!404168 lt!404168)))

(declare-fun lt!404167 () Unit!18727)

(assert (=> b!262556 (= lt!404167 (lemmaIsPrefixRefl!0 lt!404168))))

(assert (=> b!262556 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404166 () Unit!18727)

(assert (=> b!262556 (= lt!404166 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262556 (= lt!404168 (BitStream!11599 (buf!6860 w2!580) (currentByte!12700 w1!584) (currentBit!12695 w1!584)))))

(declare-fun b!262557 () Bool)

(assert (=> b!262557 (= e!182821 (bvsle (size!6392 (buf!6860 w1!584)) (size!6392 (buf!6860 w2!580))))))

(declare-fun lt!404165 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262557 (= lt!404165 (bitIndex!0 (size!6392 (buf!6860 w1!584)) (currentByte!12700 w1!584) (currentBit!12695 w1!584)))))

(declare-fun b!262558 () Bool)

(assert (=> b!262558 (= e!182824 (array_inv!6116 (buf!6860 w1!584)))))

(assert (= (and start!57272 res!219705) b!262556))

(assert (= (and b!262556 (not res!219706)) b!262557))

(assert (= start!57272 b!262558))

(assert (= start!57272 b!262559))

(declare-fun m!392663 () Bool)

(assert (=> b!262558 m!392663))

(declare-fun m!392665 () Bool)

(assert (=> b!262556 m!392665))

(declare-fun m!392667 () Bool)

(assert (=> b!262556 m!392667))

(declare-fun m!392669 () Bool)

(assert (=> b!262556 m!392669))

(declare-fun m!392671 () Bool)

(assert (=> b!262556 m!392671))

(declare-fun m!392673 () Bool)

(assert (=> b!262556 m!392673))

(declare-fun m!392675 () Bool)

(assert (=> b!262556 m!392675))

(declare-fun m!392677 () Bool)

(assert (=> b!262559 m!392677))

(declare-fun m!392679 () Bool)

(assert (=> b!262557 m!392679))

(declare-fun m!392681 () Bool)

(assert (=> start!57272 m!392681))

(declare-fun m!392683 () Bool)

(assert (=> start!57272 m!392683))

(declare-fun m!392685 () Bool)

(assert (=> start!57272 m!392685))

(check-sat (not b!262556) (not b!262559) (not b!262558) (not b!262557) (not start!57272))
(check-sat)
(get-model)

(declare-fun d!88554 () Bool)

(assert (=> d!88554 (= (array_inv!6116 (buf!6860 w2!580)) (bvsge (size!6392 (buf!6860 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262559 d!88554))

(declare-fun d!88558 () Bool)

(assert (=> d!88558 (= (array_inv!6116 (buf!6860 w1!584)) (bvsge (size!6392 (buf!6860 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262558 d!88558))

(declare-fun d!88560 () Bool)

(declare-fun e!182852 () Bool)

(assert (=> d!88560 e!182852))

(declare-fun res!219727 () Bool)

(assert (=> d!88560 (=> (not res!219727) (not e!182852))))

(declare-fun lt!404226 () (_ BitVec 64))

(declare-fun lt!404228 () (_ BitVec 64))

(declare-fun lt!404229 () (_ BitVec 64))

(assert (=> d!88560 (= res!219727 (= lt!404229 (bvsub lt!404226 lt!404228)))))

(assert (=> d!88560 (or (= (bvand lt!404226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404226 lt!404228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88560 (= lt!404228 (remainingBits!0 ((_ sign_extend 32) (size!6392 (buf!6860 w1!584))) ((_ sign_extend 32) (currentByte!12700 w1!584)) ((_ sign_extend 32) (currentBit!12695 w1!584))))))

(declare-fun lt!404230 () (_ BitVec 64))

(declare-fun lt!404227 () (_ BitVec 64))

(assert (=> d!88560 (= lt!404226 (bvmul lt!404230 lt!404227))))

(assert (=> d!88560 (or (= lt!404230 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404227 (bvsdiv (bvmul lt!404230 lt!404227) lt!404230)))))

(assert (=> d!88560 (= lt!404227 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88560 (= lt!404230 ((_ sign_extend 32) (size!6392 (buf!6860 w1!584))))))

(assert (=> d!88560 (= lt!404229 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12700 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12695 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88560 (invariant!0 (currentBit!12695 w1!584) (currentByte!12700 w1!584) (size!6392 (buf!6860 w1!584)))))

(assert (=> d!88560 (= (bitIndex!0 (size!6392 (buf!6860 w1!584)) (currentByte!12700 w1!584) (currentBit!12695 w1!584)) lt!404229)))

(declare-fun b!262586 () Bool)

(declare-fun res!219728 () Bool)

(assert (=> b!262586 (=> (not res!219728) (not e!182852))))

(assert (=> b!262586 (= res!219728 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404229))))

(declare-fun b!262587 () Bool)

(declare-fun lt!404231 () (_ BitVec 64))

(assert (=> b!262587 (= e!182852 (bvsle lt!404229 (bvmul lt!404231 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262587 (or (= lt!404231 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404231 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404231)))))

(assert (=> b!262587 (= lt!404231 ((_ sign_extend 32) (size!6392 (buf!6860 w1!584))))))

(assert (= (and d!88560 res!219727) b!262586))

(assert (= (and b!262586 res!219728) b!262587))

(declare-fun m!392715 () Bool)

(assert (=> d!88560 m!392715))

(declare-fun m!392717 () Bool)

(assert (=> d!88560 m!392717))

(assert (=> b!262557 d!88560))

(declare-fun d!88570 () Bool)

(declare-fun res!219739 () Bool)

(declare-fun e!182859 () Bool)

(assert (=> d!88570 (=> (not res!219739) (not e!182859))))

(assert (=> d!88570 (= res!219739 (= (size!6392 (buf!6860 w1!584)) (size!6392 (buf!6860 w2!580))))))

(assert (=> d!88570 (= (isPrefixOf!0 w1!584 w2!580) e!182859)))

(declare-fun b!262596 () Bool)

(declare-fun res!219738 () Bool)

(assert (=> b!262596 (=> (not res!219738) (not e!182859))))

(assert (=> b!262596 (= res!219738 (bvsle (bitIndex!0 (size!6392 (buf!6860 w1!584)) (currentByte!12700 w1!584) (currentBit!12695 w1!584)) (bitIndex!0 (size!6392 (buf!6860 w2!580)) (currentByte!12700 w2!580) (currentBit!12695 w2!580))))))

(declare-fun b!262597 () Bool)

(declare-fun e!182858 () Bool)

(assert (=> b!262597 (= e!182859 e!182858)))

(declare-fun res!219737 () Bool)

(assert (=> b!262597 (=> res!219737 e!182858)))

(assert (=> b!262597 (= res!219737 (= (size!6392 (buf!6860 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262598 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14641 array!14641 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262598 (= e!182858 (arrayBitRangesEq!0 (buf!6860 w1!584) (buf!6860 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6392 (buf!6860 w1!584)) (currentByte!12700 w1!584) (currentBit!12695 w1!584))))))

(assert (= (and d!88570 res!219739) b!262596))

(assert (= (and b!262596 res!219738) b!262597))

(assert (= (and b!262597 (not res!219737)) b!262598))

(assert (=> b!262596 m!392679))

(declare-fun m!392735 () Bool)

(assert (=> b!262596 m!392735))

(assert (=> b!262598 m!392679))

(assert (=> b!262598 m!392679))

(declare-fun m!392737 () Bool)

(assert (=> b!262598 m!392737))

(assert (=> start!57272 d!88570))

(declare-fun d!88586 () Bool)

(assert (=> d!88586 (= (inv!12 w1!584) (invariant!0 (currentBit!12695 w1!584) (currentByte!12700 w1!584) (size!6392 (buf!6860 w1!584))))))

(declare-fun bs!22466 () Bool)

(assert (= bs!22466 d!88586))

(assert (=> bs!22466 m!392717))

(assert (=> start!57272 d!88586))

(declare-fun d!88588 () Bool)

(assert (=> d!88588 (= (inv!12 w2!580) (invariant!0 (currentBit!12695 w2!580) (currentByte!12700 w2!580) (size!6392 (buf!6860 w2!580))))))

(declare-fun bs!22467 () Bool)

(assert (= bs!22467 d!88588))

(declare-fun m!392739 () Bool)

(assert (=> bs!22467 m!392739))

(assert (=> start!57272 d!88588))

(declare-fun d!88590 () Bool)

(assert (=> d!88590 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404250 () Unit!18727)

(declare-fun choose!11 (BitStream!11598) Unit!18727)

(assert (=> d!88590 (= lt!404250 (choose!11 w2!580))))

(assert (=> d!88590 (= (lemmaIsPrefixRefl!0 w2!580) lt!404250)))

(declare-fun bs!22469 () Bool)

(assert (= bs!22469 d!88590))

(assert (=> bs!22469 m!392667))

(declare-fun m!392753 () Bool)

(assert (=> bs!22469 m!392753))

(assert (=> b!262556 d!88590))

(declare-fun d!88598 () Bool)

(assert (=> d!88598 (isPrefixOf!0 lt!404168 lt!404168)))

(declare-fun lt!404251 () Unit!18727)

(assert (=> d!88598 (= lt!404251 (choose!11 lt!404168))))

(assert (=> d!88598 (= (lemmaIsPrefixRefl!0 lt!404168) lt!404251)))

(declare-fun bs!22470 () Bool)

(assert (= bs!22470 d!88598))

(assert (=> bs!22470 m!392675))

(declare-fun m!392757 () Bool)

(assert (=> bs!22470 m!392757))

(assert (=> b!262556 d!88598))

(declare-fun d!88602 () Bool)

(assert (=> d!88602 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404252 () Unit!18727)

(assert (=> d!88602 (= lt!404252 (choose!11 w1!584))))

(assert (=> d!88602 (= (lemmaIsPrefixRefl!0 w1!584) lt!404252)))

(declare-fun bs!22471 () Bool)

(assert (= bs!22471 d!88602))

(assert (=> bs!22471 m!392673))

(declare-fun m!392761 () Bool)

(assert (=> bs!22471 m!392761))

(assert (=> b!262556 d!88602))

(declare-fun d!88606 () Bool)

(declare-fun res!219775 () Bool)

(declare-fun e!182883 () Bool)

(assert (=> d!88606 (=> (not res!219775) (not e!182883))))

(assert (=> d!88606 (= res!219775 (= (size!6392 (buf!6860 lt!404168)) (size!6392 (buf!6860 lt!404168))))))

(assert (=> d!88606 (= (isPrefixOf!0 lt!404168 lt!404168) e!182883)))

(declare-fun b!262632 () Bool)

(declare-fun res!219774 () Bool)

(assert (=> b!262632 (=> (not res!219774) (not e!182883))))

(assert (=> b!262632 (= res!219774 (bvsle (bitIndex!0 (size!6392 (buf!6860 lt!404168)) (currentByte!12700 lt!404168) (currentBit!12695 lt!404168)) (bitIndex!0 (size!6392 (buf!6860 lt!404168)) (currentByte!12700 lt!404168) (currentBit!12695 lt!404168))))))

(declare-fun b!262633 () Bool)

(declare-fun e!182882 () Bool)

(assert (=> b!262633 (= e!182883 e!182882)))

(declare-fun res!219773 () Bool)

(assert (=> b!262633 (=> res!219773 e!182882)))

(assert (=> b!262633 (= res!219773 (= (size!6392 (buf!6860 lt!404168)) #b00000000000000000000000000000000))))

(declare-fun b!262634 () Bool)

(assert (=> b!262634 (= e!182882 (arrayBitRangesEq!0 (buf!6860 lt!404168) (buf!6860 lt!404168) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6392 (buf!6860 lt!404168)) (currentByte!12700 lt!404168) (currentBit!12695 lt!404168))))))

(assert (= (and d!88606 res!219775) b!262632))

(assert (= (and b!262632 res!219774) b!262633))

(assert (= (and b!262633 (not res!219773)) b!262634))

(declare-fun m!392767 () Bool)

(assert (=> b!262632 m!392767))

(assert (=> b!262632 m!392767))

(assert (=> b!262634 m!392767))

(assert (=> b!262634 m!392767))

(declare-fun m!392771 () Bool)

(assert (=> b!262634 m!392771))

(assert (=> b!262556 d!88606))

(declare-fun d!88612 () Bool)

(declare-fun res!219781 () Bool)

(declare-fun e!182887 () Bool)

(assert (=> d!88612 (=> (not res!219781) (not e!182887))))

(assert (=> d!88612 (= res!219781 (= (size!6392 (buf!6860 w1!584)) (size!6392 (buf!6860 w1!584))))))

(assert (=> d!88612 (= (isPrefixOf!0 w1!584 w1!584) e!182887)))

(declare-fun b!262638 () Bool)

(declare-fun res!219780 () Bool)

(assert (=> b!262638 (=> (not res!219780) (not e!182887))))

(assert (=> b!262638 (= res!219780 (bvsle (bitIndex!0 (size!6392 (buf!6860 w1!584)) (currentByte!12700 w1!584) (currentBit!12695 w1!584)) (bitIndex!0 (size!6392 (buf!6860 w1!584)) (currentByte!12700 w1!584) (currentBit!12695 w1!584))))))

(declare-fun b!262639 () Bool)

(declare-fun e!182886 () Bool)

(assert (=> b!262639 (= e!182887 e!182886)))

(declare-fun res!219779 () Bool)

(assert (=> b!262639 (=> res!219779 e!182886)))

(assert (=> b!262639 (= res!219779 (= (size!6392 (buf!6860 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262640 () Bool)

(assert (=> b!262640 (= e!182886 (arrayBitRangesEq!0 (buf!6860 w1!584) (buf!6860 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6392 (buf!6860 w1!584)) (currentByte!12700 w1!584) (currentBit!12695 w1!584))))))

(assert (= (and d!88612 res!219781) b!262638))

(assert (= (and b!262638 res!219780) b!262639))

(assert (= (and b!262639 (not res!219779)) b!262640))

(assert (=> b!262638 m!392679))

(assert (=> b!262638 m!392679))

(assert (=> b!262640 m!392679))

(assert (=> b!262640 m!392679))

(declare-fun m!392775 () Bool)

(assert (=> b!262640 m!392775))

(assert (=> b!262556 d!88612))

(declare-fun d!88616 () Bool)

(declare-fun res!219784 () Bool)

(declare-fun e!182889 () Bool)

(assert (=> d!88616 (=> (not res!219784) (not e!182889))))

(assert (=> d!88616 (= res!219784 (= (size!6392 (buf!6860 w2!580)) (size!6392 (buf!6860 w2!580))))))

(assert (=> d!88616 (= (isPrefixOf!0 w2!580 w2!580) e!182889)))

(declare-fun b!262641 () Bool)

(declare-fun res!219783 () Bool)

(assert (=> b!262641 (=> (not res!219783) (not e!182889))))

(assert (=> b!262641 (= res!219783 (bvsle (bitIndex!0 (size!6392 (buf!6860 w2!580)) (currentByte!12700 w2!580) (currentBit!12695 w2!580)) (bitIndex!0 (size!6392 (buf!6860 w2!580)) (currentByte!12700 w2!580) (currentBit!12695 w2!580))))))

(declare-fun b!262642 () Bool)

(declare-fun e!182888 () Bool)

(assert (=> b!262642 (= e!182889 e!182888)))

(declare-fun res!219782 () Bool)

(assert (=> b!262642 (=> res!219782 e!182888)))

(assert (=> b!262642 (= res!219782 (= (size!6392 (buf!6860 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262643 () Bool)

(assert (=> b!262643 (= e!182888 (arrayBitRangesEq!0 (buf!6860 w2!580) (buf!6860 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6392 (buf!6860 w2!580)) (currentByte!12700 w2!580) (currentBit!12695 w2!580))))))

(assert (= (and d!88616 res!219784) b!262641))

(assert (= (and b!262641 res!219783) b!262642))

(assert (= (and b!262642 (not res!219782)) b!262643))

(assert (=> b!262641 m!392735))

(assert (=> b!262641 m!392735))

(assert (=> b!262643 m!392735))

(assert (=> b!262643 m!392735))

(declare-fun m!392779 () Bool)

(assert (=> b!262643 m!392779))

(assert (=> b!262556 d!88616))

(check-sat (not d!88590) (not b!262632) (not d!88602) (not b!262638) (not b!262596) (not d!88598) (not b!262634) (not b!262640) (not b!262643) (not b!262641) (not d!88586) (not d!88560) (not d!88588) (not b!262598))
(check-sat)
