; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57980 () Bool)

(assert start!57980)

(declare-fun lt!406871 () (_ BitVec 64))

(declare-fun b!266064 () Bool)

(declare-datatypes ((array!14827 0))(
  ( (array!14828 (arr!7451 (Array (_ BitVec 32) (_ BitVec 8))) (size!6464 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11742 0))(
  ( (BitStream!11743 (buf!6932 array!14827) (currentByte!12823 (_ BitVec 32)) (currentBit!12818 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11742)

(declare-fun e!186014 () Bool)

(declare-fun w1!584 () BitStream!11742)

(assert (=> b!266064 (= e!186014 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!406871) (not (= (size!6464 (buf!6932 w1!584)) (size!6464 (buf!6932 w2!580)))) (bvsle lt!406871 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6464 (buf!6932 w1!584)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266064 (= lt!406871 (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584)))))

(declare-fun b!266065 () Bool)

(declare-fun e!186018 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14827 array!14827 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266065 (= e!186018 (not (arrayBitRangesEq!0 (buf!6932 w1!584) (buf!6932 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584)))))))

(declare-fun res!222299 () Bool)

(declare-fun e!186015 () Bool)

(assert (=> start!57980 (=> (not res!222299) (not e!186015))))

(declare-fun isPrefixOf!0 (BitStream!11742 BitStream!11742) Bool)

(assert (=> start!57980 (= res!222299 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57980 e!186015))

(declare-fun e!186013 () Bool)

(declare-fun inv!12 (BitStream!11742) Bool)

(assert (=> start!57980 (and (inv!12 w1!584) e!186013)))

(declare-fun e!186017 () Bool)

(assert (=> start!57980 (and (inv!12 w2!580) e!186017)))

(declare-fun b!266066 () Bool)

(declare-fun res!222300 () Bool)

(assert (=> b!266066 (=> res!222300 e!186014)))

(assert (=> b!266066 (= res!222300 (= (size!6464 (buf!6932 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266067 () Bool)

(assert (=> b!266067 (= e!186015 (not e!186014))))

(declare-fun res!222301 () Bool)

(assert (=> b!266067 (=> res!222301 e!186014)))

(assert (=> b!266067 (= res!222301 e!186018)))

(declare-fun res!222298 () Bool)

(assert (=> b!266067 (=> (not res!222298) (not e!186018))))

(assert (=> b!266067 (= res!222298 (not (= (size!6464 (buf!6932 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266067 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18895 0))(
  ( (Unit!18896) )
))
(declare-fun lt!406870 () Unit!18895)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11742) Unit!18895)

(assert (=> b!266067 (= lt!406870 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406873 () BitStream!11742)

(assert (=> b!266067 (isPrefixOf!0 lt!406873 lt!406873)))

(declare-fun lt!406872 () Unit!18895)

(assert (=> b!266067 (= lt!406872 (lemmaIsPrefixRefl!0 lt!406873))))

(assert (=> b!266067 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406874 () Unit!18895)

(assert (=> b!266067 (= lt!406874 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266067 (= lt!406873 (BitStream!11743 (buf!6932 w2!580) (currentByte!12823 w1!584) (currentBit!12818 w1!584)))))

(declare-fun b!266068 () Bool)

(declare-fun array_inv!6188 (array!14827) Bool)

(assert (=> b!266068 (= e!186017 (array_inv!6188 (buf!6932 w2!580)))))

(declare-fun b!266069 () Bool)

(assert (=> b!266069 (= e!186013 (array_inv!6188 (buf!6932 w1!584)))))

(assert (= (and start!57980 res!222299) b!266067))

(assert (= (and b!266067 res!222298) b!266065))

(assert (= (and b!266067 (not res!222301)) b!266066))

(assert (= (and b!266066 (not res!222300)) b!266064))

(assert (= start!57980 b!266069))

(assert (= start!57980 b!266068))

(declare-fun m!396829 () Bool)

(assert (=> b!266065 m!396829))

(assert (=> b!266065 m!396829))

(declare-fun m!396831 () Bool)

(assert (=> b!266065 m!396831))

(assert (=> b!266064 m!396829))

(declare-fun m!396833 () Bool)

(assert (=> start!57980 m!396833))

(declare-fun m!396835 () Bool)

(assert (=> start!57980 m!396835))

(declare-fun m!396837 () Bool)

(assert (=> start!57980 m!396837))

(declare-fun m!396839 () Bool)

(assert (=> b!266069 m!396839))

(declare-fun m!396841 () Bool)

(assert (=> b!266067 m!396841))

(declare-fun m!396843 () Bool)

(assert (=> b!266067 m!396843))

(declare-fun m!396845 () Bool)

(assert (=> b!266067 m!396845))

(declare-fun m!396847 () Bool)

(assert (=> b!266067 m!396847))

(declare-fun m!396849 () Bool)

(assert (=> b!266067 m!396849))

(declare-fun m!396851 () Bool)

(assert (=> b!266067 m!396851))

(declare-fun m!396853 () Bool)

(assert (=> b!266068 m!396853))

(check-sat (not b!266067) (not start!57980) (not b!266064) (not b!266069) (not b!266065) (not b!266068))
(check-sat)
(get-model)

(declare-fun d!89866 () Bool)

(declare-fun res!222329 () Bool)

(declare-fun e!186051 () Bool)

(assert (=> d!89866 (=> (not res!222329) (not e!186051))))

(assert (=> d!89866 (= res!222329 (= (size!6464 (buf!6932 w1!584)) (size!6464 (buf!6932 w2!580))))))

(assert (=> d!89866 (= (isPrefixOf!0 w1!584 w2!580) e!186051)))

(declare-fun b!266103 () Bool)

(declare-fun res!222331 () Bool)

(assert (=> b!266103 (=> (not res!222331) (not e!186051))))

(assert (=> b!266103 (= res!222331 (bvsle (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584)) (bitIndex!0 (size!6464 (buf!6932 w2!580)) (currentByte!12823 w2!580) (currentBit!12818 w2!580))))))

(declare-fun b!266104 () Bool)

(declare-fun e!186050 () Bool)

(assert (=> b!266104 (= e!186051 e!186050)))

(declare-fun res!222330 () Bool)

(assert (=> b!266104 (=> res!222330 e!186050)))

(assert (=> b!266104 (= res!222330 (= (size!6464 (buf!6932 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266105 () Bool)

(assert (=> b!266105 (= e!186050 (arrayBitRangesEq!0 (buf!6932 w1!584) (buf!6932 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584))))))

(assert (= (and d!89866 res!222329) b!266103))

(assert (= (and b!266103 res!222331) b!266104))

(assert (= (and b!266104 (not res!222330)) b!266105))

(assert (=> b!266103 m!396829))

(declare-fun m!396887 () Bool)

(assert (=> b!266103 m!396887))

(assert (=> b!266105 m!396829))

(assert (=> b!266105 m!396829))

(assert (=> b!266105 m!396831))

(assert (=> start!57980 d!89866))

(declare-fun d!89880 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89880 (= (inv!12 w1!584) (invariant!0 (currentBit!12818 w1!584) (currentByte!12823 w1!584) (size!6464 (buf!6932 w1!584))))))

(declare-fun bs!22814 () Bool)

(assert (= bs!22814 d!89880))

(declare-fun m!396889 () Bool)

(assert (=> bs!22814 m!396889))

(assert (=> start!57980 d!89880))

(declare-fun d!89882 () Bool)

(assert (=> d!89882 (= (inv!12 w2!580) (invariant!0 (currentBit!12818 w2!580) (currentByte!12823 w2!580) (size!6464 (buf!6932 w2!580))))))

(declare-fun bs!22815 () Bool)

(assert (= bs!22815 d!89882))

(declare-fun m!396891 () Bool)

(assert (=> bs!22815 m!396891))

(assert (=> start!57980 d!89882))

(declare-fun d!89884 () Bool)

(assert (=> d!89884 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406892 () Unit!18895)

(declare-fun choose!11 (BitStream!11742) Unit!18895)

(assert (=> d!89884 (= lt!406892 (choose!11 w2!580))))

(assert (=> d!89884 (= (lemmaIsPrefixRefl!0 w2!580) lt!406892)))

(declare-fun bs!22817 () Bool)

(assert (= bs!22817 d!89884))

(assert (=> bs!22817 m!396849))

(declare-fun m!396893 () Bool)

(assert (=> bs!22817 m!396893))

(assert (=> b!266067 d!89884))

(declare-fun d!89886 () Bool)

(assert (=> d!89886 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406893 () Unit!18895)

(assert (=> d!89886 (= lt!406893 (choose!11 w1!584))))

(assert (=> d!89886 (= (lemmaIsPrefixRefl!0 w1!584) lt!406893)))

(declare-fun bs!22818 () Bool)

(assert (= bs!22818 d!89886))

(assert (=> bs!22818 m!396843))

(declare-fun m!396895 () Bool)

(assert (=> bs!22818 m!396895))

(assert (=> b!266067 d!89886))

(declare-fun d!89888 () Bool)

(assert (=> d!89888 (isPrefixOf!0 lt!406873 lt!406873)))

(declare-fun lt!406894 () Unit!18895)

(assert (=> d!89888 (= lt!406894 (choose!11 lt!406873))))

(assert (=> d!89888 (= (lemmaIsPrefixRefl!0 lt!406873) lt!406894)))

(declare-fun bs!22819 () Bool)

(assert (= bs!22819 d!89888))

(assert (=> bs!22819 m!396851))

(declare-fun m!396897 () Bool)

(assert (=> bs!22819 m!396897))

(assert (=> b!266067 d!89888))

(declare-fun d!89890 () Bool)

(declare-fun res!222332 () Bool)

(declare-fun e!186053 () Bool)

(assert (=> d!89890 (=> (not res!222332) (not e!186053))))

(assert (=> d!89890 (= res!222332 (= (size!6464 (buf!6932 lt!406873)) (size!6464 (buf!6932 lt!406873))))))

(assert (=> d!89890 (= (isPrefixOf!0 lt!406873 lt!406873) e!186053)))

(declare-fun b!266106 () Bool)

(declare-fun res!222334 () Bool)

(assert (=> b!266106 (=> (not res!222334) (not e!186053))))

(assert (=> b!266106 (= res!222334 (bvsle (bitIndex!0 (size!6464 (buf!6932 lt!406873)) (currentByte!12823 lt!406873) (currentBit!12818 lt!406873)) (bitIndex!0 (size!6464 (buf!6932 lt!406873)) (currentByte!12823 lt!406873) (currentBit!12818 lt!406873))))))

(declare-fun b!266107 () Bool)

(declare-fun e!186052 () Bool)

(assert (=> b!266107 (= e!186053 e!186052)))

(declare-fun res!222333 () Bool)

(assert (=> b!266107 (=> res!222333 e!186052)))

(assert (=> b!266107 (= res!222333 (= (size!6464 (buf!6932 lt!406873)) #b00000000000000000000000000000000))))

(declare-fun b!266108 () Bool)

(assert (=> b!266108 (= e!186052 (arrayBitRangesEq!0 (buf!6932 lt!406873) (buf!6932 lt!406873) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6464 (buf!6932 lt!406873)) (currentByte!12823 lt!406873) (currentBit!12818 lt!406873))))))

(assert (= (and d!89890 res!222332) b!266106))

(assert (= (and b!266106 res!222334) b!266107))

(assert (= (and b!266107 (not res!222333)) b!266108))

(declare-fun m!396899 () Bool)

(assert (=> b!266106 m!396899))

(assert (=> b!266106 m!396899))

(assert (=> b!266108 m!396899))

(assert (=> b!266108 m!396899))

(declare-fun m!396901 () Bool)

(assert (=> b!266108 m!396901))

(assert (=> b!266067 d!89890))

(declare-fun d!89892 () Bool)

(declare-fun res!222335 () Bool)

(declare-fun e!186055 () Bool)

(assert (=> d!89892 (=> (not res!222335) (not e!186055))))

(assert (=> d!89892 (= res!222335 (= (size!6464 (buf!6932 w1!584)) (size!6464 (buf!6932 w1!584))))))

(assert (=> d!89892 (= (isPrefixOf!0 w1!584 w1!584) e!186055)))

(declare-fun b!266109 () Bool)

(declare-fun res!222337 () Bool)

(assert (=> b!266109 (=> (not res!222337) (not e!186055))))

(assert (=> b!266109 (= res!222337 (bvsle (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584)) (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584))))))

(declare-fun b!266110 () Bool)

(declare-fun e!186054 () Bool)

(assert (=> b!266110 (= e!186055 e!186054)))

(declare-fun res!222336 () Bool)

(assert (=> b!266110 (=> res!222336 e!186054)))

(assert (=> b!266110 (= res!222336 (= (size!6464 (buf!6932 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266111 () Bool)

(assert (=> b!266111 (= e!186054 (arrayBitRangesEq!0 (buf!6932 w1!584) (buf!6932 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584))))))

(assert (= (and d!89892 res!222335) b!266109))

(assert (= (and b!266109 res!222337) b!266110))

(assert (= (and b!266110 (not res!222336)) b!266111))

(assert (=> b!266109 m!396829))

(assert (=> b!266109 m!396829))

(assert (=> b!266111 m!396829))

(assert (=> b!266111 m!396829))

(declare-fun m!396903 () Bool)

(assert (=> b!266111 m!396903))

(assert (=> b!266067 d!89892))

(declare-fun d!89894 () Bool)

(declare-fun res!222338 () Bool)

(declare-fun e!186057 () Bool)

(assert (=> d!89894 (=> (not res!222338) (not e!186057))))

(assert (=> d!89894 (= res!222338 (= (size!6464 (buf!6932 w2!580)) (size!6464 (buf!6932 w2!580))))))

(assert (=> d!89894 (= (isPrefixOf!0 w2!580 w2!580) e!186057)))

(declare-fun b!266112 () Bool)

(declare-fun res!222340 () Bool)

(assert (=> b!266112 (=> (not res!222340) (not e!186057))))

(assert (=> b!266112 (= res!222340 (bvsle (bitIndex!0 (size!6464 (buf!6932 w2!580)) (currentByte!12823 w2!580) (currentBit!12818 w2!580)) (bitIndex!0 (size!6464 (buf!6932 w2!580)) (currentByte!12823 w2!580) (currentBit!12818 w2!580))))))

(declare-fun b!266113 () Bool)

(declare-fun e!186056 () Bool)

(assert (=> b!266113 (= e!186057 e!186056)))

(declare-fun res!222339 () Bool)

(assert (=> b!266113 (=> res!222339 e!186056)))

(assert (=> b!266113 (= res!222339 (= (size!6464 (buf!6932 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!266114 () Bool)

(assert (=> b!266114 (= e!186056 (arrayBitRangesEq!0 (buf!6932 w2!580) (buf!6932 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6464 (buf!6932 w2!580)) (currentByte!12823 w2!580) (currentBit!12818 w2!580))))))

(assert (= (and d!89894 res!222338) b!266112))

(assert (= (and b!266112 res!222340) b!266113))

(assert (= (and b!266113 (not res!222339)) b!266114))

(assert (=> b!266112 m!396887))

(assert (=> b!266112 m!396887))

(assert (=> b!266114 m!396887))

(assert (=> b!266114 m!396887))

(declare-fun m!396905 () Bool)

(assert (=> b!266114 m!396905))

(assert (=> b!266067 d!89894))

(declare-fun d!89896 () Bool)

(assert (=> d!89896 (= (array_inv!6188 (buf!6932 w2!580)) (bvsge (size!6464 (buf!6932 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!266068 d!89896))

(declare-fun d!89898 () Bool)

(assert (=> d!89898 (= (array_inv!6188 (buf!6932 w1!584)) (bvsge (size!6464 (buf!6932 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!266069 d!89898))

(declare-fun d!89900 () Bool)

(declare-fun e!186081 () Bool)

(assert (=> d!89900 e!186081))

(declare-fun res!222366 () Bool)

(assert (=> d!89900 (=> (not res!222366) (not e!186081))))

(declare-fun lt!406934 () (_ BitVec 64))

(declare-fun lt!406937 () (_ BitVec 64))

(declare-fun lt!406939 () (_ BitVec 64))

(assert (=> d!89900 (= res!222366 (= lt!406934 (bvsub lt!406937 lt!406939)))))

(assert (=> d!89900 (or (= (bvand lt!406937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406939 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406937 lt!406939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89900 (= lt!406939 (remainingBits!0 ((_ sign_extend 32) (size!6464 (buf!6932 w1!584))) ((_ sign_extend 32) (currentByte!12823 w1!584)) ((_ sign_extend 32) (currentBit!12818 w1!584))))))

(declare-fun lt!406935 () (_ BitVec 64))

(declare-fun lt!406938 () (_ BitVec 64))

(assert (=> d!89900 (= lt!406937 (bvmul lt!406935 lt!406938))))

(assert (=> d!89900 (or (= lt!406935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406938 (bvsdiv (bvmul lt!406935 lt!406938) lt!406935)))))

(assert (=> d!89900 (= lt!406938 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89900 (= lt!406935 ((_ sign_extend 32) (size!6464 (buf!6932 w1!584))))))

(assert (=> d!89900 (= lt!406934 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12823 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12818 w1!584))))))

(assert (=> d!89900 (invariant!0 (currentBit!12818 w1!584) (currentByte!12823 w1!584) (size!6464 (buf!6932 w1!584)))))

(assert (=> d!89900 (= (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584)) lt!406934)))

(declare-fun b!266146 () Bool)

(declare-fun res!222367 () Bool)

(assert (=> b!266146 (=> (not res!222367) (not e!186081))))

(assert (=> b!266146 (= res!222367 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406934))))

(declare-fun b!266147 () Bool)

(declare-fun lt!406936 () (_ BitVec 64))

(assert (=> b!266147 (= e!186081 (bvsle lt!406934 (bvmul lt!406936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266147 (or (= lt!406936 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406936 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406936)))))

(assert (=> b!266147 (= lt!406936 ((_ sign_extend 32) (size!6464 (buf!6932 w1!584))))))

(assert (= (and d!89900 res!222366) b!266146))

(assert (= (and b!266146 res!222367) b!266147))

(declare-fun m!396927 () Bool)

(assert (=> d!89900 m!396927))

(assert (=> d!89900 m!396889))

(assert (=> b!266064 d!89900))

(declare-datatypes ((tuple4!388 0))(
  ( (tuple4!389 (_1!12174 (_ BitVec 32)) (_2!12174 (_ BitVec 32)) (_3!974 (_ BitVec 32)) (_4!194 (_ BitVec 32))) )
))
(declare-fun lt!406974 () tuple4!388)

(declare-fun b!266198 () Bool)

(declare-fun e!186122 () Bool)

(declare-fun arrayRangesEq!1030 (array!14827 array!14827 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266198 (= e!186122 (arrayRangesEq!1030 (buf!6932 w1!584) (buf!6932 w2!580) (_1!12174 lt!406974) (_2!12174 lt!406974)))))

(declare-fun b!266199 () Bool)

(declare-fun e!186126 () Bool)

(declare-fun call!4166 () Bool)

(assert (=> b!266199 (= e!186126 call!4166)))

(declare-fun lt!406975 () (_ BitVec 32))

(declare-fun e!186121 () Bool)

(declare-fun b!266200 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266200 (= e!186121 (byteRangesEq!0 (select (arr!7451 (buf!6932 w1!584)) (_4!194 lt!406974)) (select (arr!7451 (buf!6932 w2!580)) (_4!194 lt!406974)) #b00000000000000000000000000000000 lt!406975))))

(declare-fun b!266201 () Bool)

(declare-fun res!222408 () Bool)

(assert (=> b!266201 (= res!222408 (= lt!406975 #b00000000000000000000000000000000))))

(assert (=> b!266201 (=> res!222408 e!186121)))

(declare-fun e!186124 () Bool)

(assert (=> b!266201 (= e!186124 e!186121)))

(declare-fun b!266202 () Bool)

(declare-fun e!186125 () Bool)

(declare-fun e!186123 () Bool)

(assert (=> b!266202 (= e!186125 e!186123)))

(declare-fun res!222410 () Bool)

(assert (=> b!266202 (=> (not res!222410) (not e!186123))))

(assert (=> b!266202 (= res!222410 e!186122)))

(declare-fun res!222411 () Bool)

(assert (=> b!266202 (=> res!222411 e!186122)))

(assert (=> b!266202 (= res!222411 (bvsge (_1!12174 lt!406974) (_2!12174 lt!406974)))))

(assert (=> b!266202 (= lt!406975 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406973 () (_ BitVec 32))

(assert (=> b!266202 (= lt!406973 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!388)

(assert (=> b!266202 (= lt!406974 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584))))))

(declare-fun d!89906 () Bool)

(declare-fun res!222412 () Bool)

(assert (=> d!89906 (=> res!222412 e!186125)))

(assert (=> d!89906 (= res!222412 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584))))))

(assert (=> d!89906 (= (arrayBitRangesEq!0 (buf!6932 w1!584) (buf!6932 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6464 (buf!6932 w1!584)) (currentByte!12823 w1!584) (currentBit!12818 w1!584))) e!186125)))

(declare-fun b!266203 () Bool)

(assert (=> b!266203 (= e!186123 e!186126)))

(declare-fun c!12243 () Bool)

(assert (=> b!266203 (= c!12243 (= (_3!974 lt!406974) (_4!194 lt!406974)))))

(declare-fun bm!4163 () Bool)

(assert (=> bm!4163 (= call!4166 (byteRangesEq!0 (select (arr!7451 (buf!6932 w1!584)) (_3!974 lt!406974)) (select (arr!7451 (buf!6932 w2!580)) (_3!974 lt!406974)) lt!406973 (ite c!12243 lt!406975 #b00000000000000000000000000001000)))))

(declare-fun b!266204 () Bool)

(assert (=> b!266204 (= e!186126 e!186124)))

(declare-fun res!222409 () Bool)

(assert (=> b!266204 (= res!222409 call!4166)))

(assert (=> b!266204 (=> (not res!222409) (not e!186124))))

(assert (= (and d!89906 (not res!222412)) b!266202))

(assert (= (and b!266202 (not res!222411)) b!266198))

(assert (= (and b!266202 res!222410) b!266203))

(assert (= (and b!266203 c!12243) b!266199))

(assert (= (and b!266203 (not c!12243)) b!266204))

(assert (= (and b!266204 res!222409) b!266201))

(assert (= (and b!266201 (not res!222408)) b!266200))

(assert (= (or b!266199 b!266204) bm!4163))

(declare-fun m!396949 () Bool)

(assert (=> b!266198 m!396949))

(declare-fun m!396951 () Bool)

(assert (=> b!266200 m!396951))

(declare-fun m!396953 () Bool)

(assert (=> b!266200 m!396953))

(assert (=> b!266200 m!396951))

(assert (=> b!266200 m!396953))

(declare-fun m!396955 () Bool)

(assert (=> b!266200 m!396955))

(assert (=> b!266202 m!396829))

(declare-fun m!396957 () Bool)

(assert (=> b!266202 m!396957))

(declare-fun m!396959 () Bool)

(assert (=> bm!4163 m!396959))

(declare-fun m!396961 () Bool)

(assert (=> bm!4163 m!396961))

(assert (=> bm!4163 m!396959))

(assert (=> bm!4163 m!396961))

(declare-fun m!396963 () Bool)

(assert (=> bm!4163 m!396963))

(assert (=> b!266065 d!89906))

(assert (=> b!266065 d!89900))

(check-sat (not b!266106) (not b!266198) (not b!266111) (not d!89884) (not d!89880) (not b!266200) (not d!89900) (not b!266114) (not b!266109) (not b!266103) (not b!266112) (not b!266202) (not b!266108) (not d!89888) (not d!89882) (not d!89886) (not b!266105) (not bm!4163))
(check-sat)
