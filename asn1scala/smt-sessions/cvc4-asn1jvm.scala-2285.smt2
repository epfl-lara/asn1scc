; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57940 () Bool)

(assert start!57940)

(declare-fun b!265892 () Bool)

(declare-fun e!185875 () Bool)

(declare-datatypes ((array!14820 0))(
  ( (array!14821 (arr!7449 (Array (_ BitVec 32) (_ BitVec 8))) (size!6462 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11738 0))(
  ( (BitStream!11739 (buf!6930 array!14820) (currentByte!12818 (_ BitVec 32)) (currentBit!12813 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11738)

(declare-fun w2!580 () BitStream!11738)

(assert (=> b!265892 (= e!185875 (= (size!6462 (buf!6930 w1!584)) (size!6462 (buf!6930 w2!580))))))

(declare-fun res!222159 () Bool)

(declare-fun e!185872 () Bool)

(assert (=> start!57940 (=> (not res!222159) (not e!185872))))

(declare-fun isPrefixOf!0 (BitStream!11738 BitStream!11738) Bool)

(assert (=> start!57940 (= res!222159 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57940 e!185872))

(declare-fun e!185874 () Bool)

(declare-fun inv!12 (BitStream!11738) Bool)

(assert (=> start!57940 (and (inv!12 w1!584) e!185874)))

(declare-fun e!185873 () Bool)

(assert (=> start!57940 (and (inv!12 w2!580) e!185873)))

(declare-fun b!265893 () Bool)

(declare-fun e!185871 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14820 array!14820 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265893 (= e!185871 (not (arrayBitRangesEq!0 (buf!6930 w1!584) (buf!6930 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584)))))))

(declare-fun b!265894 () Bool)

(declare-fun array_inv!6186 (array!14820) Bool)

(assert (=> b!265894 (= e!185874 (array_inv!6186 (buf!6930 w1!584)))))

(declare-fun b!265895 () Bool)

(assert (=> b!265895 (= e!185873 (array_inv!6186 (buf!6930 w2!580)))))

(declare-fun b!265896 () Bool)

(assert (=> b!265896 (= e!185872 (not e!185875))))

(declare-fun res!222156 () Bool)

(assert (=> b!265896 (=> res!222156 e!185875)))

(assert (=> b!265896 (= res!222156 e!185871)))

(declare-fun res!222158 () Bool)

(assert (=> b!265896 (=> (not res!222158) (not e!185871))))

(assert (=> b!265896 (= res!222158 (not (= (size!6462 (buf!6930 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!265896 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18891 0))(
  ( (Unit!18892) )
))
(declare-fun lt!406748 () Unit!18891)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11738) Unit!18891)

(assert (=> b!265896 (= lt!406748 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406747 () BitStream!11738)

(assert (=> b!265896 (isPrefixOf!0 lt!406747 lt!406747)))

(declare-fun lt!406746 () Unit!18891)

(assert (=> b!265896 (= lt!406746 (lemmaIsPrefixRefl!0 lt!406747))))

(assert (=> b!265896 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406745 () Unit!18891)

(assert (=> b!265896 (= lt!406745 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265896 (= lt!406747 (BitStream!11739 (buf!6930 w2!580) (currentByte!12818 w1!584) (currentBit!12813 w1!584)))))

(declare-fun b!265897 () Bool)

(declare-fun res!222157 () Bool)

(assert (=> b!265897 (=> res!222157 e!185875)))

(assert (=> b!265897 (= res!222157 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584))))))

(declare-fun b!265898 () Bool)

(declare-fun res!222160 () Bool)

(assert (=> b!265898 (=> res!222160 e!185875)))

(assert (=> b!265898 (= res!222160 (= (size!6462 (buf!6930 w1!584)) #b00000000000000000000000000000000))))

(assert (= (and start!57940 res!222159) b!265896))

(assert (= (and b!265896 res!222158) b!265893))

(assert (= (and b!265896 (not res!222156)) b!265898))

(assert (= (and b!265898 (not res!222160)) b!265897))

(assert (= (and b!265897 (not res!222157)) b!265892))

(assert (= start!57940 b!265894))

(assert (= start!57940 b!265895))

(declare-fun m!396663 () Bool)

(assert (=> b!265896 m!396663))

(declare-fun m!396665 () Bool)

(assert (=> b!265896 m!396665))

(declare-fun m!396667 () Bool)

(assert (=> b!265896 m!396667))

(declare-fun m!396669 () Bool)

(assert (=> b!265896 m!396669))

(declare-fun m!396671 () Bool)

(assert (=> b!265896 m!396671))

(declare-fun m!396673 () Bool)

(assert (=> b!265896 m!396673))

(declare-fun m!396675 () Bool)

(assert (=> start!57940 m!396675))

(declare-fun m!396677 () Bool)

(assert (=> start!57940 m!396677))

(declare-fun m!396679 () Bool)

(assert (=> start!57940 m!396679))

(declare-fun m!396681 () Bool)

(assert (=> b!265897 m!396681))

(declare-fun m!396683 () Bool)

(assert (=> b!265894 m!396683))

(assert (=> b!265893 m!396681))

(assert (=> b!265893 m!396681))

(declare-fun m!396685 () Bool)

(assert (=> b!265893 m!396685))

(declare-fun m!396687 () Bool)

(assert (=> b!265895 m!396687))

(push 1)

(assert (not b!265895))

(assert (not start!57940))

(assert (not b!265894))

(assert (not b!265896))

(assert (not b!265897))

(assert (not b!265893))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89784 () Bool)

(assert (=> d!89784 (= (array_inv!6186 (buf!6930 w2!580)) (bvsge (size!6462 (buf!6930 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265895 d!89784))

(declare-fun d!89786 () Bool)

(assert (=> d!89786 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406751 () Unit!18891)

(declare-fun choose!11 (BitStream!11738) Unit!18891)

(assert (=> d!89786 (= lt!406751 (choose!11 w2!580))))

(assert (=> d!89786 (= (lemmaIsPrefixRefl!0 w2!580) lt!406751)))

(declare-fun bs!22792 () Bool)

(assert (= bs!22792 d!89786))

(assert (=> bs!22792 m!396671))

(declare-fun m!396689 () Bool)

(assert (=> bs!22792 m!396689))

(assert (=> b!265896 d!89786))

(declare-fun d!89788 () Bool)

(assert (=> d!89788 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406752 () Unit!18891)

(assert (=> d!89788 (= lt!406752 (choose!11 w1!584))))

(assert (=> d!89788 (= (lemmaIsPrefixRefl!0 w1!584) lt!406752)))

(declare-fun bs!22793 () Bool)

(assert (= bs!22793 d!89788))

(assert (=> bs!22793 m!396669))

(declare-fun m!396691 () Bool)

(assert (=> bs!22793 m!396691))

(assert (=> b!265896 d!89788))

(declare-fun d!89790 () Bool)

(assert (=> d!89790 (isPrefixOf!0 lt!406747 lt!406747)))

(declare-fun lt!406753 () Unit!18891)

(assert (=> d!89790 (= lt!406753 (choose!11 lt!406747))))

(assert (=> d!89790 (= (lemmaIsPrefixRefl!0 lt!406747) lt!406753)))

(declare-fun bs!22794 () Bool)

(assert (= bs!22794 d!89790))

(assert (=> bs!22794 m!396665))

(declare-fun m!396693 () Bool)

(assert (=> bs!22794 m!396693))

(assert (=> b!265896 d!89790))

(declare-fun d!89792 () Bool)

(declare-fun res!222168 () Bool)

(declare-fun e!185883 () Bool)

(assert (=> d!89792 (=> (not res!222168) (not e!185883))))

(assert (=> d!89792 (= res!222168 (= (size!6462 (buf!6930 lt!406747)) (size!6462 (buf!6930 lt!406747))))))

(assert (=> d!89792 (= (isPrefixOf!0 lt!406747 lt!406747) e!185883)))

(declare-fun b!265905 () Bool)

(declare-fun res!222169 () Bool)

(assert (=> b!265905 (=> (not res!222169) (not e!185883))))

(assert (=> b!265905 (= res!222169 (bvsle (bitIndex!0 (size!6462 (buf!6930 lt!406747)) (currentByte!12818 lt!406747) (currentBit!12813 lt!406747)) (bitIndex!0 (size!6462 (buf!6930 lt!406747)) (currentByte!12818 lt!406747) (currentBit!12813 lt!406747))))))

(declare-fun b!265906 () Bool)

(declare-fun e!185882 () Bool)

(assert (=> b!265906 (= e!185883 e!185882)))

(declare-fun res!222167 () Bool)

(assert (=> b!265906 (=> res!222167 e!185882)))

(assert (=> b!265906 (= res!222167 (= (size!6462 (buf!6930 lt!406747)) #b00000000000000000000000000000000))))

(declare-fun b!265907 () Bool)

(assert (=> b!265907 (= e!185882 (arrayBitRangesEq!0 (buf!6930 lt!406747) (buf!6930 lt!406747) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6462 (buf!6930 lt!406747)) (currentByte!12818 lt!406747) (currentBit!12813 lt!406747))))))

(assert (= (and d!89792 res!222168) b!265905))

(assert (= (and b!265905 res!222169) b!265906))

(assert (= (and b!265906 (not res!222167)) b!265907))

(declare-fun m!396695 () Bool)

(assert (=> b!265905 m!396695))

(assert (=> b!265905 m!396695))

(assert (=> b!265907 m!396695))

(assert (=> b!265907 m!396695))

(declare-fun m!396697 () Bool)

(assert (=> b!265907 m!396697))

(assert (=> b!265896 d!89792))

(declare-fun d!89796 () Bool)

(declare-fun res!222171 () Bool)

(declare-fun e!185885 () Bool)

(assert (=> d!89796 (=> (not res!222171) (not e!185885))))

(assert (=> d!89796 (= res!222171 (= (size!6462 (buf!6930 w1!584)) (size!6462 (buf!6930 w1!584))))))

(assert (=> d!89796 (= (isPrefixOf!0 w1!584 w1!584) e!185885)))

(declare-fun b!265908 () Bool)

(declare-fun res!222172 () Bool)

(assert (=> b!265908 (=> (not res!222172) (not e!185885))))

(assert (=> b!265908 (= res!222172 (bvsle (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584)) (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584))))))

(declare-fun b!265909 () Bool)

(declare-fun e!185884 () Bool)

(assert (=> b!265909 (= e!185885 e!185884)))

(declare-fun res!222170 () Bool)

(assert (=> b!265909 (=> res!222170 e!185884)))

(assert (=> b!265909 (= res!222170 (= (size!6462 (buf!6930 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265910 () Bool)

(assert (=> b!265910 (= e!185884 (arrayBitRangesEq!0 (buf!6930 w1!584) (buf!6930 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584))))))

(assert (= (and d!89796 res!222171) b!265908))

(assert (= (and b!265908 res!222172) b!265909))

(assert (= (and b!265909 (not res!222170)) b!265910))

(assert (=> b!265908 m!396681))

(assert (=> b!265908 m!396681))

(assert (=> b!265910 m!396681))

(assert (=> b!265910 m!396681))

(declare-fun m!396699 () Bool)

(assert (=> b!265910 m!396699))

(assert (=> b!265896 d!89796))

(declare-fun d!89798 () Bool)

(declare-fun res!222174 () Bool)

(declare-fun e!185887 () Bool)

(assert (=> d!89798 (=> (not res!222174) (not e!185887))))

(assert (=> d!89798 (= res!222174 (= (size!6462 (buf!6930 w2!580)) (size!6462 (buf!6930 w2!580))))))

(assert (=> d!89798 (= (isPrefixOf!0 w2!580 w2!580) e!185887)))

(declare-fun b!265911 () Bool)

(declare-fun res!222175 () Bool)

(assert (=> b!265911 (=> (not res!222175) (not e!185887))))

(assert (=> b!265911 (= res!222175 (bvsle (bitIndex!0 (size!6462 (buf!6930 w2!580)) (currentByte!12818 w2!580) (currentBit!12813 w2!580)) (bitIndex!0 (size!6462 (buf!6930 w2!580)) (currentByte!12818 w2!580) (currentBit!12813 w2!580))))))

(declare-fun b!265912 () Bool)

(declare-fun e!185886 () Bool)

(assert (=> b!265912 (= e!185887 e!185886)))

(declare-fun res!222173 () Bool)

(assert (=> b!265912 (=> res!222173 e!185886)))

(assert (=> b!265912 (= res!222173 (= (size!6462 (buf!6930 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!265913 () Bool)

(assert (=> b!265913 (= e!185886 (arrayBitRangesEq!0 (buf!6930 w2!580) (buf!6930 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6462 (buf!6930 w2!580)) (currentByte!12818 w2!580) (currentBit!12813 w2!580))))))

(assert (= (and d!89798 res!222174) b!265911))

(assert (= (and b!265911 res!222175) b!265912))

(assert (= (and b!265912 (not res!222173)) b!265913))

(declare-fun m!396701 () Bool)

(assert (=> b!265911 m!396701))

(assert (=> b!265911 m!396701))

(assert (=> b!265913 m!396701))

(assert (=> b!265913 m!396701))

(declare-fun m!396703 () Bool)

(assert (=> b!265913 m!396703))

(assert (=> b!265896 d!89798))

(declare-fun d!89800 () Bool)

(declare-fun e!185908 () Bool)

(assert (=> d!89800 e!185908))

(declare-fun res!222196 () Bool)

(assert (=> d!89800 (=> (not res!222196) (not e!185908))))

(declare-fun lt!406776 () (_ BitVec 64))

(declare-fun lt!406779 () (_ BitVec 64))

(declare-fun lt!406780 () (_ BitVec 64))

(assert (=> d!89800 (= res!222196 (= lt!406776 (bvsub lt!406779 lt!406780)))))

(assert (=> d!89800 (or (= (bvand lt!406779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406780 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406779 lt!406780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89800 (= lt!406780 (remainingBits!0 ((_ sign_extend 32) (size!6462 (buf!6930 w1!584))) ((_ sign_extend 32) (currentByte!12818 w1!584)) ((_ sign_extend 32) (currentBit!12813 w1!584))))))

(declare-fun lt!406778 () (_ BitVec 64))

(declare-fun lt!406777 () (_ BitVec 64))

(assert (=> d!89800 (= lt!406779 (bvmul lt!406778 lt!406777))))

(assert (=> d!89800 (or (= lt!406778 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406777 (bvsdiv (bvmul lt!406778 lt!406777) lt!406778)))))

(assert (=> d!89800 (= lt!406777 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89800 (= lt!406778 ((_ sign_extend 32) (size!6462 (buf!6930 w1!584))))))

(assert (=> d!89800 (= lt!406776 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12818 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12813 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89800 (invariant!0 (currentBit!12813 w1!584) (currentByte!12818 w1!584) (size!6462 (buf!6930 w1!584)))))

(assert (=> d!89800 (= (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584)) lt!406776)))

(declare-fun b!265939 () Bool)

(declare-fun res!222195 () Bool)

(assert (=> b!265939 (=> (not res!222195) (not e!185908))))

(assert (=> b!265939 (= res!222195 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406776))))

(declare-fun b!265940 () Bool)

(declare-fun lt!406775 () (_ BitVec 64))

(assert (=> b!265940 (= e!185908 (bvsle lt!406776 (bvmul lt!406775 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265940 (or (= lt!406775 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406775 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406775)))))

(assert (=> b!265940 (= lt!406775 ((_ sign_extend 32) (size!6462 (buf!6930 w1!584))))))

(assert (= (and d!89800 res!222196) b!265939))

(assert (= (and b!265939 res!222195) b!265940))

(declare-fun m!396721 () Bool)

(assert (=> d!89800 m!396721))

(declare-fun m!396723 () Bool)

(assert (=> d!89800 m!396723))

(assert (=> b!265897 d!89800))

(declare-fun d!89804 () Bool)

(declare-fun res!222198 () Bool)

(declare-fun e!185910 () Bool)

(assert (=> d!89804 (=> (not res!222198) (not e!185910))))

(assert (=> d!89804 (= res!222198 (= (size!6462 (buf!6930 w1!584)) (size!6462 (buf!6930 w2!580))))))

(assert (=> d!89804 (= (isPrefixOf!0 w1!584 w2!580) e!185910)))

(declare-fun b!265941 () Bool)

(declare-fun res!222199 () Bool)

(assert (=> b!265941 (=> (not res!222199) (not e!185910))))

(assert (=> b!265941 (= res!222199 (bvsle (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584)) (bitIndex!0 (size!6462 (buf!6930 w2!580)) (currentByte!12818 w2!580) (currentBit!12813 w2!580))))))

(declare-fun b!265942 () Bool)

(declare-fun e!185909 () Bool)

(assert (=> b!265942 (= e!185910 e!185909)))

(declare-fun res!222197 () Bool)

(assert (=> b!265942 (=> res!222197 e!185909)))

(assert (=> b!265942 (= res!222197 (= (size!6462 (buf!6930 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265943 () Bool)

(assert (=> b!265943 (= e!185909 (arrayBitRangesEq!0 (buf!6930 w1!584) (buf!6930 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584))))))

(assert (= (and d!89804 res!222198) b!265941))

(assert (= (and b!265941 res!222199) b!265942))

(assert (= (and b!265942 (not res!222197)) b!265943))

(assert (=> b!265941 m!396681))

(assert (=> b!265941 m!396701))

(assert (=> b!265943 m!396681))

(assert (=> b!265943 m!396681))

(assert (=> b!265943 m!396685))

(assert (=> start!57940 d!89804))

(declare-fun d!89806 () Bool)

(assert (=> d!89806 (= (inv!12 w1!584) (invariant!0 (currentBit!12813 w1!584) (currentByte!12818 w1!584) (size!6462 (buf!6930 w1!584))))))

(declare-fun bs!22795 () Bool)

(assert (= bs!22795 d!89806))

(assert (=> bs!22795 m!396723))

(assert (=> start!57940 d!89806))

(declare-fun d!89808 () Bool)

(assert (=> d!89808 (= (inv!12 w2!580) (invariant!0 (currentBit!12813 w2!580) (currentByte!12818 w2!580) (size!6462 (buf!6930 w2!580))))))

(declare-fun bs!22796 () Bool)

(assert (= bs!22796 d!89808))

(declare-fun m!396725 () Bool)

(assert (=> bs!22796 m!396725))

(assert (=> start!57940 d!89808))

(declare-fun b!266000 () Bool)

(declare-fun e!185956 () Bool)

(declare-fun e!185954 () Bool)

(assert (=> b!266000 (= e!185956 e!185954)))

(declare-fun res!222246 () Bool)

(declare-fun call!4157 () Bool)

(assert (=> b!266000 (= res!222246 call!4157)))

(assert (=> b!266000 (=> (not res!222246) (not e!185954))))

(declare-fun b!266001 () Bool)

(declare-fun e!185959 () Bool)

(assert (=> b!266001 (= e!185959 e!185956)))

(declare-fun c!12234 () Bool)

(declare-datatypes ((tuple4!382 0))(
  ( (tuple4!383 (_1!12171 (_ BitVec 32)) (_2!12171 (_ BitVec 32)) (_3!971 (_ BitVec 32)) (_4!191 (_ BitVec 32))) )
))
(declare-fun lt!406821 () tuple4!382)

(assert (=> b!266001 (= c!12234 (= (_3!971 lt!406821) (_4!191 lt!406821)))))

(declare-fun e!185958 () Bool)

(declare-fun b!266002 () Bool)

(declare-fun arrayRangesEq!1027 (array!14820 array!14820 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266002 (= e!185958 (arrayRangesEq!1027 (buf!6930 w1!584) (buf!6930 w2!580) (_1!12171 lt!406821) (_2!12171 lt!406821)))))

(declare-fun bm!4154 () Bool)

(declare-fun lt!406820 () (_ BitVec 32))

(declare-fun lt!406819 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4154 (= call!4157 (byteRangesEq!0 (select (arr!7449 (buf!6930 w1!584)) (_3!971 lt!406821)) (select (arr!7449 (buf!6930 w2!580)) (_3!971 lt!406821)) lt!406819 (ite c!12234 lt!406820 #b00000000000000000000000000001000)))))

(declare-fun d!89810 () Bool)

(declare-fun res!222249 () Bool)

(declare-fun e!185957 () Bool)

(assert (=> d!89810 (=> res!222249 e!185957)))

(assert (=> d!89810 (= res!222249 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584))))))

(assert (=> d!89810 (= (arrayBitRangesEq!0 (buf!6930 w1!584) (buf!6930 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584))) e!185957)))

(declare-fun b!266003 () Bool)

(assert (=> b!266003 (= e!185957 e!185959)))

(declare-fun res!222247 () Bool)

(assert (=> b!266003 (=> (not res!222247) (not e!185959))))

(assert (=> b!266003 (= res!222247 e!185958)))

(declare-fun res!222250 () Bool)

(assert (=> b!266003 (=> res!222250 e!185958)))

(assert (=> b!266003 (= res!222250 (bvsge (_1!12171 lt!406821) (_2!12171 lt!406821)))))

(assert (=> b!266003 (= lt!406820 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266003 (= lt!406819 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!382)

(assert (=> b!266003 (= lt!406821 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6462 (buf!6930 w1!584)) (currentByte!12818 w1!584) (currentBit!12813 w1!584))))))

(declare-fun b!266004 () Bool)

(assert (=> b!266004 (= e!185956 call!4157)))

(declare-fun b!266005 () Bool)

(declare-fun res!222248 () Bool)

(assert (=> b!266005 (= res!222248 (= lt!406820 #b00000000000000000000000000000000))))

(declare-fun e!185955 () Bool)

(assert (=> b!266005 (=> res!222248 e!185955)))

(assert (=> b!266005 (= e!185954 e!185955)))

(declare-fun b!266006 () Bool)

(assert (=> b!266006 (= e!185955 (byteRangesEq!0 (select (arr!7449 (buf!6930 w1!584)) (_4!191 lt!406821)) (select (arr!7449 (buf!6930 w2!580)) (_4!191 lt!406821)) #b00000000000000000000000000000000 lt!406820))))

(assert (= (and d!89810 (not res!222249)) b!266003))

(assert (= (and b!266003 (not res!222250)) b!266002))

(assert (= (and b!266003 res!222247) b!266001))

(assert (= (and b!266001 c!12234) b!266004))

(assert (= (and b!266001 (not c!12234)) b!266000))

(assert (= (and b!266000 res!222246) b!266005))

(assert (= (and b!266005 (not res!222248)) b!266006))

(assert (= (or b!266004 b!266000) bm!4154))

(declare-fun m!396765 () Bool)

(assert (=> b!266002 m!396765))

(declare-fun m!396767 () Bool)

(assert (=> bm!4154 m!396767))

(declare-fun m!396769 () Bool)

(assert (=> bm!4154 m!396769))

(assert (=> bm!4154 m!396767))

(assert (=> bm!4154 m!396769))

(declare-fun m!396771 () Bool)

(assert (=> bm!4154 m!396771))

(assert (=> b!266003 m!396681))

(declare-fun m!396773 () Bool)

(assert (=> b!266003 m!396773))

(declare-fun m!396775 () Bool)

(assert (=> b!266006 m!396775))

(declare-fun m!396777 () Bool)

(assert (=> b!266006 m!396777))

(assert (=> b!266006 m!396775))

(assert (=> b!266006 m!396777))

(declare-fun m!396779 () Bool)

(assert (=> b!266006 m!396779))

(assert (=> b!265893 d!89810))

(assert (=> b!265893 d!89800))

(declare-fun d!89836 () Bool)

(assert (=> d!89836 (= (array_inv!6186 (buf!6930 w1!584)) (bvsge (size!6462 (buf!6930 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265894 d!89836))

(push 1)

