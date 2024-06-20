; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25378 () Bool)

(assert start!25378)

(declare-fun b!128152 () Bool)

(declare-fun res!106050 () Bool)

(declare-fun e!84976 () Bool)

(assert (=> b!128152 (=> (not res!106050) (not e!84976))))

(declare-datatypes ((array!5914 0))(
  ( (array!5915 (arr!3291 (Array (_ BitVec 32) (_ BitVec 8))) (size!2674 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4612 0))(
  ( (BitStream!4613 (buf!3032 array!5914) (currentByte!5784 (_ BitVec 32)) (currentBit!5779 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4612)

(declare-datatypes ((Unit!7950 0))(
  ( (Unit!7951) )
))
(declare-datatypes ((tuple2!10804 0))(
  ( (tuple2!10805 (_1!5699 Unit!7950) (_2!5699 BitStream!4612)) )
))
(declare-fun lt!199069 () tuple2!10804)

(declare-fun isPrefixOf!0 (BitStream!4612 BitStream!4612) Bool)

(assert (=> b!128152 (= res!106050 (isPrefixOf!0 thiss!1634 (_2!5699 lt!199069)))))

(declare-fun b!128153 () Bool)

(declare-fun res!106046 () Bool)

(declare-fun e!84980 () Bool)

(assert (=> b!128153 (=> (not res!106046) (not e!84980))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128153 (= res!106046 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!10806 0))(
  ( (tuple2!10807 (_1!5700 BitStream!4612) (_2!5700 BitStream!4612)) )
))
(declare-fun lt!199070 () tuple2!10806)

(declare-fun arr!237 () array!5914)

(declare-fun b!128154 () Bool)

(declare-datatypes ((tuple2!10808 0))(
  ( (tuple2!10809 (_1!5701 BitStream!4612) (_2!5701 (_ BitVec 8))) )
))
(declare-fun lt!199068 () tuple2!10808)

(assert (=> b!128154 (= e!84976 (and (= (_2!5701 lt!199068) (select (arr!3291 arr!237) from!447)) (= (_1!5701 lt!199068) (_2!5700 lt!199070))))))

(declare-fun readBytePure!0 (BitStream!4612) tuple2!10808)

(assert (=> b!128154 (= lt!199068 (readBytePure!0 (_1!5700 lt!199070)))))

(declare-fun reader!0 (BitStream!4612 BitStream!4612) tuple2!10806)

(assert (=> b!128154 (= lt!199070 (reader!0 thiss!1634 (_2!5699 lt!199069)))))

(declare-fun b!128155 () Bool)

(declare-fun res!106045 () Bool)

(assert (=> b!128155 (=> (not res!106045) (not e!84976))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128155 (= res!106045 (= (bitIndex!0 (size!2674 (buf!3032 (_2!5699 lt!199069))) (currentByte!5784 (_2!5699 lt!199069)) (currentBit!5779 (_2!5699 lt!199069))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2674 (buf!3032 thiss!1634)) (currentByte!5784 thiss!1634) (currentBit!5779 thiss!1634)))))))

(declare-fun b!128156 () Bool)

(declare-fun res!106048 () Bool)

(assert (=> b!128156 (=> (not res!106048) (not e!84980))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128156 (= res!106048 (invariant!0 (currentBit!5779 thiss!1634) (currentByte!5784 thiss!1634) (size!2674 (buf!3032 thiss!1634))))))

(declare-fun b!128157 () Bool)

(declare-fun res!106051 () Bool)

(assert (=> b!128157 (=> (not res!106051) (not e!84980))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128157 (= res!106051 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2674 (buf!3032 thiss!1634))) ((_ sign_extend 32) (currentByte!5784 thiss!1634)) ((_ sign_extend 32) (currentBit!5779 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128158 () Bool)

(declare-fun e!84978 () Bool)

(declare-fun array_inv!2463 (array!5914) Bool)

(assert (=> b!128158 (= e!84978 (array_inv!2463 (buf!3032 thiss!1634)))))

(declare-fun res!106047 () Bool)

(assert (=> start!25378 (=> (not res!106047) (not e!84980))))

(assert (=> start!25378 (= res!106047 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2674 arr!237))))))

(assert (=> start!25378 e!84980))

(assert (=> start!25378 true))

(assert (=> start!25378 (array_inv!2463 arr!237)))

(declare-fun inv!12 (BitStream!4612) Bool)

(assert (=> start!25378 (and (inv!12 thiss!1634) e!84978)))

(declare-fun b!128159 () Bool)

(assert (=> b!128159 (= e!84980 (not (or (bvsgt ((_ sign_extend 32) (size!2674 (buf!3032 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5784 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5779 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!2674 (buf!3032 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5784 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5779 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!128159 e!84976))

(declare-fun res!106049 () Bool)

(assert (=> b!128159 (=> (not res!106049) (not e!84976))))

(assert (=> b!128159 (= res!106049 (= (size!2674 (buf!3032 thiss!1634)) (size!2674 (buf!3032 (_2!5699 lt!199069)))))))

(declare-fun appendByte!0 (BitStream!4612 (_ BitVec 8)) tuple2!10804)

(assert (=> b!128159 (= lt!199069 (appendByte!0 thiss!1634 (select (arr!3291 arr!237) from!447)))))

(assert (= (and start!25378 res!106047) b!128157))

(assert (= (and b!128157 res!106051) b!128153))

(assert (= (and b!128153 res!106046) b!128156))

(assert (= (and b!128156 res!106048) b!128159))

(assert (= (and b!128159 res!106049) b!128155))

(assert (= (and b!128155 res!106045) b!128152))

(assert (= (and b!128152 res!106050) b!128154))

(assert (= start!25378 b!128158))

(declare-fun m!193915 () Bool)

(assert (=> b!128159 m!193915))

(assert (=> b!128159 m!193915))

(declare-fun m!193917 () Bool)

(assert (=> b!128159 m!193917))

(declare-fun m!193919 () Bool)

(assert (=> start!25378 m!193919))

(declare-fun m!193921 () Bool)

(assert (=> start!25378 m!193921))

(declare-fun m!193923 () Bool)

(assert (=> b!128158 m!193923))

(assert (=> b!128154 m!193915))

(declare-fun m!193925 () Bool)

(assert (=> b!128154 m!193925))

(declare-fun m!193927 () Bool)

(assert (=> b!128154 m!193927))

(declare-fun m!193929 () Bool)

(assert (=> b!128155 m!193929))

(declare-fun m!193931 () Bool)

(assert (=> b!128155 m!193931))

(declare-fun m!193933 () Bool)

(assert (=> b!128156 m!193933))

(declare-fun m!193935 () Bool)

(assert (=> b!128157 m!193935))

(declare-fun m!193937 () Bool)

(assert (=> b!128152 m!193937))

(push 1)

(assert (not b!128156))

(assert (not start!25378))

(assert (not b!128158))

(assert (not b!128159))

(assert (not b!128152))

(assert (not b!128155))

(assert (not b!128154))

(assert (not b!128157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41416 () Bool)

(assert (=> d!41416 (= (invariant!0 (currentBit!5779 thiss!1634) (currentByte!5784 thiss!1634) (size!2674 (buf!3032 thiss!1634))) (and (bvsge (currentBit!5779 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5779 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5784 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5784 thiss!1634) (size!2674 (buf!3032 thiss!1634))) (and (= (currentBit!5779 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5784 thiss!1634) (size!2674 (buf!3032 thiss!1634)))))))))

(assert (=> b!128156 d!41416))

(declare-fun d!41418 () Bool)

(declare-fun e!85013 () Bool)

(assert (=> d!41418 e!85013))

(declare-fun res!106099 () Bool)

(assert (=> d!41418 (=> (not res!106099) (not e!85013))))

(declare-fun lt!199102 () (_ BitVec 64))

(declare-fun lt!199101 () (_ BitVec 64))

(declare-fun lt!199103 () (_ BitVec 64))

(assert (=> d!41418 (= res!106099 (= lt!199101 (bvsub lt!199102 lt!199103)))))

(assert (=> d!41418 (or (= (bvand lt!199102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!199102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!199102 lt!199103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41418 (= lt!199103 (remainingBits!0 ((_ sign_extend 32) (size!2674 (buf!3032 (_2!5699 lt!199069)))) ((_ sign_extend 32) (currentByte!5784 (_2!5699 lt!199069))) ((_ sign_extend 32) (currentBit!5779 (_2!5699 lt!199069)))))))

(declare-fun lt!199104 () (_ BitVec 64))

(declare-fun lt!199105 () (_ BitVec 64))

(assert (=> d!41418 (= lt!199102 (bvmul lt!199104 lt!199105))))

(assert (=> d!41418 (or (= lt!199104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!199105 (bvsdiv (bvmul lt!199104 lt!199105) lt!199104)))))

(assert (=> d!41418 (= lt!199105 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41418 (= lt!199104 ((_ sign_extend 32) (size!2674 (buf!3032 (_2!5699 lt!199069)))))))

(assert (=> d!41418 (= lt!199101 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5784 (_2!5699 lt!199069))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5779 (_2!5699 lt!199069)))))))

(assert (=> d!41418 (invariant!0 (currentBit!5779 (_2!5699 lt!199069)) (currentByte!5784 (_2!5699 lt!199069)) (size!2674 (buf!3032 (_2!5699 lt!199069))))))

(assert (=> d!41418 (= (bitIndex!0 (size!2674 (buf!3032 (_2!5699 lt!199069))) (currentByte!5784 (_2!5699 lt!199069)) (currentBit!5779 (_2!5699 lt!199069))) lt!199101)))

(declare-fun b!128212 () Bool)

(declare-fun res!106098 () Bool)

(assert (=> b!128212 (=> (not res!106098) (not e!85013))))

(assert (=> b!128212 (= res!106098 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!199101))))

(declare-fun b!128213 () Bool)

(declare-fun lt!199106 () (_ BitVec 64))

(assert (=> b!128213 (= e!85013 (bvsle lt!199101 (bvmul lt!199106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!128213 (or (= lt!199106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!199106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!199106)))))

(assert (=> b!128213 (= lt!199106 ((_ sign_extend 32) (size!2674 (buf!3032 (_2!5699 lt!199069)))))))

(assert (= (and d!41418 res!106099) b!128212))

(assert (= (and b!128212 res!106098) b!128213))

(declare-fun m!193987 () Bool)

(assert (=> d!41418 m!193987))

(declare-fun m!193989 () Bool)

(assert (=> d!41418 m!193989))

(assert (=> b!128155 d!41418))

(declare-fun d!41420 () Bool)

(declare-fun e!85014 () Bool)

(assert (=> d!41420 e!85014))

(declare-fun res!106101 () Bool)

(assert (=> d!41420 (=> (not res!106101) (not e!85014))))

(declare-fun lt!199109 () (_ BitVec 64))

(declare-fun lt!199108 () (_ BitVec 64))

(declare-fun lt!199107 () (_ BitVec 64))

(assert (=> d!41420 (= res!106101 (= lt!199107 (bvsub lt!199108 lt!199109)))))

(assert (=> d!41420 (or (= (bvand lt!199108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199109 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!199108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!199108 lt!199109) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41420 (= lt!199109 (remainingBits!0 ((_ sign_extend 32) (size!2674 (buf!3032 thiss!1634))) ((_ sign_extend 32) (currentByte!5784 thiss!1634)) ((_ sign_extend 32) (currentBit!5779 thiss!1634))))))

(declare-fun lt!199110 () (_ BitVec 64))

(declare-fun lt!199111 () (_ BitVec 64))

(assert (=> d!41420 (= lt!199108 (bvmul lt!199110 lt!199111))))

(assert (=> d!41420 (or (= lt!199110 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!199111 (bvsdiv (bvmul lt!199110 lt!199111) lt!199110)))))

(assert (=> d!41420 (= lt!199111 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41420 (= lt!199110 ((_ sign_extend 32) (size!2674 (buf!3032 thiss!1634))))))

(assert (=> d!41420 (= lt!199107 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5784 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5779 thiss!1634))))))

(assert (=> d!41420 (invariant!0 (currentBit!5779 thiss!1634) (currentByte!5784 thiss!1634) (size!2674 (buf!3032 thiss!1634)))))

(assert (=> d!41420 (= (bitIndex!0 (size!2674 (buf!3032 thiss!1634)) (currentByte!5784 thiss!1634) (currentBit!5779 thiss!1634)) lt!199107)))

(declare-fun b!128214 () Bool)

(declare-fun res!106100 () Bool)

(assert (=> b!128214 (=> (not res!106100) (not e!85014))))

(assert (=> b!128214 (= res!106100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!199107))))

(declare-fun b!128215 () Bool)

(declare-fun lt!199112 () (_ BitVec 64))

(assert (=> b!128215 (= e!85014 (bvsle lt!199107 (bvmul lt!199112 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!128215 (or (= lt!199112 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!199112 #b0000000000000000000000000000000000000000000000000000000000001000) lt!199112)))))

(assert (=> b!128215 (= lt!199112 ((_ sign_extend 32) (size!2674 (buf!3032 thiss!1634))))))

(assert (= (and d!41420 res!106101) b!128214))

(assert (= (and b!128214 res!106100) b!128215))

(declare-fun m!193991 () Bool)

(assert (=> d!41420 m!193991))

(assert (=> d!41420 m!193933))

(assert (=> b!128155 d!41420))

(declare-fun d!41424 () Bool)

(declare-datatypes ((tuple2!10822 0))(
  ( (tuple2!10823 (_1!5708 (_ BitVec 8)) (_2!5708 BitStream!4612)) )
))
(declare-fun lt!199115 () tuple2!10822)

(declare-fun readByte!0 (BitStream!4612) tuple2!10822)

(assert (=> d!41424 (= lt!199115 (readByte!0 (_1!5700 lt!199070)))))

(assert (=> d!41424 (= (readBytePure!0 (_1!5700 lt!199070)) (tuple2!10809 (_2!5708 lt!199115) (_1!5708 lt!199115)))))

(declare-fun bs!10077 () Bool)

(assert (= bs!10077 d!41424))

(declare-fun m!193993 () Bool)

(assert (=> bs!10077 m!193993))

(assert (=> b!128154 d!41424))

(declare-fun b!128250 () Bool)

(declare-fun e!85034 () Unit!7950)

(declare-fun lt!199179 () Unit!7950)

(assert (=> b!128250 (= e!85034 lt!199179)))

(declare-fun lt!199190 () (_ BitVec 64))

(assert (=> b!128250 (= lt!199190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!199178 () (_ BitVec 64))

(assert (=> b!128250 (= lt!199178 (bitIndex!0 (size!2674 (buf!3032 thiss!1634)) (currentByte!5784 thiss!1634) (currentBit!5779 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5914 array!5914 (_ BitVec 64) (_ BitVec 64)) Unit!7950)

(assert (=> b!128250 (= lt!199179 (arrayBitRangesEqSymmetric!0 (buf!3032 thiss!1634) (buf!3032 (_2!5699 lt!199069)) lt!199190 lt!199178))))

(declare-fun arrayBitRangesEq!0 (array!5914 array!5914 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!128250 (arrayBitRangesEq!0 (buf!3032 (_2!5699 lt!199069)) (buf!3032 thiss!1634) lt!199190 lt!199178)))

(declare-fun d!41426 () Bool)

(declare-fun e!85035 () Bool)

(assert (=> d!41426 e!85035))

(declare-fun res!106132 () Bool)

(assert (=> d!41426 (=> (not res!106132) (not e!85035))))

(declare-fun lt!199183 () tuple2!10806)

(assert (=> d!41426 (= res!106132 (isPrefixOf!0 (_1!5700 lt!199183) (_2!5700 lt!199183)))))

(declare-fun lt!199191 () BitStream!4612)

(assert (=> d!41426 (= lt!199183 (tuple2!10807 lt!199191 (_2!5699 lt!199069)))))

(declare-fun lt!199184 () Unit!7950)

(declare-fun lt!199185 () Unit!7950)

(assert (=> d!41426 (= lt!199184 lt!199185)))

(assert (=> d!41426 (isPrefixOf!0 lt!199191 (_2!5699 lt!199069))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4612 BitStream!4612 BitStream!4612) Unit!7950)

(assert (=> d!41426 (= lt!199185 (lemmaIsPrefixTransitive!0 lt!199191 (_2!5699 lt!199069) (_2!5699 lt!199069)))))

(declare-fun lt!199193 () Unit!7950)

(declare-fun lt!199187 () Unit!7950)

(assert (=> d!41426 (= lt!199193 lt!199187)))

(assert (=> d!41426 (isPrefixOf!0 lt!199191 (_2!5699 lt!199069))))

(assert (=> d!41426 (= lt!199187 (lemmaIsPrefixTransitive!0 lt!199191 thiss!1634 (_2!5699 lt!199069)))))

(declare-fun lt!199182 () Unit!7950)

(assert (=> d!41426 (= lt!199182 e!85034)))

(declare-fun c!7533 () Bool)

(assert (=> d!41426 (= c!7533 (not (= (size!2674 (buf!3032 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!199192 () Unit!7950)

(declare-fun lt!199196 () Unit!7950)

(assert (=> d!41426 (= lt!199192 lt!199196)))

(assert (=> d!41426 (isPrefixOf!0 (_2!5699 lt!199069) (_2!5699 lt!199069))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4612) Unit!7950)

(assert (=> d!41426 (= lt!199196 (lemmaIsPrefixRefl!0 (_2!5699 lt!199069)))))

(declare-fun lt!199186 () Unit!7950)

(declare-fun lt!199195 () Unit!7950)

(assert (=> d!41426 (= lt!199186 lt!199195)))

(assert (=> d!41426 (= lt!199195 (lemmaIsPrefixRefl!0 (_2!5699 lt!199069)))))

(declare-fun lt!199180 () Unit!7950)

(declare-fun lt!199188 () Unit!7950)

(assert (=> d!41426 (= lt!199180 lt!199188)))

(assert (=> d!41426 (isPrefixOf!0 lt!199191 lt!199191)))

(assert (=> d!41426 (= lt!199188 (lemmaIsPrefixRefl!0 lt!199191))))

(declare-fun lt!199181 () Unit!7950)

(declare-fun lt!199189 () Unit!7950)

(assert (=> d!41426 (= lt!199181 lt!199189)))

(assert (=> d!41426 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41426 (= lt!199189 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41426 (= lt!199191 (BitStream!4613 (buf!3032 (_2!5699 lt!199069)) (currentByte!5784 thiss!1634) (currentBit!5779 thiss!1634)))))

(assert (=> d!41426 (isPrefixOf!0 thiss!1634 (_2!5699 lt!199069))))

(assert (=> d!41426 (= (reader!0 thiss!1634 (_2!5699 lt!199069)) lt!199183)))

(declare-fun b!128251 () Bool)

(declare-fun res!106133 () Bool)

(assert (=> b!128251 (=> (not res!106133) (not e!85035))))

(assert (=> b!128251 (= res!106133 (isPrefixOf!0 (_1!5700 lt!199183) thiss!1634))))

(declare-fun lt!199177 () (_ BitVec 64))

(declare-fun lt!199194 () (_ BitVec 64))

(declare-fun b!128252 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4612 (_ BitVec 64)) BitStream!4612)

(assert (=> b!128252 (= e!85035 (= (_1!5700 lt!199183) (withMovedBitIndex!0 (_2!5700 lt!199183) (bvsub lt!199194 lt!199177))))))

(assert (=> b!128252 (or (= (bvand lt!199194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199177 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!199194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!199194 lt!199177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128252 (= lt!199177 (bitIndex!0 (size!2674 (buf!3032 (_2!5699 lt!199069))) (currentByte!5784 (_2!5699 lt!199069)) (currentBit!5779 (_2!5699 lt!199069))))))

(assert (=> b!128252 (= lt!199194 (bitIndex!0 (size!2674 (buf!3032 thiss!1634)) (currentByte!5784 thiss!1634) (currentBit!5779 thiss!1634)))))

(declare-fun b!128253 () Bool)

(declare-fun Unit!7956 () Unit!7950)

(assert (=> b!128253 (= e!85034 Unit!7956)))

(declare-fun b!128254 () Bool)

(declare-fun res!106134 () Bool)

(assert (=> b!128254 (=> (not res!106134) (not e!85035))))

(assert (=> b!128254 (= res!106134 (isPrefixOf!0 (_2!5700 lt!199183) (_2!5699 lt!199069)))))

(assert (= (and d!41426 c!7533) b!128250))

(assert (= (and d!41426 (not c!7533)) b!128253))

(assert (= (and d!41426 res!106132) b!128251))

(assert (= (and b!128251 res!106133) b!128254))

(assert (= (and b!128254 res!106134) b!128252))

(declare-fun m!194009 () Bool)

(assert (=> b!128251 m!194009))

(declare-fun m!194011 () Bool)

(assert (=> b!128252 m!194011))

(assert (=> b!128252 m!193929))

(assert (=> b!128252 m!193931))

(assert (=> b!128250 m!193931))

(declare-fun m!194013 () Bool)

(assert (=> b!128250 m!194013))

(declare-fun m!194015 () Bool)

(assert (=> b!128250 m!194015))

(declare-fun m!194017 () Bool)

(assert (=> d!41426 m!194017))

(declare-fun m!194019 () Bool)

(assert (=> d!41426 m!194019))

(declare-fun m!194021 () Bool)

(assert (=> d!41426 m!194021))

(declare-fun m!194023 () Bool)

(assert (=> d!41426 m!194023))

(declare-fun m!194025 () Bool)

(assert (=> d!41426 m!194025))

(declare-fun m!194027 () Bool)

(assert (=> d!41426 m!194027))

(declare-fun m!194029 () Bool)

(assert (=> d!41426 m!194029))

(declare-fun m!194031 () Bool)

(assert (=> d!41426 m!194031))

(declare-fun m!194033 () Bool)

(assert (=> d!41426 m!194033))

(declare-fun m!194035 () Bool)

(assert (=> d!41426 m!194035))

(assert (=> d!41426 m!193937))

(declare-fun m!194037 () Bool)

(assert (=> b!128254 m!194037))

(assert (=> b!128154 d!41426))

(declare-fun d!41454 () Bool)

(assert (=> d!41454 (= (array_inv!2463 arr!237) (bvsge (size!2674 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25378 d!41454))

(declare-fun d!41456 () Bool)

(assert (=> d!41456 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5779 thiss!1634) (currentByte!5784 thiss!1634) (size!2674 (buf!3032 thiss!1634))))))

(declare-fun bs!10081 () Bool)

(assert (= bs!10081 d!41456))

(assert (=> bs!10081 m!193933))

(assert (=> start!25378 d!41456))

(declare-fun d!41458 () Bool)

(declare-fun e!85052 () Bool)

(assert (=> d!41458 e!85052))

(declare-fun res!106171 () Bool)

(assert (=> d!41458 (=> (not res!106171) (not e!85052))))

(declare-fun lt!199316 () tuple2!10804)

(assert (=> d!41458 (= res!106171 (= (size!2674 (buf!3032 thiss!1634)) (size!2674 (buf!3032 (_2!5699 lt!199316)))))))

(declare-fun choose!6 (BitStream!4612 (_ BitVec 8)) tuple2!10804)

(assert (=> d!41458 (= lt!199316 (choose!6 thiss!1634 (select (arr!3291 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!41458 (validate_offset_byte!0 ((_ sign_extend 32) (size!2674 (buf!3032 thiss!1634))) ((_ sign_extend 32) (currentByte!5784 thiss!1634)) ((_ sign_extend 32) (currentBit!5779 thiss!1634)))))

(assert (=> d!41458 (= (appendByte!0 thiss!1634 (select (arr!3291 arr!237) from!447)) lt!199316)))

(declare-fun b!128295 () Bool)

(declare-fun res!106170 () Bool)

(assert (=> b!128295 (=> (not res!106170) (not e!85052))))

(declare-fun lt!199314 () (_ BitVec 64))

(declare-fun lt!199313 () (_ BitVec 64))

(assert (=> b!128295 (= res!106170 (= (bitIndex!0 (size!2674 (buf!3032 (_2!5699 lt!199316))) (currentByte!5784 (_2!5699 lt!199316)) (currentBit!5779 (_2!5699 lt!199316))) (bvadd lt!199313 lt!199314)))))

(assert (=> b!128295 (or (not (= (bvand lt!199313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!199314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!199313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!199313 lt!199314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128295 (= lt!199314 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!128295 (= lt!199313 (bitIndex!0 (size!2674 (buf!3032 thiss!1634)) (currentByte!5784 thiss!1634) (currentBit!5779 thiss!1634)))))

(declare-fun b!128296 () Bool)

(declare-fun res!106169 () Bool)

(assert (=> b!128296 (=> (not res!106169) (not e!85052))))

(assert (=> b!128296 (= res!106169 (isPrefixOf!0 thiss!1634 (_2!5699 lt!199316)))))

(declare-fun lt!199312 () tuple2!10806)

(declare-fun lt!199315 () tuple2!10808)

(declare-fun b!128297 () Bool)

(assert (=> b!128297 (= e!85052 (and (= (_2!5701 lt!199315) (select (arr!3291 arr!237) from!447)) (= (_1!5701 lt!199315) (_2!5700 lt!199312))))))

(assert (=> b!128297 (= lt!199315 (readBytePure!0 (_1!5700 lt!199312)))))

(assert (=> b!128297 (= lt!199312 (reader!0 thiss!1634 (_2!5699 lt!199316)))))

(assert (= (and d!41458 res!106171) b!128295))

(assert (= (and b!128295 res!106170) b!128296))

(assert (= (and b!128296 res!106169) b!128297))

(assert (=> d!41458 m!193915))

(declare-fun m!194085 () Bool)

(assert (=> d!41458 m!194085))

(declare-fun m!194087 () Bool)

(assert (=> d!41458 m!194087))

(declare-fun m!194089 () Bool)

(assert (=> b!128295 m!194089))

(assert (=> b!128295 m!193931))

(declare-fun m!194091 () Bool)

(assert (=> b!128296 m!194091))

(declare-fun m!194093 () Bool)

(assert (=> b!128297 m!194093))

(declare-fun m!194095 () Bool)

(assert (=> b!128297 m!194095))

(assert (=> b!128159 d!41458))

(declare-fun d!41472 () Bool)

(assert (=> d!41472 (= (array_inv!2463 (buf!3032 thiss!1634)) (bvsge (size!2674 (buf!3032 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!128158 d!41472))

(declare-fun d!41474 () Bool)

(declare-fun res!106180 () Bool)

(declare-fun e!85058 () Bool)

(assert (=> d!41474 (=> (not res!106180) (not e!85058))))

(assert (=> d!41474 (= res!106180 (= (size!2674 (buf!3032 thiss!1634)) (size!2674 (buf!3032 (_2!5699 lt!199069)))))))

(assert (=> d!41474 (= (isPrefixOf!0 thiss!1634 (_2!5699 lt!199069)) e!85058)))

(declare-fun b!128304 () Bool)

(declare-fun res!106179 () Bool)

(assert (=> b!128304 (=> (not res!106179) (not e!85058))))

(assert (=> b!128304 (= res!106179 (bvsle (bitIndex!0 (size!2674 (buf!3032 thiss!1634)) (currentByte!5784 thiss!1634) (currentBit!5779 thiss!1634)) (bitIndex!0 (size!2674 (buf!3032 (_2!5699 lt!199069))) (currentByte!5784 (_2!5699 lt!199069)) (currentBit!5779 (_2!5699 lt!199069)))))))

(declare-fun b!128305 () Bool)

(declare-fun e!85057 () Bool)

(assert (=> b!128305 (= e!85058 e!85057)))

(declare-fun res!106178 () Bool)

(assert (=> b!128305 (=> res!106178 e!85057)))

(assert (=> b!128305 (= res!106178 (= (size!2674 (buf!3032 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!128306 () Bool)

(assert (=> b!128306 (= e!85057 (arrayBitRangesEq!0 (buf!3032 thiss!1634) (buf!3032 (_2!5699 lt!199069)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2674 (buf!3032 thiss!1634)) (currentByte!5784 thiss!1634) (currentBit!5779 thiss!1634))))))

(assert (= (and d!41474 res!106180) b!128304))

(assert (= (and b!128304 res!106179) b!128305))

(assert (= (and b!128305 (not res!106178)) b!128306))

(assert (=> b!128304 m!193931))

(assert (=> b!128304 m!193929))

(assert (=> b!128306 m!193931))

(assert (=> b!128306 m!193931))

(declare-fun m!194099 () Bool)

(assert (=> b!128306 m!194099))

(assert (=> b!128152 d!41474))

(declare-fun d!41478 () Bool)

(assert (=> d!41478 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2674 (buf!3032 thiss!1634))) ((_ sign_extend 32) (currentByte!5784 thiss!1634)) ((_ sign_extend 32) (currentBit!5779 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2674 (buf!3032 thiss!1634))) ((_ sign_extend 32) (currentByte!5784 thiss!1634)) ((_ sign_extend 32) (currentBit!5779 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10084 () Bool)

(assert (= bs!10084 d!41478))

(assert (=> bs!10084 m!193991))

(assert (=> b!128157 d!41478))

(push 1)

(assert (not b!128306))

(assert (not b!128252))

(assert (not d!41458))

(assert (not d!41456))

(assert (not d!41426))

(assert (not b!128254))

(assert (not b!128296))

(assert (not d!41418))

(assert (not d!41478))

(assert (not b!128251))

(assert (not d!41424))

(assert (not b!128304))

(assert (not b!128297))

(assert (not b!128250))

(assert (not b!128295))

(assert (not d!41420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

