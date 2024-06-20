; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29326 () Bool)

(assert start!29326)

(declare-fun b!152011 () Bool)

(declare-fun e!101620 () Bool)

(declare-fun e!101622 () Bool)

(assert (=> b!152011 (= e!101620 e!101622)))

(declare-fun res!127464 () Bool)

(assert (=> b!152011 (=> res!127464 e!101622)))

(declare-fun lt!238019 () (_ BitVec 64))

(assert (=> b!152011 (= res!127464 (bvslt lt!238019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!6785 0))(
  ( (array!6786 (arr!3887 (Array (_ BitVec 32) (_ BitVec 8))) (size!3070 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5398 0))(
  ( (BitStream!5399 (buf!3567 array!6785) (currentByte!6499 (_ BitVec 32)) (currentBit!6494 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13534 0))(
  ( (tuple2!13535 (_1!7142 BitStream!5398) (_2!7142 BitStream!5398)) )
))
(declare-fun lt!238020 () tuple2!13534)

(declare-fun thiss!1634 () BitStream!5398)

(declare-fun reader!0 (BitStream!5398 BitStream!5398) tuple2!13534)

(assert (=> b!152011 (= lt!238020 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!152012 () Bool)

(declare-fun res!127463 () Bool)

(declare-fun e!101624 () Bool)

(assert (=> b!152012 (=> (not res!127463) (not e!101624))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!152012 (= res!127463 (bvsge from!447 to!404))))

(declare-fun b!152013 () Bool)

(declare-fun e!101625 () Bool)

(declare-fun array_inv!2859 (array!6785) Bool)

(assert (=> b!152013 (= e!101625 (array_inv!2859 (buf!3567 thiss!1634)))))

(declare-fun b!152010 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152010 (= e!101622 (validate_offset_bits!1 ((_ sign_extend 32) (size!3070 (buf!3567 thiss!1634))) ((_ sign_extend 32) (currentByte!6499 thiss!1634)) ((_ sign_extend 32) (currentBit!6494 thiss!1634)) lt!238019))))

(declare-fun res!127466 () Bool)

(assert (=> start!29326 (=> (not res!127466) (not e!101624))))

(declare-fun arr!237 () array!6785)

(assert (=> start!29326 (= res!127466 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3070 arr!237))))))

(assert (=> start!29326 e!101624))

(assert (=> start!29326 true))

(assert (=> start!29326 (array_inv!2859 arr!237)))

(declare-fun inv!12 (BitStream!5398) Bool)

(assert (=> start!29326 (and (inv!12 thiss!1634) e!101625)))

(declare-fun b!152014 () Bool)

(assert (=> b!152014 (= e!101624 (not e!101620))))

(declare-fun res!127465 () Bool)

(assert (=> b!152014 (=> res!127465 e!101620)))

(declare-fun lt!238021 () (_ BitVec 64))

(assert (=> b!152014 (= res!127465 (not (= lt!238021 (bvadd lt!238021 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!238019)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152014 (= lt!238021 (bitIndex!0 (size!3070 (buf!3567 thiss!1634)) (currentByte!6499 thiss!1634) (currentBit!6494 thiss!1634)))))

(assert (=> b!152014 (= lt!238019 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5398 BitStream!5398) Bool)

(assert (=> b!152014 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9652 0))(
  ( (Unit!9653) )
))
(declare-fun lt!238018 () Unit!9652)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5398) Unit!9652)

(assert (=> b!152014 (= lt!238018 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!152015 () Bool)

(declare-fun res!127467 () Bool)

(assert (=> b!152015 (=> (not res!127467) (not e!101624))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!152015 (= res!127467 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3070 (buf!3567 thiss!1634))) ((_ sign_extend 32) (currentByte!6499 thiss!1634)) ((_ sign_extend 32) (currentBit!6494 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!29326 res!127466) b!152015))

(assert (= (and b!152015 res!127467) b!152012))

(assert (= (and b!152012 res!127463) b!152014))

(assert (= (and b!152014 (not res!127465)) b!152011))

(assert (= (and b!152011 (not res!127464)) b!152010))

(assert (= start!29326 b!152013))

(declare-fun m!237727 () Bool)

(assert (=> b!152014 m!237727))

(declare-fun m!237729 () Bool)

(assert (=> b!152014 m!237729))

(declare-fun m!237731 () Bool)

(assert (=> b!152014 m!237731))

(declare-fun m!237733 () Bool)

(assert (=> b!152010 m!237733))

(declare-fun m!237735 () Bool)

(assert (=> b!152013 m!237735))

(declare-fun m!237737 () Bool)

(assert (=> b!152011 m!237737))

(declare-fun m!237739 () Bool)

(assert (=> b!152015 m!237739))

(declare-fun m!237741 () Bool)

(assert (=> start!29326 m!237741))

(declare-fun m!237743 () Bool)

(assert (=> start!29326 m!237743))

(push 1)

(assert (not b!152010))

(assert (not b!152013))

(assert (not b!152015))

(assert (not start!29326))

(assert (not b!152011))

(assert (not b!152014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!49836 () Bool)

(assert (=> d!49836 (= (array_inv!2859 (buf!3567 thiss!1634)) (bvsge (size!3070 (buf!3567 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!152013 d!49836))

(declare-fun lt!238121 () (_ BitVec 64))

(declare-fun lt!238117 () (_ BitVec 64))

(declare-fun b!152066 () Bool)

(declare-fun e!101669 () Bool)

(declare-fun lt!238128 () tuple2!13534)

(declare-fun withMovedBitIndex!0 (BitStream!5398 (_ BitVec 64)) BitStream!5398)

(assert (=> b!152066 (= e!101669 (= (_1!7142 lt!238128) (withMovedBitIndex!0 (_2!7142 lt!238128) (bvsub lt!238117 lt!238121))))))

(assert (=> b!152066 (or (= (bvand lt!238117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238117 lt!238121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!152066 (= lt!238121 (bitIndex!0 (size!3070 (buf!3567 thiss!1634)) (currentByte!6499 thiss!1634) (currentBit!6494 thiss!1634)))))

(assert (=> b!152066 (= lt!238117 (bitIndex!0 (size!3070 (buf!3567 thiss!1634)) (currentByte!6499 thiss!1634) (currentBit!6494 thiss!1634)))))

(declare-fun b!152067 () Bool)

(declare-fun res!127504 () Bool)

(assert (=> b!152067 (=> (not res!127504) (not e!101669))))

(assert (=> b!152067 (= res!127504 (isPrefixOf!0 (_2!7142 lt!238128) thiss!1634))))

(declare-fun d!49838 () Bool)

(assert (=> d!49838 e!101669))

(declare-fun res!127506 () Bool)

(assert (=> d!49838 (=> (not res!127506) (not e!101669))))

(assert (=> d!49838 (= res!127506 (isPrefixOf!0 (_1!7142 lt!238128) (_2!7142 lt!238128)))))

(declare-fun lt!238131 () BitStream!5398)

(assert (=> d!49838 (= lt!238128 (tuple2!13535 lt!238131 thiss!1634))))

(declare-fun lt!238116 () Unit!9652)

(declare-fun lt!238130 () Unit!9652)

(assert (=> d!49838 (= lt!238116 lt!238130)))

(assert (=> d!49838 (isPrefixOf!0 lt!238131 thiss!1634)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5398 BitStream!5398 BitStream!5398) Unit!9652)

(assert (=> d!49838 (= lt!238130 (lemmaIsPrefixTransitive!0 lt!238131 thiss!1634 thiss!1634))))

(declare-fun lt!238114 () Unit!9652)

(declare-fun lt!238132 () Unit!9652)

(assert (=> d!49838 (= lt!238114 lt!238132)))

(assert (=> d!49838 (isPrefixOf!0 lt!238131 thiss!1634)))

(assert (=> d!49838 (= lt!238132 (lemmaIsPrefixTransitive!0 lt!238131 thiss!1634 thiss!1634))))

(declare-fun lt!238124 () Unit!9652)

(declare-fun e!101668 () Unit!9652)

(assert (=> d!49838 (= lt!238124 e!101668)))

(declare-fun c!8123 () Bool)

(assert (=> d!49838 (= c!8123 (not (= (size!3070 (buf!3567 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!238115 () Unit!9652)

(declare-fun lt!238126 () Unit!9652)

(assert (=> d!49838 (= lt!238115 lt!238126)))

(assert (=> d!49838 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49838 (= lt!238126 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238127 () Unit!9652)

(declare-fun lt!238119 () Unit!9652)

(assert (=> d!49838 (= lt!238127 lt!238119)))

(assert (=> d!49838 (= lt!238119 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238122 () Unit!9652)

(declare-fun lt!238129 () Unit!9652)

(assert (=> d!49838 (= lt!238122 lt!238129)))

(assert (=> d!49838 (isPrefixOf!0 lt!238131 lt!238131)))

(assert (=> d!49838 (= lt!238129 (lemmaIsPrefixRefl!0 lt!238131))))

(declare-fun lt!238125 () Unit!9652)

(declare-fun lt!238120 () Unit!9652)

(assert (=> d!49838 (= lt!238125 lt!238120)))

(assert (=> d!49838 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49838 (= lt!238120 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49838 (= lt!238131 (BitStream!5399 (buf!3567 thiss!1634) (currentByte!6499 thiss!1634) (currentBit!6494 thiss!1634)))))

(assert (=> d!49838 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49838 (= (reader!0 thiss!1634 thiss!1634) lt!238128)))

(declare-fun b!152068 () Bool)

(declare-fun Unit!9658 () Unit!9652)

(assert (=> b!152068 (= e!101668 Unit!9658)))

(declare-fun b!152069 () Bool)

(declare-fun lt!238118 () Unit!9652)

(assert (=> b!152069 (= e!101668 lt!238118)))

(declare-fun lt!238133 () (_ BitVec 64))

(assert (=> b!152069 (= lt!238133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!238123 () (_ BitVec 64))

(assert (=> b!152069 (= lt!238123 (bitIndex!0 (size!3070 (buf!3567 thiss!1634)) (currentByte!6499 thiss!1634) (currentBit!6494 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6785 array!6785 (_ BitVec 64) (_ BitVec 64)) Unit!9652)

(assert (=> b!152069 (= lt!238118 (arrayBitRangesEqSymmetric!0 (buf!3567 thiss!1634) (buf!3567 thiss!1634) lt!238133 lt!238123))))

(declare-fun arrayBitRangesEq!0 (array!6785 array!6785 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152069 (arrayBitRangesEq!0 (buf!3567 thiss!1634) (buf!3567 thiss!1634) lt!238133 lt!238123)))

(declare-fun b!152070 () Bool)

(declare-fun res!127505 () Bool)

(assert (=> b!152070 (=> (not res!127505) (not e!101669))))

(assert (=> b!152070 (= res!127505 (isPrefixOf!0 (_1!7142 lt!238128) thiss!1634))))

(assert (= (and d!49838 c!8123) b!152069))

(assert (= (and d!49838 (not c!8123)) b!152068))

(assert (= (and d!49838 res!127506) b!152070))

(assert (= (and b!152070 res!127505) b!152067))

(assert (= (and b!152067 res!127504) b!152066))

(declare-fun m!237785 () Bool)

(assert (=> b!152067 m!237785))

(declare-fun m!237787 () Bool)

(assert (=> b!152070 m!237787))

(declare-fun m!237789 () Bool)

(assert (=> d!49838 m!237789))

(declare-fun m!237791 () Bool)

(assert (=> d!49838 m!237791))

(declare-fun m!237793 () Bool)

(assert (=> d!49838 m!237793))

(assert (=> d!49838 m!237731))

(assert (=> d!49838 m!237789))

(declare-fun m!237795 () Bool)

(assert (=> d!49838 m!237795))

(declare-fun m!237797 () Bool)

(assert (=> d!49838 m!237797))

(assert (=> d!49838 m!237729))

(assert (=> d!49838 m!237729))

(assert (=> d!49838 m!237729))

(assert (=> d!49838 m!237731))

(assert (=> b!152069 m!237727))

(declare-fun m!237799 () Bool)

(assert (=> b!152069 m!237799))

(declare-fun m!237801 () Bool)

(assert (=> b!152069 m!237801))

(declare-fun m!237803 () Bool)

(assert (=> b!152066 m!237803))

(assert (=> b!152066 m!237727))

(assert (=> b!152066 m!237727))

(assert (=> b!152011 d!49838))

(declare-fun d!49852 () Bool)

(assert (=> d!49852 (= (array_inv!2859 arr!237) (bvsge (size!3070 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!29326 d!49852))

(declare-fun d!49854 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!49854 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6494 thiss!1634) (currentByte!6499 thiss!1634) (size!3070 (buf!3567 thiss!1634))))))

(declare-fun bs!12185 () Bool)

(assert (= bs!12185 d!49854))

(declare-fun m!237805 () Bool)

(assert (=> bs!12185 m!237805))

(assert (=> start!29326 d!49854))

(declare-fun d!49856 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49856 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3070 (buf!3567 thiss!1634))) ((_ sign_extend 32) (currentByte!6499 thiss!1634)) ((_ sign_extend 32) (currentBit!6494 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3070 (buf!3567 thiss!1634))) ((_ sign_extend 32) (currentByte!6499 thiss!1634)) ((_ sign_extend 32) (currentBit!6494 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12186 () Bool)

(assert (= bs!12186 d!49856))

(declare-fun m!237807 () Bool)

(assert (=> bs!12186 m!237807))

(assert (=> b!152015 d!49856))

(declare-fun d!49858 () Bool)

(assert (=> d!49858 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3070 (buf!3567 thiss!1634))) ((_ sign_extend 32) (currentByte!6499 thiss!1634)) ((_ sign_extend 32) (currentBit!6494 thiss!1634)) lt!238019) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3070 (buf!3567 thiss!1634))) ((_ sign_extend 32) (currentByte!6499 thiss!1634)) ((_ sign_extend 32) (currentBit!6494 thiss!1634))) lt!238019))))

(declare-fun bs!12187 () Bool)

(assert (= bs!12187 d!49858))

(assert (=> bs!12187 m!237807))

(assert (=> b!152010 d!49858))

(declare-fun d!49860 () Bool)

(declare-fun e!101678 () Bool)

(assert (=> d!49860 e!101678))

(declare-fun res!127522 () Bool)

(assert (=> d!49860 (=> (not res!127522) (not e!101678))))

(declare-fun lt!238190 () (_ BitVec 64))

(declare-fun lt!238187 () (_ BitVec 64))

(declare-fun lt!238191 () (_ BitVec 64))

(assert (=> d!49860 (= res!127522 (= lt!238190 (bvsub lt!238187 lt!238191)))))

(assert (=> d!49860 (or (= (bvand lt!238187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238191 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238187 lt!238191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49860 (= lt!238191 (remainingBits!0 ((_ sign_extend 32) (size!3070 (buf!3567 thiss!1634))) ((_ sign_extend 32) (currentByte!6499 thiss!1634)) ((_ sign_extend 32) (currentBit!6494 thiss!1634))))))

(declare-fun lt!238188 () (_ BitVec 64))

(declare-fun lt!238189 () (_ BitVec 64))

(assert (=> d!49860 (= lt!238187 (bvmul lt!238188 lt!238189))))

(assert (=> d!49860 (or (= lt!238188 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!238189 (bvsdiv (bvmul lt!238188 lt!238189) lt!238188)))))

(assert (=> d!49860 (= lt!238189 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49860 (= lt!238188 ((_ sign_extend 32) (size!3070 (buf!3567 thiss!1634))))))

(assert (=> d!49860 (= lt!238190 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6499 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6494 thiss!1634))))))

(assert (=> d!49860 (invariant!0 (currentBit!6494 thiss!1634) (currentByte!6499 thiss!1634) (size!3070 (buf!3567 thiss!1634)))))

(assert (=> d!49860 (= (bitIndex!0 (size!3070 (buf!3567 thiss!1634)) (currentByte!6499 thiss!1634) (currentBit!6494 thiss!1634)) lt!238190)))

(declare-fun b!152086 () Bool)

(declare-fun res!127523 () Bool)

(assert (=> b!152086 (=> (not res!127523) (not e!101678))))

(assert (=> b!152086 (= res!127523 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!238190))))

(declare-fun b!152087 () Bool)

(declare-fun lt!238186 () (_ BitVec 64))

(assert (=> b!152087 (= e!101678 (bvsle lt!238190 (bvmul lt!238186 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152087 (or (= lt!238186 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!238186 #b0000000000000000000000000000000000000000000000000000000000001000) lt!238186)))))

(assert (=> b!152087 (= lt!238186 ((_ sign_extend 32) (size!3070 (buf!3567 thiss!1634))))))

(assert (= (and d!49860 res!127522) b!152086))

(assert (= (and b!152086 res!127523) b!152087))

(assert (=> d!49860 m!237807))

(assert (=> d!49860 m!237805))

(assert (=> b!152014 d!49860))

(declare-fun d!49864 () Bool)

(declare-fun res!127536 () Bool)

(declare-fun e!101686 () Bool)

(assert (=> d!49864 (=> (not res!127536) (not e!101686))))

(assert (=> d!49864 (= res!127536 (= (size!3070 (buf!3567 thiss!1634)) (size!3070 (buf!3567 thiss!1634))))))

(assert (=> d!49864 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!101686)))

(declare-fun b!152100 () Bool)

(declare-fun res!127534 () Bool)

(assert (=> b!152100 (=> (not res!127534) (not e!101686))))

(assert (=> b!152100 (= res!127534 (bvsle (bitIndex!0 (size!3070 (buf!3567 thiss!1634)) (currentByte!6499 thiss!1634) (currentBit!6494 thiss!1634)) (bitIndex!0 (size!3070 (buf!3567 thiss!1634)) (currentByte!6499 thiss!1634) (currentBit!6494 thiss!1634))))))

(declare-fun b!152101 () Bool)

(declare-fun e!101684 () Bool)

(assert (=> b!152101 (= e!101686 e!101684)))

(declare-fun res!127535 () Bool)

(assert (=> b!152101 (=> res!127535 e!101684)))

(assert (=> b!152101 (= res!127535 (= (size!3070 (buf!3567 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!152102 () Bool)

(assert (=> b!152102 (= e!101684 (arrayBitRangesEq!0 (buf!3567 thiss!1634) (buf!3567 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3070 (buf!3567 thiss!1634)) (currentByte!6499 thiss!1634) (currentBit!6494 thiss!1634))))))

(assert (= (and d!49864 res!127536) b!152100))

(assert (= (and b!152100 res!127534) b!152101))

(assert (= (and b!152101 (not res!127535)) b!152102))

(assert (=> b!152100 m!237727))

(assert (=> b!152100 m!237727))

(assert (=> b!152102 m!237727))

(assert (=> b!152102 m!237727))

(declare-fun m!237829 () Bool)

(assert (=> b!152102 m!237829))

(assert (=> b!152014 d!49864))

(declare-fun d!49868 () Bool)

(assert (=> d!49868 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!238204 () Unit!9652)

(declare-fun choose!11 (BitStream!5398) Unit!9652)

(assert (=> d!49868 (= lt!238204 (choose!11 thiss!1634))))

(assert (=> d!49868 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!238204)))

(declare-fun bs!12189 () Bool)

(assert (= bs!12189 d!49868))

(assert (=> bs!12189 m!237729))

(declare-fun m!237833 () Bool)

(assert (=> bs!12189 m!237833))

(assert (=> b!152014 d!49868))

(push 1)

(assert (not d!49854))

(assert (not d!49838))

(assert (not d!49856))

(assert (not b!152069))

(assert (not b!152070))

(assert (not b!152067))

(assert (not d!49868))

(assert (not d!49860))

(assert (not b!152102))

(assert (not d!49858))

(assert (not b!152100))

(assert (not b!152066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

