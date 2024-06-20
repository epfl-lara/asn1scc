; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18676 () Bool)

(assert start!18676)

(declare-fun b!92845 () Bool)

(declare-fun res!76627 () Bool)

(declare-fun e!61002 () Bool)

(assert (=> b!92845 (=> (not res!76627) (not e!61002))))

(declare-datatypes ((array!4348 0))(
  ( (array!4349 (arr!2591 (Array (_ BitVec 32) (_ BitVec 8))) (size!1968 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3470 0))(
  ( (BitStream!3471 (buf!2344 array!4348) (currentByte!4669 (_ BitVec 32)) (currentBit!4664 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3470)

(declare-fun base!8 () BitStream!3470)

(declare-fun isPrefixOf!0 (BitStream!3470 BitStream!3470) Bool)

(assert (=> b!92845 (= res!76627 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92846 () Bool)

(assert (=> b!92846 (= e!61002 (and (bvsle ((_ sign_extend 32) (size!1968 (buf!2344 bitStream2!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4669 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4664 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1968 (buf!2344 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4669 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4664 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!92847 () Bool)

(declare-fun res!76628 () Bool)

(assert (=> b!92847 (=> (not res!76628) (not e!61002))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92847 (= res!76628 (bvslt (bitIndex!0 (size!1968 (buf!2344 base!8)) (currentByte!4669 base!8) (currentBit!4664 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92849 () Bool)

(declare-fun e!60998 () Bool)

(declare-fun array_inv!1800 (array!4348) Bool)

(assert (=> b!92849 (= e!60998 (array_inv!1800 (buf!2344 bitStream2!8)))))

(declare-fun b!92850 () Bool)

(declare-fun e!60996 () Bool)

(assert (=> b!92850 (= e!60996 (array_inv!1800 (buf!2344 base!8)))))

(declare-fun b!92851 () Bool)

(declare-fun e!61000 () Bool)

(declare-fun bitStream1!8 () BitStream!3470)

(assert (=> b!92851 (= e!61000 (array_inv!1800 (buf!2344 bitStream1!8)))))

(declare-fun b!92852 () Bool)

(declare-fun res!76631 () Bool)

(assert (=> b!92852 (=> (not res!76631) (not e!61002))))

(assert (=> b!92852 (= res!76631 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1968 (buf!2344 bitStream1!8)) (currentByte!4669 bitStream1!8) (currentBit!4664 bitStream1!8))) (bitIndex!0 (size!1968 (buf!2344 bitStream2!8)) (currentByte!4669 bitStream2!8) (currentBit!4664 bitStream2!8))))))

(declare-fun b!92853 () Bool)

(declare-fun res!76634 () Bool)

(assert (=> b!92853 (=> (not res!76634) (not e!61002))))

(assert (=> b!92853 (= res!76634 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92854 () Bool)

(declare-fun res!76633 () Bool)

(assert (=> b!92854 (=> (not res!76633) (not e!61002))))

(declare-datatypes ((List!841 0))(
  ( (Nil!838) (Cons!837 (h!956 Bool) (t!1591 List!841)) )
))
(declare-fun listBits!13 () List!841)

(declare-fun length!432 (List!841) Int)

(assert (=> b!92854 (= res!76633 (> (length!432 listBits!13) 0))))

(declare-fun b!92848 () Bool)

(declare-fun res!76630 () Bool)

(assert (=> b!92848 (=> (not res!76630) (not e!61002))))

(assert (=> b!92848 (= res!76630 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun res!76629 () Bool)

(assert (=> start!18676 (=> (not res!76629) (not e!61002))))

(assert (=> start!18676 (= res!76629 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18676 e!61002))

(assert (=> start!18676 true))

(declare-fun inv!12 (BitStream!3470) Bool)

(assert (=> start!18676 (and (inv!12 bitStream1!8) e!61000)))

(assert (=> start!18676 (and (inv!12 bitStream2!8) e!60998)))

(assert (=> start!18676 (and (inv!12 base!8) e!60996)))

(declare-fun b!92855 () Bool)

(declare-fun res!76626 () Bool)

(assert (=> b!92855 (=> (not res!76626) (not e!61002))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92855 (= res!76626 (validate_offset_bits!1 ((_ sign_extend 32) (size!1968 (buf!2344 bitStream1!8))) ((_ sign_extend 32) (currentByte!4669 bitStream1!8)) ((_ sign_extend 32) (currentBit!4664 bitStream1!8)) nBits!484))))

(declare-fun b!92856 () Bool)

(declare-fun res!76632 () Bool)

(assert (=> b!92856 (=> (not res!76632) (not e!61002))))

(assert (=> b!92856 (= res!76632 (and (= (buf!2344 bitStream1!8) (buf!2344 bitStream2!8)) (= (buf!2344 bitStream1!8) (buf!2344 base!8))))))

(assert (= (and start!18676 res!76629) b!92854))

(assert (= (and b!92854 res!76633) b!92853))

(assert (= (and b!92853 res!76634) b!92845))

(assert (= (and b!92845 res!76627) b!92848))

(assert (= (and b!92848 res!76630) b!92856))

(assert (= (and b!92856 res!76632) b!92847))

(assert (= (and b!92847 res!76628) b!92852))

(assert (= (and b!92852 res!76631) b!92855))

(assert (= (and b!92855 res!76626) b!92846))

(assert (= start!18676 b!92851))

(assert (= start!18676 b!92849))

(assert (= start!18676 b!92850))

(declare-fun m!136729 () Bool)

(assert (=> b!92852 m!136729))

(declare-fun m!136731 () Bool)

(assert (=> b!92852 m!136731))

(declare-fun m!136733 () Bool)

(assert (=> b!92845 m!136733))

(declare-fun m!136735 () Bool)

(assert (=> b!92854 m!136735))

(declare-fun m!136737 () Bool)

(assert (=> b!92853 m!136737))

(declare-fun m!136739 () Bool)

(assert (=> b!92848 m!136739))

(declare-fun m!136741 () Bool)

(assert (=> b!92855 m!136741))

(declare-fun m!136743 () Bool)

(assert (=> b!92849 m!136743))

(declare-fun m!136745 () Bool)

(assert (=> b!92850 m!136745))

(declare-fun m!136747 () Bool)

(assert (=> b!92847 m!136747))

(declare-fun m!136749 () Bool)

(assert (=> start!18676 m!136749))

(declare-fun m!136751 () Bool)

(assert (=> start!18676 m!136751))

(declare-fun m!136753 () Bool)

(assert (=> start!18676 m!136753))

(declare-fun m!136755 () Bool)

(assert (=> b!92851 m!136755))

(push 1)

(assert (not b!92853))

(assert (not start!18676))

(assert (not b!92848))

(assert (not b!92850))

(assert (not b!92849))

(assert (not b!92854))

(assert (not b!92847))

(assert (not b!92852))

(assert (not b!92845))

(assert (not b!92855))

(assert (not b!92851))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28930 () Bool)

(declare-fun size!1971 (List!841) Int)

(assert (=> d!28930 (= (length!432 listBits!13) (size!1971 listBits!13))))

(declare-fun bs!7124 () Bool)

(assert (= bs!7124 d!28930))

(declare-fun m!136787 () Bool)

(assert (=> bs!7124 m!136787))

(assert (=> b!92854 d!28930))

(declare-fun d!28934 () Bool)

(declare-fun res!76678 () Bool)

(declare-fun e!61029 () Bool)

(assert (=> d!28934 (=> (not res!76678) (not e!61029))))

(assert (=> d!28934 (= res!76678 (= (size!1968 (buf!2344 bitStream1!8)) (size!1968 (buf!2344 bitStream2!8))))))

(assert (=> d!28934 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61029)))

(declare-fun b!92900 () Bool)

(declare-fun res!76679 () Bool)

(assert (=> b!92900 (=> (not res!76679) (not e!61029))))

(assert (=> b!92900 (= res!76679 (bvsle (bitIndex!0 (size!1968 (buf!2344 bitStream1!8)) (currentByte!4669 bitStream1!8) (currentBit!4664 bitStream1!8)) (bitIndex!0 (size!1968 (buf!2344 bitStream2!8)) (currentByte!4669 bitStream2!8) (currentBit!4664 bitStream2!8))))))

(declare-fun b!92901 () Bool)

(declare-fun e!61030 () Bool)

(assert (=> b!92901 (= e!61029 e!61030)))

(declare-fun res!76680 () Bool)

(assert (=> b!92901 (=> res!76680 e!61030)))

(assert (=> b!92901 (= res!76680 (= (size!1968 (buf!2344 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92902 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4348 array!4348 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92902 (= e!61030 (arrayBitRangesEq!0 (buf!2344 bitStream1!8) (buf!2344 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1968 (buf!2344 bitStream1!8)) (currentByte!4669 bitStream1!8) (currentBit!4664 bitStream1!8))))))

(assert (= (and d!28934 res!76678) b!92900))

(assert (= (and b!92900 res!76679) b!92901))

(assert (= (and b!92901 (not res!76680)) b!92902))

(assert (=> b!92900 m!136729))

(assert (=> b!92900 m!136731))

(assert (=> b!92902 m!136729))

(assert (=> b!92902 m!136729))

(declare-fun m!136791 () Bool)

(assert (=> b!92902 m!136791))

(assert (=> b!92848 d!28934))

(declare-fun d!28938 () Bool)

(declare-fun res!76684 () Bool)

(declare-fun e!61033 () Bool)

(assert (=> d!28938 (=> (not res!76684) (not e!61033))))

(assert (=> d!28938 (= res!76684 (= (size!1968 (buf!2344 bitStream1!8)) (size!1968 (buf!2344 base!8))))))

(assert (=> d!28938 (= (isPrefixOf!0 bitStream1!8 base!8) e!61033)))

(declare-fun b!92906 () Bool)

(declare-fun res!76685 () Bool)

(assert (=> b!92906 (=> (not res!76685) (not e!61033))))

(assert (=> b!92906 (= res!76685 (bvsle (bitIndex!0 (size!1968 (buf!2344 bitStream1!8)) (currentByte!4669 bitStream1!8) (currentBit!4664 bitStream1!8)) (bitIndex!0 (size!1968 (buf!2344 base!8)) (currentByte!4669 base!8) (currentBit!4664 base!8))))))

(declare-fun b!92907 () Bool)

(declare-fun e!61034 () Bool)

(assert (=> b!92907 (= e!61033 e!61034)))

(declare-fun res!76686 () Bool)

(assert (=> b!92907 (=> res!76686 e!61034)))

(assert (=> b!92907 (= res!76686 (= (size!1968 (buf!2344 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92908 () Bool)

(assert (=> b!92908 (= e!61034 (arrayBitRangesEq!0 (buf!2344 bitStream1!8) (buf!2344 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1968 (buf!2344 bitStream1!8)) (currentByte!4669 bitStream1!8) (currentBit!4664 bitStream1!8))))))

(assert (= (and d!28938 res!76684) b!92906))

(assert (= (and b!92906 res!76685) b!92907))

(assert (= (and b!92907 (not res!76686)) b!92908))

(assert (=> b!92906 m!136729))

(assert (=> b!92906 m!136747))

(assert (=> b!92908 m!136729))

(assert (=> b!92908 m!136729))

(declare-fun m!136795 () Bool)

(assert (=> b!92908 m!136795))

(assert (=> b!92853 d!28938))

(declare-fun d!28942 () Bool)

(assert (=> d!28942 (= (array_inv!1800 (buf!2344 base!8)) (bvsge (size!1968 (buf!2344 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!92850 d!28942))

(declare-fun d!28946 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28946 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1968 (buf!2344 bitStream1!8))) ((_ sign_extend 32) (currentByte!4669 bitStream1!8)) ((_ sign_extend 32) (currentBit!4664 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1968 (buf!2344 bitStream1!8))) ((_ sign_extend 32) (currentByte!4669 bitStream1!8)) ((_ sign_extend 32) (currentBit!4664 bitStream1!8))) nBits!484))))

(declare-fun bs!7126 () Bool)

(assert (= bs!7126 d!28946))

(declare-fun m!136801 () Bool)

(assert (=> bs!7126 m!136801))

(assert (=> b!92855 d!28946))

(declare-fun d!28954 () Bool)

(assert (=> d!28954 (= (array_inv!1800 (buf!2344 bitStream2!8)) (bvsge (size!1968 (buf!2344 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!92849 d!28954))

(declare-fun d!28956 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!28956 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4664 bitStream1!8) (currentByte!4669 bitStream1!8) (size!1968 (buf!2344 bitStream1!8))))))

(declare-fun bs!7127 () Bool)

(assert (= bs!7127 d!28956))

(declare-fun m!136805 () Bool)

(assert (=> bs!7127 m!136805))

(assert (=> start!18676 d!28956))

(declare-fun d!28960 () Bool)

(assert (=> d!28960 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4664 bitStream2!8) (currentByte!4669 bitStream2!8) (size!1968 (buf!2344 bitStream2!8))))))

(declare-fun bs!7128 () Bool)

(assert (= bs!7128 d!28960))

(declare-fun m!136807 () Bool)

(assert (=> bs!7128 m!136807))

(assert (=> start!18676 d!28960))

(declare-fun d!28962 () Bool)

(assert (=> d!28962 (= (inv!12 base!8) (invariant!0 (currentBit!4664 base!8) (currentByte!4669 base!8) (size!1968 (buf!2344 base!8))))))

(declare-fun bs!7129 () Bool)

(assert (= bs!7129 d!28962))

(declare-fun m!136809 () Bool)

(assert (=> bs!7129 m!136809))

(assert (=> start!18676 d!28962))

(declare-fun d!28964 () Bool)

(assert (=> d!28964 (= (array_inv!1800 (buf!2344 bitStream1!8)) (bvsge (size!1968 (buf!2344 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!92851 d!28964))

(declare-fun d!28966 () Bool)

(declare-fun res!76697 () Bool)

(declare-fun e!61041 () Bool)

(assert (=> d!28966 (=> (not res!76697) (not e!61041))))

(assert (=> d!28966 (= res!76697 (= (size!1968 (buf!2344 bitStream2!8)) (size!1968 (buf!2344 base!8))))))

(assert (=> d!28966 (= (isPrefixOf!0 bitStream2!8 base!8) e!61041)))

(declare-fun b!92919 () Bool)

(declare-fun res!76698 () Bool)

(assert (=> b!92919 (=> (not res!76698) (not e!61041))))

(assert (=> b!92919 (= res!76698 (bvsle (bitIndex!0 (size!1968 (buf!2344 bitStream2!8)) (currentByte!4669 bitStream2!8) (currentBit!4664 bitStream2!8)) (bitIndex!0 (size!1968 (buf!2344 base!8)) (currentByte!4669 base!8) (currentBit!4664 base!8))))))

(declare-fun b!92920 () Bool)

(declare-fun e!61042 () Bool)

(assert (=> b!92920 (= e!61041 e!61042)))

(declare-fun res!76699 () Bool)

(assert (=> b!92920 (=> res!76699 e!61042)))

(assert (=> b!92920 (= res!76699 (= (size!1968 (buf!2344 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!92921 () Bool)

(assert (=> b!92921 (= e!61042 (arrayBitRangesEq!0 (buf!2344 bitStream2!8) (buf!2344 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1968 (buf!2344 bitStream2!8)) (currentByte!4669 bitStream2!8) (currentBit!4664 bitStream2!8))))))

(assert (= (and d!28966 res!76697) b!92919))

(assert (= (and b!92919 res!76698) b!92920))

(assert (= (and b!92920 (not res!76699)) b!92921))

(assert (=> b!92919 m!136731))

(assert (=> b!92919 m!136747))

(assert (=> b!92921 m!136731))

(assert (=> b!92921 m!136731))

(declare-fun m!136811 () Bool)

(assert (=> b!92921 m!136811))

(assert (=> b!92845 d!28966))

(declare-fun d!28968 () Bool)

(declare-fun e!61045 () Bool)

(assert (=> d!28968 e!61045))

(declare-fun res!76705 () Bool)

(assert (=> d!28968 (=> (not res!76705) (not e!61045))))

(declare-fun lt!138305 () (_ BitVec 64))

(declare-fun lt!138303 () (_ BitVec 64))

(declare-fun lt!138306 () (_ BitVec 64))

(assert (=> d!28968 (= res!76705 (= lt!138305 (bvsub lt!138306 lt!138303)))))

(assert (=> d!28968 (or (= (bvand lt!138306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138306 lt!138303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28968 (= lt!138303 (remainingBits!0 ((_ sign_extend 32) (size!1968 (buf!2344 base!8))) ((_ sign_extend 32) (currentByte!4669 base!8)) ((_ sign_extend 32) (currentBit!4664 base!8))))))

(declare-fun lt!138301 () (_ BitVec 64))

(declare-fun lt!138302 () (_ BitVec 64))

(assert (=> d!28968 (= lt!138306 (bvmul lt!138301 lt!138302))))

(assert (=> d!28968 (or (= lt!138301 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138302 (bvsdiv (bvmul lt!138301 lt!138302) lt!138301)))))

(assert (=> d!28968 (= lt!138302 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28968 (= lt!138301 ((_ sign_extend 32) (size!1968 (buf!2344 base!8))))))

(assert (=> d!28968 (= lt!138305 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4669 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4664 base!8))))))

(assert (=> d!28968 (invariant!0 (currentBit!4664 base!8) (currentByte!4669 base!8) (size!1968 (buf!2344 base!8)))))

(assert (=> d!28968 (= (bitIndex!0 (size!1968 (buf!2344 base!8)) (currentByte!4669 base!8) (currentBit!4664 base!8)) lt!138305)))

(declare-fun b!92926 () Bool)

(declare-fun res!76704 () Bool)

(assert (=> b!92926 (=> (not res!76704) (not e!61045))))

(assert (=> b!92926 (= res!76704 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138305))))

(declare-fun b!92927 () Bool)

(declare-fun lt!138304 () (_ BitVec 64))

(assert (=> b!92927 (= e!61045 (bvsle lt!138305 (bvmul lt!138304 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92927 (or (= lt!138304 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138304 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138304)))))

(assert (=> b!92927 (= lt!138304 ((_ sign_extend 32) (size!1968 (buf!2344 base!8))))))

(assert (= (and d!28968 res!76705) b!92926))

(assert (= (and b!92926 res!76704) b!92927))

(declare-fun m!136813 () Bool)

(assert (=> d!28968 m!136813))

(assert (=> d!28968 m!136809))

(assert (=> b!92847 d!28968))

(declare-fun d!28970 () Bool)

(declare-fun e!61046 () Bool)

(assert (=> d!28970 e!61046))

(declare-fun res!76707 () Bool)

(assert (=> d!28970 (=> (not res!76707) (not e!61046))))

(declare-fun lt!138309 () (_ BitVec 64))

(declare-fun lt!138312 () (_ BitVec 64))

(declare-fun lt!138311 () (_ BitVec 64))

(assert (=> d!28970 (= res!76707 (= lt!138311 (bvsub lt!138312 lt!138309)))))

(assert (=> d!28970 (or (= (bvand lt!138312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138312 lt!138309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28970 (= lt!138309 (remainingBits!0 ((_ sign_extend 32) (size!1968 (buf!2344 bitStream1!8))) ((_ sign_extend 32) (currentByte!4669 bitStream1!8)) ((_ sign_extend 32) (currentBit!4664 bitStream1!8))))))

(declare-fun lt!138307 () (_ BitVec 64))

(declare-fun lt!138308 () (_ BitVec 64))

(assert (=> d!28970 (= lt!138312 (bvmul lt!138307 lt!138308))))

(assert (=> d!28970 (or (= lt!138307 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138308 (bvsdiv (bvmul lt!138307 lt!138308) lt!138307)))))

(assert (=> d!28970 (= lt!138308 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28970 (= lt!138307 ((_ sign_extend 32) (size!1968 (buf!2344 bitStream1!8))))))

(assert (=> d!28970 (= lt!138311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4669 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4664 bitStream1!8))))))

(assert (=> d!28970 (invariant!0 (currentBit!4664 bitStream1!8) (currentByte!4669 bitStream1!8) (size!1968 (buf!2344 bitStream1!8)))))

(assert (=> d!28970 (= (bitIndex!0 (size!1968 (buf!2344 bitStream1!8)) (currentByte!4669 bitStream1!8) (currentBit!4664 bitStream1!8)) lt!138311)))

(declare-fun b!92928 () Bool)

(declare-fun res!76706 () Bool)

(assert (=> b!92928 (=> (not res!76706) (not e!61046))))

(assert (=> b!92928 (= res!76706 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138311))))

(declare-fun b!92929 () Bool)

(declare-fun lt!138310 () (_ BitVec 64))

(assert (=> b!92929 (= e!61046 (bvsle lt!138311 (bvmul lt!138310 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92929 (or (= lt!138310 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138310 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138310)))))

(assert (=> b!92929 (= lt!138310 ((_ sign_extend 32) (size!1968 (buf!2344 bitStream1!8))))))

(assert (= (and d!28970 res!76707) b!92928))

(assert (= (and b!92928 res!76706) b!92929))

(assert (=> d!28970 m!136801))

(assert (=> d!28970 m!136805))

(assert (=> b!92852 d!28970))

(declare-fun d!28972 () Bool)

(declare-fun e!61047 () Bool)

(assert (=> d!28972 e!61047))

(declare-fun res!76709 () Bool)

(assert (=> d!28972 (=> (not res!76709) (not e!61047))))

(declare-fun lt!138315 () (_ BitVec 64))

(declare-fun lt!138318 () (_ BitVec 64))

(declare-fun lt!138317 () (_ BitVec 64))

(assert (=> d!28972 (= res!76709 (= lt!138317 (bvsub lt!138318 lt!138315)))))

(assert (=> d!28972 (or (= (bvand lt!138318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138315 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138318 lt!138315) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28972 (= lt!138315 (remainingBits!0 ((_ sign_extend 32) (size!1968 (buf!2344 bitStream2!8))) ((_ sign_extend 32) (currentByte!4669 bitStream2!8)) ((_ sign_extend 32) (currentBit!4664 bitStream2!8))))))

(declare-fun lt!138313 () (_ BitVec 64))

(declare-fun lt!138314 () (_ BitVec 64))

(assert (=> d!28972 (= lt!138318 (bvmul lt!138313 lt!138314))))

(assert (=> d!28972 (or (= lt!138313 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138314 (bvsdiv (bvmul lt!138313 lt!138314) lt!138313)))))

(assert (=> d!28972 (= lt!138314 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28972 (= lt!138313 ((_ sign_extend 32) (size!1968 (buf!2344 bitStream2!8))))))

(assert (=> d!28972 (= lt!138317 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4669 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4664 bitStream2!8))))))

(assert (=> d!28972 (invariant!0 (currentBit!4664 bitStream2!8) (currentByte!4669 bitStream2!8) (size!1968 (buf!2344 bitStream2!8)))))

(assert (=> d!28972 (= (bitIndex!0 (size!1968 (buf!2344 bitStream2!8)) (currentByte!4669 bitStream2!8) (currentBit!4664 bitStream2!8)) lt!138317)))

(declare-fun b!92930 () Bool)

(declare-fun res!76708 () Bool)

(assert (=> b!92930 (=> (not res!76708) (not e!61047))))

(assert (=> b!92930 (= res!76708 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138317))))

(declare-fun b!92931 () Bool)

(declare-fun lt!138316 () (_ BitVec 64))

(assert (=> b!92931 (= e!61047 (bvsle lt!138317 (bvmul lt!138316 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92931 (or (= lt!138316 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138316 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138316)))))

(assert (=> b!92931 (= lt!138316 ((_ sign_extend 32) (size!1968 (buf!2344 bitStream2!8))))))

(assert (= (and d!28972 res!76709) b!92930))

(assert (= (and b!92930 res!76708) b!92931))

(declare-fun m!136815 () Bool)

(assert (=> d!28972 m!136815))

(assert (=> d!28972 m!136807))

(assert (=> b!92852 d!28972))

(push 1)

(assert (not d!28962))

(assert (not b!92919))

(assert (not d!28960))

(assert (not b!92906))

(assert (not d!28930))

(assert (not b!92921))

(assert (not d!28972))

(assert (not b!92908))

(assert (not d!28968))

(assert (not b!92902))

(assert (not d!28946))

(assert (not d!28970))

(assert (not b!92900))

(assert (not d!28956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

