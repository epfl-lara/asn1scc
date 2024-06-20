; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29380 () Bool)

(assert start!29380)

(declare-fun res!127583 () Bool)

(declare-fun e!101722 () Bool)

(assert (=> start!29380 (=> (not res!127583) (not e!101722))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6794 0))(
  ( (array!6795 (arr!3890 (Array (_ BitVec 32) (_ BitVec 8))) (size!3073 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6794)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!29380 (= res!127583 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3073 arr!237))))))

(assert (=> start!29380 e!101722))

(assert (=> start!29380 true))

(declare-fun array_inv!2862 (array!6794) Bool)

(assert (=> start!29380 (array_inv!2862 arr!237)))

(declare-datatypes ((BitStream!5404 0))(
  ( (BitStream!5405 (buf!3570 array!6794) (currentByte!6511 (_ BitVec 32)) (currentBit!6506 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5404)

(declare-fun e!101724 () Bool)

(declare-fun inv!12 (BitStream!5404) Bool)

(assert (=> start!29380 (and (inv!12 thiss!1634) e!101724)))

(declare-fun b!152154 () Bool)

(assert (=> b!152154 (= e!101724 (array_inv!2862 (buf!3570 thiss!1634)))))

(declare-fun b!152155 () Bool)

(declare-fun e!101721 () Bool)

(assert (=> b!152155 (= e!101722 (not e!101721))))

(declare-fun res!127581 () Bool)

(assert (=> b!152155 (=> (not res!127581) (not e!101721))))

(declare-fun lt!238306 () (_ BitVec 64))

(declare-fun lt!238304 () (_ BitVec 64))

(assert (=> b!152155 (= res!127581 (= lt!238306 (bvadd lt!238306 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!238304))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152155 (= lt!238306 (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634)))))

(assert (=> b!152155 (= lt!238304 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5404 BitStream!5404) Bool)

(assert (=> b!152155 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9661 0))(
  ( (Unit!9662) )
))
(declare-fun lt!238301 () Unit!9661)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5404) Unit!9661)

(assert (=> b!152155 (= lt!238301 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!152156 () Bool)

(declare-fun res!127584 () Bool)

(assert (=> b!152156 (=> (not res!127584) (not e!101722))))

(assert (=> b!152156 (= res!127584 (bvsge from!447 to!404))))

(declare-fun b!152157 () Bool)

(declare-fun res!127580 () Bool)

(assert (=> b!152157 (=> (not res!127580) (not e!101722))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!152157 (= res!127580 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!13540 0))(
  ( (tuple2!13541 (_1!7145 BitStream!5404) (_2!7145 array!6794)) )
))
(declare-fun lt!238302 () tuple2!13540)

(declare-fun e!101723 () Bool)

(declare-fun b!152158 () Bool)

(declare-fun arrayRangesEq!368 (array!6794 array!6794 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152158 (= e!101723 (not (arrayRangesEq!368 arr!237 (_2!7145 lt!238302) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!152159 () Bool)

(assert (=> b!152159 (= e!101721 (not e!101723))))

(declare-fun res!127582 () Bool)

(assert (=> b!152159 (=> res!127582 e!101723)))

(declare-datatypes ((tuple2!13542 0))(
  ( (tuple2!13543 (_1!7146 BitStream!5404) (_2!7146 BitStream!5404)) )
))
(declare-fun lt!238303 () tuple2!13542)

(assert (=> b!152159 (= res!127582 (or (not (= (size!3073 (_2!7145 lt!238302)) (size!3073 arr!237))) (not (= (_1!7145 lt!238302) (_2!7146 lt!238303)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5404 array!6794 (_ BitVec 32) (_ BitVec 32)) tuple2!13540)

(assert (=> b!152159 (= lt!238302 (readByteArrayLoopPure!0 (_1!7146 lt!238303) arr!237 from!447 to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152159 (validate_offset_bits!1 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634)) lt!238304)))

(declare-fun lt!238305 () Unit!9661)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5404 array!6794 (_ BitVec 64)) Unit!9661)

(assert (=> b!152159 (= lt!238305 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3570 thiss!1634) lt!238304))))

(declare-fun reader!0 (BitStream!5404 BitStream!5404) tuple2!13542)

(assert (=> b!152159 (= lt!238303 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!29380 res!127583) b!152157))

(assert (= (and b!152157 res!127580) b!152156))

(assert (= (and b!152156 res!127584) b!152155))

(assert (= (and b!152155 res!127581) b!152159))

(assert (= (and b!152159 (not res!127582)) b!152158))

(assert (= start!29380 b!152154))

(declare-fun m!237865 () Bool)

(assert (=> b!152158 m!237865))

(declare-fun m!237867 () Bool)

(assert (=> b!152157 m!237867))

(declare-fun m!237869 () Bool)

(assert (=> start!29380 m!237869))

(declare-fun m!237871 () Bool)

(assert (=> start!29380 m!237871))

(declare-fun m!237873 () Bool)

(assert (=> b!152159 m!237873))

(declare-fun m!237875 () Bool)

(assert (=> b!152159 m!237875))

(declare-fun m!237877 () Bool)

(assert (=> b!152159 m!237877))

(declare-fun m!237879 () Bool)

(assert (=> b!152159 m!237879))

(declare-fun m!237881 () Bool)

(assert (=> b!152154 m!237881))

(declare-fun m!237883 () Bool)

(assert (=> b!152155 m!237883))

(declare-fun m!237885 () Bool)

(assert (=> b!152155 m!237885))

(declare-fun m!237887 () Bool)

(assert (=> b!152155 m!237887))

(push 1)

(assert (not b!152157))

(assert (not b!152155))

(assert (not b!152159))

(assert (not start!29380))

(assert (not b!152154))

(assert (not b!152158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!49902 () Bool)

(declare-fun res!127619 () Bool)

(declare-fun e!101765 () Bool)

(assert (=> d!49902 (=> res!127619 e!101765)))

(assert (=> d!49902 (= res!127619 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49902 (= (arrayRangesEq!368 arr!237 (_2!7145 lt!238302) #b00000000000000000000000000000000 to!404) e!101765)))

(declare-fun b!152200 () Bool)

(declare-fun e!101766 () Bool)

(assert (=> b!152200 (= e!101765 e!101766)))

(declare-fun res!127620 () Bool)

(assert (=> b!152200 (=> (not res!127620) (not e!101766))))

(assert (=> b!152200 (= res!127620 (= (select (arr!3890 arr!237) #b00000000000000000000000000000000) (select (arr!3890 (_2!7145 lt!238302)) #b00000000000000000000000000000000)))))

(declare-fun b!152201 () Bool)

(assert (=> b!152201 (= e!101766 (arrayRangesEq!368 arr!237 (_2!7145 lt!238302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49902 (not res!127619)) b!152200))

(assert (= (and b!152200 res!127620) b!152201))

(declare-fun m!237943 () Bool)

(assert (=> b!152200 m!237943))

(declare-fun m!237945 () Bool)

(assert (=> b!152200 m!237945))

(declare-fun m!237947 () Bool)

(assert (=> b!152201 m!237947))

(assert (=> b!152158 d!49902))

(declare-datatypes ((tuple3!602 0))(
  ( (tuple3!603 (_1!7152 Unit!9661) (_2!7152 BitStream!5404) (_3!376 array!6794)) )
))
(declare-fun lt!238351 () tuple3!602)

(declare-fun d!49904 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5404 array!6794 (_ BitVec 32) (_ BitVec 32)) tuple3!602)

(assert (=> d!49904 (= lt!238351 (readByteArrayLoop!0 (_1!7146 lt!238303) arr!237 from!447 to!404))))

(assert (=> d!49904 (= (readByteArrayLoopPure!0 (_1!7146 lt!238303) arr!237 from!447 to!404) (tuple2!13541 (_2!7152 lt!238351) (_3!376 lt!238351)))))

(declare-fun bs!12204 () Bool)

(assert (= bs!12204 d!49904))

(declare-fun m!237949 () Bool)

(assert (=> bs!12204 m!237949))

(assert (=> b!152159 d!49904))

(declare-fun d!49906 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49906 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634)) lt!238304) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634))) lt!238304))))

(declare-fun bs!12205 () Bool)

(assert (= bs!12205 d!49906))

(declare-fun m!237951 () Bool)

(assert (=> bs!12205 m!237951))

(assert (=> b!152159 d!49906))

(declare-fun d!49908 () Bool)

(assert (=> d!49908 (validate_offset_bits!1 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634)) lt!238304)))

(declare-fun lt!238354 () Unit!9661)

(declare-fun choose!9 (BitStream!5404 array!6794 (_ BitVec 64) BitStream!5404) Unit!9661)

(assert (=> d!49908 (= lt!238354 (choose!9 thiss!1634 (buf!3570 thiss!1634) lt!238304 (BitStream!5405 (buf!3570 thiss!1634) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))))))

(assert (=> d!49908 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3570 thiss!1634) lt!238304) lt!238354)))

(declare-fun bs!12206 () Bool)

(assert (= bs!12206 d!49908))

(assert (=> bs!12206 m!237875))

(declare-fun m!237953 () Bool)

(assert (=> bs!12206 m!237953))

(assert (=> b!152159 d!49908))

(declare-fun b!152252 () Bool)

(declare-fun e!101796 () Unit!9661)

(declare-fun Unit!9668 () Unit!9661)

(assert (=> b!152252 (= e!101796 Unit!9668)))

(declare-fun b!152253 () Bool)

(declare-fun res!127663 () Bool)

(declare-fun e!101797 () Bool)

(assert (=> b!152253 (=> (not res!127663) (not e!101797))))

(declare-fun lt!238482 () tuple2!13542)

(assert (=> b!152253 (= res!127663 (isPrefixOf!0 (_1!7146 lt!238482) thiss!1634))))

(declare-fun b!152255 () Bool)

(declare-fun lt!238497 () Unit!9661)

(assert (=> b!152255 (= e!101796 lt!238497)))

(declare-fun lt!238492 () (_ BitVec 64))

(assert (=> b!152255 (= lt!238492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!238486 () (_ BitVec 64))

(assert (=> b!152255 (= lt!238486 (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6794 array!6794 (_ BitVec 64) (_ BitVec 64)) Unit!9661)

(assert (=> b!152255 (= lt!238497 (arrayBitRangesEqSymmetric!0 (buf!3570 thiss!1634) (buf!3570 thiss!1634) lt!238492 lt!238486))))

(declare-fun arrayBitRangesEq!0 (array!6794 array!6794 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152255 (arrayBitRangesEq!0 (buf!3570 thiss!1634) (buf!3570 thiss!1634) lt!238492 lt!238486)))

(declare-fun lt!238489 () (_ BitVec 64))

(declare-fun b!152256 () Bool)

(declare-fun lt!238494 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5404 (_ BitVec 64)) BitStream!5404)

(assert (=> b!152256 (= e!101797 (= (_1!7146 lt!238482) (withMovedBitIndex!0 (_2!7146 lt!238482) (bvsub lt!238494 lt!238489))))))

(assert (=> b!152256 (or (= (bvand lt!238494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238494 lt!238489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!152256 (= lt!238489 (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634)))))

(assert (=> b!152256 (= lt!238494 (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634)))))

(declare-fun d!49910 () Bool)

(assert (=> d!49910 e!101797))

(declare-fun res!127662 () Bool)

(assert (=> d!49910 (=> (not res!127662) (not e!101797))))

(assert (=> d!49910 (= res!127662 (isPrefixOf!0 (_1!7146 lt!238482) (_2!7146 lt!238482)))))

(declare-fun lt!238500 () BitStream!5404)

(assert (=> d!49910 (= lt!238482 (tuple2!13543 lt!238500 thiss!1634))))

(declare-fun lt!238488 () Unit!9661)

(declare-fun lt!238491 () Unit!9661)

(assert (=> d!49910 (= lt!238488 lt!238491)))

(assert (=> d!49910 (isPrefixOf!0 lt!238500 thiss!1634)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5404 BitStream!5404 BitStream!5404) Unit!9661)

(assert (=> d!49910 (= lt!238491 (lemmaIsPrefixTransitive!0 lt!238500 thiss!1634 thiss!1634))))

(declare-fun lt!238499 () Unit!9661)

(declare-fun lt!238487 () Unit!9661)

(assert (=> d!49910 (= lt!238499 lt!238487)))

(assert (=> d!49910 (isPrefixOf!0 lt!238500 thiss!1634)))

(assert (=> d!49910 (= lt!238487 (lemmaIsPrefixTransitive!0 lt!238500 thiss!1634 thiss!1634))))

(declare-fun lt!238495 () Unit!9661)

(assert (=> d!49910 (= lt!238495 e!101796)))

(declare-fun c!8133 () Bool)

(assert (=> d!49910 (= c!8133 (not (= (size!3073 (buf!3570 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!238483 () Unit!9661)

(declare-fun lt!238493 () Unit!9661)

(assert (=> d!49910 (= lt!238483 lt!238493)))

(assert (=> d!49910 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49910 (= lt!238493 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238498 () Unit!9661)

(declare-fun lt!238484 () Unit!9661)

(assert (=> d!49910 (= lt!238498 lt!238484)))

(assert (=> d!49910 (= lt!238484 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238485 () Unit!9661)

(declare-fun lt!238496 () Unit!9661)

(assert (=> d!49910 (= lt!238485 lt!238496)))

(assert (=> d!49910 (isPrefixOf!0 lt!238500 lt!238500)))

(assert (=> d!49910 (= lt!238496 (lemmaIsPrefixRefl!0 lt!238500))))

(declare-fun lt!238490 () Unit!9661)

(declare-fun lt!238501 () Unit!9661)

(assert (=> d!49910 (= lt!238490 lt!238501)))

(assert (=> d!49910 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49910 (= lt!238501 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49910 (= lt!238500 (BitStream!5405 (buf!3570 thiss!1634) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634)))))

(assert (=> d!49910 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49910 (= (reader!0 thiss!1634 thiss!1634) lt!238482)))

(declare-fun b!152254 () Bool)

(declare-fun res!127661 () Bool)

(assert (=> b!152254 (=> (not res!127661) (not e!101797))))

(assert (=> b!152254 (= res!127661 (isPrefixOf!0 (_2!7146 lt!238482) thiss!1634))))

(assert (= (and d!49910 c!8133) b!152255))

(assert (= (and d!49910 (not c!8133)) b!152252))

(assert (= (and d!49910 res!127662) b!152253))

(assert (= (and b!152253 res!127663) b!152254))

(assert (= (and b!152254 res!127661) b!152256))

(declare-fun m!238001 () Bool)

(assert (=> b!152256 m!238001))

(assert (=> b!152256 m!237883))

(assert (=> b!152256 m!237883))

(declare-fun m!238003 () Bool)

(assert (=> b!152253 m!238003))

(assert (=> b!152255 m!237883))

(declare-fun m!238005 () Bool)

(assert (=> b!152255 m!238005))

(declare-fun m!238007 () Bool)

(assert (=> b!152255 m!238007))

(declare-fun m!238009 () Bool)

(assert (=> b!152254 m!238009))

(declare-fun m!238011 () Bool)

(assert (=> d!49910 m!238011))

(assert (=> d!49910 m!237885))

(declare-fun m!238013 () Bool)

(assert (=> d!49910 m!238013))

(assert (=> d!49910 m!237885))

(declare-fun m!238015 () Bool)

(assert (=> d!49910 m!238015))

(declare-fun m!238017 () Bool)

(assert (=> d!49910 m!238017))

(assert (=> d!49910 m!237887))

(assert (=> d!49910 m!237887))

(declare-fun m!238019 () Bool)

(assert (=> d!49910 m!238019))

(assert (=> d!49910 m!237885))

(assert (=> d!49910 m!238017))

(assert (=> b!152159 d!49910))

(declare-fun d!49942 () Bool)

(assert (=> d!49942 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12215 () Bool)

(assert (= bs!12215 d!49942))

(assert (=> bs!12215 m!237951))

(assert (=> b!152157 d!49942))

(declare-fun d!49944 () Bool)

(assert (=> d!49944 (= (array_inv!2862 arr!237) (bvsge (size!3073 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!29380 d!49944))

(declare-fun d!49946 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!49946 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6506 thiss!1634) (currentByte!6511 thiss!1634) (size!3073 (buf!3570 thiss!1634))))))

(declare-fun bs!12216 () Bool)

(assert (= bs!12216 d!49946))

(declare-fun m!238021 () Bool)

(assert (=> bs!12216 m!238021))

(assert (=> start!29380 d!49946))

(declare-fun d!49948 () Bool)

(assert (=> d!49948 (= (array_inv!2862 (buf!3570 thiss!1634)) (bvsge (size!3073 (buf!3570 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!152154 d!49948))

(declare-fun d!49950 () Bool)

(declare-fun e!101802 () Bool)

(assert (=> d!49950 e!101802))

(declare-fun res!127670 () Bool)

(assert (=> d!49950 (=> (not res!127670) (not e!101802))))

(declare-fun lt!238514 () (_ BitVec 64))

(declare-fun lt!238515 () (_ BitVec 64))

(declare-fun lt!238519 () (_ BitVec 64))

(assert (=> d!49950 (= res!127670 (= lt!238514 (bvsub lt!238515 lt!238519)))))

(assert (=> d!49950 (or (= (bvand lt!238515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238515 lt!238519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49950 (= lt!238519 (remainingBits!0 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634))))))

(declare-fun lt!238518 () (_ BitVec 64))

(declare-fun lt!238517 () (_ BitVec 64))

(assert (=> d!49950 (= lt!238515 (bvmul lt!238518 lt!238517))))

(assert (=> d!49950 (or (= lt!238518 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!238517 (bvsdiv (bvmul lt!238518 lt!238517) lt!238518)))))

(assert (=> d!49950 (= lt!238517 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49950 (= lt!238518 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))))))

(assert (=> d!49950 (= lt!238514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6511 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6506 thiss!1634))))))

(assert (=> d!49950 (invariant!0 (currentBit!6506 thiss!1634) (currentByte!6511 thiss!1634) (size!3073 (buf!3570 thiss!1634)))))

(assert (=> d!49950 (= (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634)) lt!238514)))

(declare-fun b!152263 () Bool)

(declare-fun res!127671 () Bool)

(assert (=> b!152263 (=> (not res!127671) (not e!101802))))

(assert (=> b!152263 (= res!127671 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!238514))))

(declare-fun b!152264 () Bool)

(declare-fun lt!238516 () (_ BitVec 64))

(assert (=> b!152264 (= e!101802 (bvsle lt!238514 (bvmul lt!238516 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152264 (or (= lt!238516 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!238516 #b0000000000000000000000000000000000000000000000000000000000001000) lt!238516)))))

(assert (=> b!152264 (= lt!238516 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))))))

(assert (= (and d!49950 res!127670) b!152263))

(assert (= (and b!152263 res!127671) b!152264))

(assert (=> d!49950 m!237951))

(assert (=> d!49950 m!238021))

(assert (=> b!152155 d!49950))

(declare-fun d!49952 () Bool)

(declare-fun res!127679 () Bool)

(declare-fun e!101808 () Bool)

(assert (=> d!49952 (=> (not res!127679) (not e!101808))))

(assert (=> d!49952 (= res!127679 (= (size!3073 (buf!3570 thiss!1634)) (size!3073 (buf!3570 thiss!1634))))))

(assert (=> d!49952 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!101808)))

(declare-fun b!152271 () Bool)

(declare-fun res!127680 () Bool)

(assert (=> b!152271 (=> (not res!127680) (not e!101808))))

(assert (=> b!152271 (= res!127680 (bvsle (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634)) (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))))))

(declare-fun b!152272 () Bool)

(declare-fun e!101807 () Bool)

(assert (=> b!152272 (= e!101808 e!101807)))

(declare-fun res!127678 () Bool)

(assert (=> b!152272 (=> res!127678 e!101807)))

(assert (=> b!152272 (= res!127678 (= (size!3073 (buf!3570 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!152273 () Bool)

(assert (=> b!152273 (= e!101807 (arrayBitRangesEq!0 (buf!3570 thiss!1634) (buf!3570 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))))))

(assert (= (and d!49952 res!127679) b!152271))

(assert (= (and b!152271 res!127680) b!152272))

(assert (= (and b!152272 (not res!127678)) b!152273))

(assert (=> b!152271 m!237883))

(assert (=> b!152271 m!237883))

(assert (=> b!152273 m!237883))

(assert (=> b!152273 m!237883))

(declare-fun m!238023 () Bool)

(assert (=> b!152273 m!238023))

(assert (=> b!152155 d!49952))

(declare-fun d!49954 () Bool)

(assert (=> d!49954 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!238522 () Unit!9661)

(declare-fun choose!11 (BitStream!5404) Unit!9661)

(assert (=> d!49954 (= lt!238522 (choose!11 thiss!1634))))

(assert (=> d!49954 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!238522)))

(declare-fun bs!12218 () Bool)

(assert (= bs!12218 d!49954))

(assert (=> bs!12218 m!237885))

(declare-fun m!238025 () Bool)

(assert (=> bs!12218 m!238025))

(assert (=> b!152155 d!49954))

(push 1)

(assert (not b!152256))

(assert (not b!152201))

(assert (not b!152273))

(assert (not d!49904))

(assert (not b!152271))

(assert (not d!49908))

(assert (not d!49942))

(assert (not d!49910))

(assert (not b!152254))

(assert (not b!152253))

(assert (not d!49946))

(assert (not d!49954))

(assert (not d!49950))

(assert (not d!49906))

(assert (not b!152255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50032 () Bool)

(assert (=> d!50032 (= (remainingBits!0 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6511 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6506 thiss!1634)))))))

(assert (=> d!49942 d!50032))

(assert (=> b!152271 d!49950))

(declare-fun d!50034 () Bool)

(assert (=> d!50034 (isPrefixOf!0 lt!238500 lt!238500)))

(declare-fun lt!238870 () Unit!9661)

(assert (=> d!50034 (= lt!238870 (choose!11 lt!238500))))

(assert (=> d!50034 (= (lemmaIsPrefixRefl!0 lt!238500) lt!238870)))

(declare-fun bs!12233 () Bool)

(assert (= bs!12233 d!50034))

(assert (=> bs!12233 m!238013))

(declare-fun m!238255 () Bool)

(assert (=> bs!12233 m!238255))

(assert (=> d!49910 d!50034))

(declare-fun d!50036 () Bool)

(assert (=> d!50036 (isPrefixOf!0 lt!238500 thiss!1634)))

(declare-fun lt!238873 () Unit!9661)

(declare-fun choose!30 (BitStream!5404 BitStream!5404 BitStream!5404) Unit!9661)

(assert (=> d!50036 (= lt!238873 (choose!30 lt!238500 thiss!1634 thiss!1634))))

(assert (=> d!50036 (isPrefixOf!0 lt!238500 thiss!1634)))

(assert (=> d!50036 (= (lemmaIsPrefixTransitive!0 lt!238500 thiss!1634 thiss!1634) lt!238873)))

(declare-fun bs!12234 () Bool)

(assert (= bs!12234 d!50036))

(assert (=> bs!12234 m!238019))

(declare-fun m!238257 () Bool)

(assert (=> bs!12234 m!238257))

(assert (=> bs!12234 m!238019))

(assert (=> d!49910 d!50036))

(declare-fun d!50038 () Bool)

(declare-fun res!127804 () Bool)

(declare-fun e!101921 () Bool)

(assert (=> d!50038 (=> (not res!127804) (not e!101921))))

(assert (=> d!50038 (= res!127804 (= (size!3073 (buf!3570 lt!238500)) (size!3073 (buf!3570 lt!238500))))))

(assert (=> d!50038 (= (isPrefixOf!0 lt!238500 lt!238500) e!101921)))

(declare-fun b!152430 () Bool)

(declare-fun res!127805 () Bool)

(assert (=> b!152430 (=> (not res!127805) (not e!101921))))

(assert (=> b!152430 (= res!127805 (bvsle (bitIndex!0 (size!3073 (buf!3570 lt!238500)) (currentByte!6511 lt!238500) (currentBit!6506 lt!238500)) (bitIndex!0 (size!3073 (buf!3570 lt!238500)) (currentByte!6511 lt!238500) (currentBit!6506 lt!238500))))))

(declare-fun b!152431 () Bool)

(declare-fun e!101920 () Bool)

(assert (=> b!152431 (= e!101921 e!101920)))

(declare-fun res!127803 () Bool)

(assert (=> b!152431 (=> res!127803 e!101920)))

(assert (=> b!152431 (= res!127803 (= (size!3073 (buf!3570 lt!238500)) #b00000000000000000000000000000000))))

(declare-fun b!152432 () Bool)

(assert (=> b!152432 (= e!101920 (arrayBitRangesEq!0 (buf!3570 lt!238500) (buf!3570 lt!238500) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3073 (buf!3570 lt!238500)) (currentByte!6511 lt!238500) (currentBit!6506 lt!238500))))))

(assert (= (and d!50038 res!127804) b!152430))

(assert (= (and b!152430 res!127805) b!152431))

(assert (= (and b!152431 (not res!127803)) b!152432))

(declare-fun m!238259 () Bool)

(assert (=> b!152430 m!238259))

(assert (=> b!152430 m!238259))

(assert (=> b!152432 m!238259))

(assert (=> b!152432 m!238259))

(declare-fun m!238261 () Bool)

(assert (=> b!152432 m!238261))

(assert (=> d!49910 d!50038))

(declare-fun d!50040 () Bool)

(declare-fun res!127807 () Bool)

(declare-fun e!101923 () Bool)

(assert (=> d!50040 (=> (not res!127807) (not e!101923))))

(assert (=> d!50040 (= res!127807 (= (size!3073 (buf!3570 (_1!7146 lt!238482))) (size!3073 (buf!3570 (_2!7146 lt!238482)))))))

(assert (=> d!50040 (= (isPrefixOf!0 (_1!7146 lt!238482) (_2!7146 lt!238482)) e!101923)))

(declare-fun b!152433 () Bool)

(declare-fun res!127808 () Bool)

(assert (=> b!152433 (=> (not res!127808) (not e!101923))))

(assert (=> b!152433 (= res!127808 (bvsle (bitIndex!0 (size!3073 (buf!3570 (_1!7146 lt!238482))) (currentByte!6511 (_1!7146 lt!238482)) (currentBit!6506 (_1!7146 lt!238482))) (bitIndex!0 (size!3073 (buf!3570 (_2!7146 lt!238482))) (currentByte!6511 (_2!7146 lt!238482)) (currentBit!6506 (_2!7146 lt!238482)))))))

(declare-fun b!152434 () Bool)

(declare-fun e!101922 () Bool)

(assert (=> b!152434 (= e!101923 e!101922)))

(declare-fun res!127806 () Bool)

(assert (=> b!152434 (=> res!127806 e!101922)))

(assert (=> b!152434 (= res!127806 (= (size!3073 (buf!3570 (_1!7146 lt!238482))) #b00000000000000000000000000000000))))

(declare-fun b!152435 () Bool)

(assert (=> b!152435 (= e!101922 (arrayBitRangesEq!0 (buf!3570 (_1!7146 lt!238482)) (buf!3570 (_2!7146 lt!238482)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3073 (buf!3570 (_1!7146 lt!238482))) (currentByte!6511 (_1!7146 lt!238482)) (currentBit!6506 (_1!7146 lt!238482)))))))

(assert (= (and d!50040 res!127807) b!152433))

(assert (= (and b!152433 res!127808) b!152434))

(assert (= (and b!152434 (not res!127806)) b!152435))

(declare-fun m!238263 () Bool)

(assert (=> b!152433 m!238263))

(declare-fun m!238265 () Bool)

(assert (=> b!152433 m!238265))

(assert (=> b!152435 m!238263))

(assert (=> b!152435 m!238263))

(declare-fun m!238267 () Bool)

(assert (=> b!152435 m!238267))

(assert (=> d!49910 d!50040))

(assert (=> d!49910 d!49952))

(declare-fun d!50042 () Bool)

(declare-fun res!127810 () Bool)

(declare-fun e!101925 () Bool)

(assert (=> d!50042 (=> (not res!127810) (not e!101925))))

(assert (=> d!50042 (= res!127810 (= (size!3073 (buf!3570 lt!238500)) (size!3073 (buf!3570 thiss!1634))))))

(assert (=> d!50042 (= (isPrefixOf!0 lt!238500 thiss!1634) e!101925)))

(declare-fun b!152436 () Bool)

(declare-fun res!127811 () Bool)

(assert (=> b!152436 (=> (not res!127811) (not e!101925))))

(assert (=> b!152436 (= res!127811 (bvsle (bitIndex!0 (size!3073 (buf!3570 lt!238500)) (currentByte!6511 lt!238500) (currentBit!6506 lt!238500)) (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))))))

(declare-fun b!152437 () Bool)

(declare-fun e!101924 () Bool)

(assert (=> b!152437 (= e!101925 e!101924)))

(declare-fun res!127809 () Bool)

(assert (=> b!152437 (=> res!127809 e!101924)))

(assert (=> b!152437 (= res!127809 (= (size!3073 (buf!3570 lt!238500)) #b00000000000000000000000000000000))))

(declare-fun b!152438 () Bool)

(assert (=> b!152438 (= e!101924 (arrayBitRangesEq!0 (buf!3570 lt!238500) (buf!3570 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3073 (buf!3570 lt!238500)) (currentByte!6511 lt!238500) (currentBit!6506 lt!238500))))))

(assert (= (and d!50042 res!127810) b!152436))

(assert (= (and b!152436 res!127811) b!152437))

(assert (= (and b!152437 (not res!127809)) b!152438))

(assert (=> b!152436 m!238259))

(assert (=> b!152436 m!237883))

(assert (=> b!152438 m!238259))

(assert (=> b!152438 m!238259))

(declare-fun m!238269 () Bool)

(assert (=> b!152438 m!238269))

(assert (=> d!49910 d!50042))

(assert (=> d!49910 d!49954))

(declare-fun d!50044 () Bool)

(assert (=> d!50044 (= (invariant!0 (currentBit!6506 thiss!1634) (currentByte!6511 thiss!1634) (size!3073 (buf!3570 thiss!1634))) (and (bvsge (currentBit!6506 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6506 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6511 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6511 thiss!1634) (size!3073 (buf!3570 thiss!1634))) (and (= (currentBit!6506 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6511 thiss!1634) (size!3073 (buf!3570 thiss!1634)))))))))

(assert (=> d!49946 d!50044))

(declare-fun call!2137 () (_ BitVec 64))

(declare-fun bm!2132 () Bool)

(declare-fun c!8153 () Bool)

(declare-fun lt!238959 () tuple3!602)

(assert (=> bm!2132 (= call!2137 (bitIndex!0 (ite c!8153 (size!3073 (buf!3570 (_2!7152 lt!238959))) (size!3073 (buf!3570 (_1!7146 lt!238303)))) (ite c!8153 (currentByte!6511 (_2!7152 lt!238959)) (currentByte!6511 (_1!7146 lt!238303))) (ite c!8153 (currentBit!6506 (_2!7152 lt!238959)) (currentBit!6506 (_1!7146 lt!238303)))))))

(declare-fun bm!2133 () Bool)

(declare-fun call!2135 () Bool)

(declare-fun lt!238970 () (_ BitVec 32))

(assert (=> bm!2133 (= call!2135 (arrayRangesEq!368 arr!237 (ite c!8153 (_3!376 lt!238959) arr!237) (ite c!8153 lt!238970 #b00000000000000000000000000000000) (ite c!8153 from!447 (size!3073 arr!237))))))

(declare-fun b!152449 () Bool)

(declare-fun e!101933 () tuple3!602)

(declare-fun lt!238962 () Unit!9661)

(assert (=> b!152449 (= e!101933 (tuple3!603 lt!238962 (_2!7152 lt!238959) (_3!376 lt!238959)))))

(declare-datatypes ((tuple2!13564 0))(
  ( (tuple2!13565 (_1!7162 (_ BitVec 8)) (_2!7162 BitStream!5404)) )
))
(declare-fun lt!238957 () tuple2!13564)

(declare-fun readByte!0 (BitStream!5404) tuple2!13564)

(assert (=> b!152449 (= lt!238957 (readByte!0 (_1!7146 lt!238303)))))

(declare-fun lt!238954 () array!6794)

(assert (=> b!152449 (= lt!238954 (array!6795 (store (arr!3890 arr!237) from!447 (_1!7162 lt!238957)) (size!3073 arr!237)))))

(declare-fun lt!238965 () (_ BitVec 64))

(assert (=> b!152449 (= lt!238965 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!238947 () (_ BitVec 32))

(assert (=> b!152449 (= lt!238947 (bvsub to!404 from!447))))

(declare-fun lt!238955 () Unit!9661)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5404 BitStream!5404 (_ BitVec 64) (_ BitVec 32)) Unit!9661)

(assert (=> b!152449 (= lt!238955 (validateOffsetBytesFromBitIndexLemma!0 (_1!7146 lt!238303) (_2!7162 lt!238957) lt!238965 lt!238947))))

(assert (=> b!152449 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3073 (buf!3570 (_2!7162 lt!238957)))) ((_ sign_extend 32) (currentByte!6511 (_2!7162 lt!238957))) ((_ sign_extend 32) (currentBit!6506 (_2!7162 lt!238957))) (bvsub lt!238947 ((_ extract 31 0) (bvsdiv (bvadd lt!238965 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!238973 () Unit!9661)

(assert (=> b!152449 (= lt!238973 lt!238955)))

(assert (=> b!152449 (= lt!238959 (readByteArrayLoop!0 (_2!7162 lt!238957) lt!238954 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!152449 (= (bitIndex!0 (size!3073 (buf!3570 (_2!7162 lt!238957))) (currentByte!6511 (_2!7162 lt!238957)) (currentBit!6506 (_2!7162 lt!238957))) (bvadd (bitIndex!0 (size!3073 (buf!3570 (_1!7146 lt!238303))) (currentByte!6511 (_1!7146 lt!238303)) (currentBit!6506 (_1!7146 lt!238303))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!238960 () Unit!9661)

(declare-fun Unit!9684 () Unit!9661)

(assert (=> b!152449 (= lt!238960 Unit!9684)))

(assert (=> b!152449 (= (bvadd (bitIndex!0 (size!3073 (buf!3570 (_2!7162 lt!238957))) (currentByte!6511 (_2!7162 lt!238957)) (currentBit!6506 (_2!7162 lt!238957))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2137)))

(declare-fun lt!238981 () Unit!9661)

(declare-fun Unit!9685 () Unit!9661)

(assert (=> b!152449 (= lt!238981 Unit!9685)))

(assert (=> b!152449 (= (bvadd (bitIndex!0 (size!3073 (buf!3570 (_1!7146 lt!238303))) (currentByte!6511 (_1!7146 lt!238303)) (currentBit!6506 (_1!7146 lt!238303))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2137)))

(declare-fun lt!238946 () Unit!9661)

(declare-fun Unit!9686 () Unit!9661)

(assert (=> b!152449 (= lt!238946 Unit!9686)))

(assert (=> b!152449 (and (= (buf!3570 (_1!7146 lt!238303)) (buf!3570 (_2!7152 lt!238959))) (= (size!3073 arr!237) (size!3073 (_3!376 lt!238959))))))

(declare-fun lt!238968 () Unit!9661)

(declare-fun Unit!9687 () Unit!9661)

(assert (=> b!152449 (= lt!238968 Unit!9687)))

(declare-fun lt!238948 () Unit!9661)

(declare-fun arrayUpdatedAtPrefixLemma!20 (array!6794 (_ BitVec 32) (_ BitVec 8)) Unit!9661)

(assert (=> b!152449 (= lt!238948 (arrayUpdatedAtPrefixLemma!20 arr!237 from!447 (_1!7162 lt!238957)))))

(declare-fun call!2136 () Bool)

(assert (=> b!152449 call!2136))

(declare-fun lt!238979 () Unit!9661)

(assert (=> b!152449 (= lt!238979 lt!238948)))

(assert (=> b!152449 (= lt!238970 #b00000000000000000000000000000000)))

(declare-fun lt!238971 () Unit!9661)

(declare-fun arrayRangesEqTransitive!85 (array!6794 array!6794 array!6794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9661)

(assert (=> b!152449 (= lt!238971 (arrayRangesEqTransitive!85 arr!237 lt!238954 (_3!376 lt!238959) lt!238970 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!152449 call!2135))

(declare-fun lt!238958 () Unit!9661)

(assert (=> b!152449 (= lt!238958 lt!238971)))

(assert (=> b!152449 (arrayRangesEq!368 arr!237 (_3!376 lt!238959) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!238964 () Unit!9661)

(declare-fun Unit!9688 () Unit!9661)

(assert (=> b!152449 (= lt!238964 Unit!9688)))

(declare-fun lt!238975 () Unit!9661)

(declare-fun arrayRangesEqImpliesEq!20 (array!6794 array!6794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9661)

(assert (=> b!152449 (= lt!238975 (arrayRangesEqImpliesEq!20 lt!238954 (_3!376 lt!238959) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!152449 (= (select (store (arr!3890 arr!237) from!447 (_1!7162 lt!238957)) from!447) (select (arr!3890 (_3!376 lt!238959)) from!447))))

(declare-fun lt!238978 () Unit!9661)

(assert (=> b!152449 (= lt!238978 lt!238975)))

(declare-fun lt!238976 () Bool)

(assert (=> b!152449 (= lt!238976 (= (select (arr!3890 (_3!376 lt!238959)) from!447) (_1!7162 lt!238957)))))

(declare-fun Unit!9689 () Unit!9661)

(assert (=> b!152449 (= lt!238962 Unit!9689)))

(assert (=> b!152449 lt!238976))

(declare-fun b!152451 () Bool)

(declare-fun e!101934 () Bool)

(declare-fun lt!238949 () tuple3!602)

(declare-datatypes ((tuple2!13566 0))(
  ( (tuple2!13567 (_1!7163 BitStream!5404) (_2!7163 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5404) tuple2!13566)

(assert (=> b!152451 (= e!101934 (= (select (arr!3890 (_3!376 lt!238949)) from!447) (_2!7163 (readBytePure!0 (_1!7146 lt!238303)))))))

(assert (=> b!152451 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3073 (_3!376 lt!238949))))))

(declare-fun lt!238974 () (_ BitVec 32))

(declare-fun lt!238951 () (_ BitVec 32))

(declare-fun lt!238966 () array!6794)

(declare-fun lt!238969 () array!6794)

(declare-fun bm!2134 () Bool)

(assert (=> bm!2134 (= call!2136 (arrayRangesEq!368 (ite c!8153 arr!237 lt!238969) (ite c!8153 (array!6795 (store (arr!3890 arr!237) from!447 (_1!7162 lt!238957)) (size!3073 arr!237)) lt!238966) (ite c!8153 #b00000000000000000000000000000000 lt!238951) (ite c!8153 from!447 lt!238974)))))

(declare-fun lt!238953 () Unit!9661)

(declare-fun b!152452 () Bool)

(assert (=> b!152452 (= e!101933 (tuple3!603 lt!238953 (_1!7146 lt!238303) arr!237))))

(assert (=> b!152452 (= call!2137 call!2137)))

(declare-fun lt!238963 () Unit!9661)

(declare-fun Unit!9690 () Unit!9661)

(assert (=> b!152452 (= lt!238963 Unit!9690)))

(declare-fun lt!238952 () Unit!9661)

(declare-fun arrayRangesEqReflexiveLemma!20 (array!6794) Unit!9661)

(assert (=> b!152452 (= lt!238952 (arrayRangesEqReflexiveLemma!20 arr!237))))

(assert (=> b!152452 call!2135))

(declare-fun lt!238972 () Unit!9661)

(assert (=> b!152452 (= lt!238972 lt!238952)))

(assert (=> b!152452 (= lt!238969 arr!237)))

(assert (=> b!152452 (= lt!238966 arr!237)))

(declare-fun lt!238961 () (_ BitVec 32))

(assert (=> b!152452 (= lt!238961 #b00000000000000000000000000000000)))

(declare-fun lt!238967 () (_ BitVec 32))

(assert (=> b!152452 (= lt!238967 (size!3073 arr!237))))

(assert (=> b!152452 (= lt!238951 #b00000000000000000000000000000000)))

(assert (=> b!152452 (= lt!238974 from!447)))

(declare-fun arrayRangesEqSlicedLemma!20 (array!6794 array!6794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9661)

(assert (=> b!152452 (= lt!238953 (arrayRangesEqSlicedLemma!20 lt!238969 lt!238966 lt!238961 lt!238967 lt!238951 lt!238974))))

(assert (=> b!152452 call!2136))

(declare-fun e!101932 () Bool)

(declare-fun b!152453 () Bool)

(assert (=> b!152453 (= e!101932 (arrayRangesEq!368 arr!237 (_3!376 lt!238949) #b00000000000000000000000000000000 from!447))))

(declare-fun b!152450 () Bool)

(declare-fun res!127820 () Bool)

(assert (=> b!152450 (=> (not res!127820) (not e!101932))))

(assert (=> b!152450 (= res!127820 (and (= (buf!3570 (_1!7146 lt!238303)) (buf!3570 (_2!7152 lt!238949))) (= (size!3073 arr!237) (size!3073 (_3!376 lt!238949)))))))

(declare-fun d!50046 () Bool)

(assert (=> d!50046 e!101934))

(declare-fun res!127818 () Bool)

(assert (=> d!50046 (=> res!127818 e!101934)))

(assert (=> d!50046 (= res!127818 (bvsge from!447 to!404))))

(declare-fun lt!238980 () Bool)

(assert (=> d!50046 (= lt!238980 e!101932)))

(declare-fun res!127819 () Bool)

(assert (=> d!50046 (=> (not res!127819) (not e!101932))))

(declare-fun lt!238950 () (_ BitVec 64))

(declare-fun lt!238956 () (_ BitVec 64))

(assert (=> d!50046 (= res!127819 (= (bvadd lt!238956 lt!238950) (bitIndex!0 (size!3073 (buf!3570 (_2!7152 lt!238949))) (currentByte!6511 (_2!7152 lt!238949)) (currentBit!6506 (_2!7152 lt!238949)))))))

(assert (=> d!50046 (or (not (= (bvand lt!238956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238950 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!238956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!238956 lt!238950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238977 () (_ BitVec 64))

(assert (=> d!50046 (= lt!238950 (bvmul lt!238977 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!50046 (or (= lt!238977 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!238977 #b0000000000000000000000000000000000000000000000000000000000001000) lt!238977)))))

(assert (=> d!50046 (= lt!238977 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!50046 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!50046 (= lt!238956 (bitIndex!0 (size!3073 (buf!3570 (_1!7146 lt!238303))) (currentByte!6511 (_1!7146 lt!238303)) (currentBit!6506 (_1!7146 lt!238303))))))

(assert (=> d!50046 (= lt!238949 e!101933)))

(assert (=> d!50046 (= c!8153 (bvslt from!447 to!404))))

(assert (=> d!50046 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3073 arr!237)))))

(assert (=> d!50046 (= (readByteArrayLoop!0 (_1!7146 lt!238303) arr!237 from!447 to!404) lt!238949)))

(assert (= (and d!50046 c!8153) b!152449))

(assert (= (and d!50046 (not c!8153)) b!152452))

(assert (= (or b!152449 b!152452) bm!2134))

(assert (= (or b!152449 b!152452) bm!2133))

(assert (= (or b!152449 b!152452) bm!2132))

(assert (= (and d!50046 res!127819) b!152450))

(assert (= (and b!152450 res!127820) b!152453))

(assert (= (and d!50046 (not res!127818)) b!152451))

(declare-fun m!238271 () Bool)

(assert (=> b!152453 m!238271))

(declare-fun m!238273 () Bool)

(assert (=> b!152452 m!238273))

(declare-fun m!238275 () Bool)

(assert (=> b!152452 m!238275))

(declare-fun m!238277 () Bool)

(assert (=> d!50046 m!238277))

(declare-fun m!238279 () Bool)

(assert (=> d!50046 m!238279))

(declare-fun m!238281 () Bool)

(assert (=> b!152449 m!238281))

(declare-fun m!238283 () Bool)

(assert (=> b!152449 m!238283))

(declare-fun m!238285 () Bool)

(assert (=> b!152449 m!238285))

(declare-fun m!238287 () Bool)

(assert (=> b!152449 m!238287))

(declare-fun m!238289 () Bool)

(assert (=> b!152449 m!238289))

(declare-fun m!238291 () Bool)

(assert (=> b!152449 m!238291))

(declare-fun m!238293 () Bool)

(assert (=> b!152449 m!238293))

(assert (=> b!152449 m!238279))

(declare-fun m!238295 () Bool)

(assert (=> b!152449 m!238295))

(declare-fun m!238297 () Bool)

(assert (=> b!152449 m!238297))

(declare-fun m!238299 () Bool)

(assert (=> b!152449 m!238299))

(declare-fun m!238301 () Bool)

(assert (=> b!152449 m!238301))

(declare-fun m!238303 () Bool)

(assert (=> b!152449 m!238303))

(declare-fun m!238305 () Bool)

(assert (=> bm!2132 m!238305))

(declare-fun m!238307 () Bool)

(assert (=> b!152451 m!238307))

(declare-fun m!238309 () Bool)

(assert (=> b!152451 m!238309))

(assert (=> bm!2134 m!238285))

(declare-fun m!238311 () Bool)

(assert (=> bm!2134 m!238311))

(declare-fun m!238313 () Bool)

(assert (=> bm!2133 m!238313))

(assert (=> d!49904 d!50046))

(declare-fun b!152468 () Bool)

(declare-fun e!101950 () Bool)

(declare-fun e!101951 () Bool)

(assert (=> b!152468 (= e!101950 e!101951)))

(declare-fun res!127833 () Bool)

(declare-datatypes ((tuple4!154 0))(
  ( (tuple4!155 (_1!7164 (_ BitVec 32)) (_2!7164 (_ BitVec 32)) (_3!380 (_ BitVec 32)) (_4!77 (_ BitVec 32))) )
))
(declare-fun lt!238990 () tuple4!154)

(declare-fun lt!238989 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152468 (= res!127833 (byteRangesEq!0 (select (arr!3890 (buf!3570 thiss!1634)) (_3!380 lt!238990)) (select (arr!3890 (buf!3570 thiss!1634)) (_3!380 lt!238990)) lt!238989 #b00000000000000000000000000001000))))

(assert (=> b!152468 (=> (not res!127833) (not e!101951))))

(declare-fun d!50048 () Bool)

(declare-fun res!127832 () Bool)

(declare-fun e!101948 () Bool)

(assert (=> d!50048 (=> res!127832 e!101948)))

(assert (=> d!50048 (= res!127832 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))))))

(assert (=> d!50048 (= (arrayBitRangesEq!0 (buf!3570 thiss!1634) (buf!3570 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))) e!101948)))

(declare-fun b!152469 () Bool)

(declare-fun e!101947 () Bool)

(assert (=> b!152469 (= e!101947 e!101950)))

(declare-fun c!8156 () Bool)

(assert (=> b!152469 (= c!8156 (= (_3!380 lt!238990) (_4!77 lt!238990)))))

(declare-fun lt!238988 () (_ BitVec 32))

(declare-fun call!2140 () Bool)

(declare-fun bm!2137 () Bool)

(assert (=> bm!2137 (= call!2140 (byteRangesEq!0 (ite c!8156 (select (arr!3890 (buf!3570 thiss!1634)) (_3!380 lt!238990)) (select (arr!3890 (buf!3570 thiss!1634)) (_4!77 lt!238990))) (ite c!8156 (select (arr!3890 (buf!3570 thiss!1634)) (_3!380 lt!238990)) (select (arr!3890 (buf!3570 thiss!1634)) (_4!77 lt!238990))) (ite c!8156 lt!238989 #b00000000000000000000000000000000) lt!238988))))

(declare-fun b!152470 () Bool)

(assert (=> b!152470 (= e!101948 e!101947)))

(declare-fun res!127835 () Bool)

(assert (=> b!152470 (=> (not res!127835) (not e!101947))))

(declare-fun e!101949 () Bool)

(assert (=> b!152470 (= res!127835 e!101949)))

(declare-fun res!127834 () Bool)

(assert (=> b!152470 (=> res!127834 e!101949)))

(assert (=> b!152470 (= res!127834 (bvsge (_1!7164 lt!238990) (_2!7164 lt!238990)))))

(assert (=> b!152470 (= lt!238988 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152470 (= lt!238989 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!154)

(assert (=> b!152470 (= lt!238990 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))))))

(declare-fun b!152471 () Bool)

(assert (=> b!152471 (= e!101950 call!2140)))

(declare-fun b!152472 () Bool)

(assert (=> b!152472 (= e!101949 (arrayRangesEq!368 (buf!3570 thiss!1634) (buf!3570 thiss!1634) (_1!7164 lt!238990) (_2!7164 lt!238990)))))

(declare-fun b!152473 () Bool)

(declare-fun res!127831 () Bool)

(assert (=> b!152473 (= res!127831 (= lt!238988 #b00000000000000000000000000000000))))

(declare-fun e!101952 () Bool)

(assert (=> b!152473 (=> res!127831 e!101952)))

(assert (=> b!152473 (= e!101951 e!101952)))

(declare-fun b!152474 () Bool)

(assert (=> b!152474 (= e!101952 call!2140)))

(assert (= (and d!50048 (not res!127832)) b!152470))

(assert (= (and b!152470 (not res!127834)) b!152472))

(assert (= (and b!152470 res!127835) b!152469))

(assert (= (and b!152469 c!8156) b!152471))

(assert (= (and b!152469 (not c!8156)) b!152468))

(assert (= (and b!152468 res!127833) b!152473))

(assert (= (and b!152473 (not res!127831)) b!152474))

(assert (= (or b!152471 b!152474) bm!2137))

(declare-fun m!238315 () Bool)

(assert (=> b!152468 m!238315))

(assert (=> b!152468 m!238315))

(assert (=> b!152468 m!238315))

(assert (=> b!152468 m!238315))

(declare-fun m!238317 () Bool)

(assert (=> b!152468 m!238317))

(declare-fun m!238319 () Bool)

(assert (=> bm!2137 m!238319))

(assert (=> bm!2137 m!238315))

(declare-fun m!238321 () Bool)

(assert (=> bm!2137 m!238321))

(assert (=> bm!2137 m!238319))

(assert (=> bm!2137 m!238315))

(assert (=> b!152470 m!237883))

(declare-fun m!238323 () Bool)

(assert (=> b!152470 m!238323))

(declare-fun m!238325 () Bool)

(assert (=> b!152472 m!238325))

(assert (=> b!152273 d!50048))

(assert (=> b!152273 d!49950))

(assert (=> b!152255 d!49950))

(declare-fun d!50050 () Bool)

(assert (=> d!50050 (arrayBitRangesEq!0 (buf!3570 thiss!1634) (buf!3570 thiss!1634) lt!238492 lt!238486)))

(declare-fun lt!238993 () Unit!9661)

(declare-fun choose!8 (array!6794 array!6794 (_ BitVec 64) (_ BitVec 64)) Unit!9661)

(assert (=> d!50050 (= lt!238993 (choose!8 (buf!3570 thiss!1634) (buf!3570 thiss!1634) lt!238492 lt!238486))))

(assert (=> d!50050 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!238492) (bvsle lt!238492 lt!238486))))

(assert (=> d!50050 (= (arrayBitRangesEqSymmetric!0 (buf!3570 thiss!1634) (buf!3570 thiss!1634) lt!238492 lt!238486) lt!238993)))

(declare-fun bs!12235 () Bool)

(assert (= bs!12235 d!50050))

(assert (=> bs!12235 m!238007))

(declare-fun m!238327 () Bool)

(assert (=> bs!12235 m!238327))

(assert (=> b!152255 d!50050))

(declare-fun b!152475 () Bool)

(declare-fun e!101956 () Bool)

(declare-fun e!101957 () Bool)

(assert (=> b!152475 (= e!101956 e!101957)))

(declare-fun lt!238995 () (_ BitVec 32))

(declare-fun res!127838 () Bool)

(declare-fun lt!238996 () tuple4!154)

(assert (=> b!152475 (= res!127838 (byteRangesEq!0 (select (arr!3890 (buf!3570 thiss!1634)) (_3!380 lt!238996)) (select (arr!3890 (buf!3570 thiss!1634)) (_3!380 lt!238996)) lt!238995 #b00000000000000000000000000001000))))

(assert (=> b!152475 (=> (not res!127838) (not e!101957))))

(declare-fun d!50052 () Bool)

(declare-fun res!127837 () Bool)

(declare-fun e!101954 () Bool)

(assert (=> d!50052 (=> res!127837 e!101954)))

(assert (=> d!50052 (= res!127837 (bvsge lt!238492 lt!238486))))

(assert (=> d!50052 (= (arrayBitRangesEq!0 (buf!3570 thiss!1634) (buf!3570 thiss!1634) lt!238492 lt!238486) e!101954)))

(declare-fun b!152476 () Bool)

(declare-fun e!101953 () Bool)

(assert (=> b!152476 (= e!101953 e!101956)))

(declare-fun c!8157 () Bool)

(assert (=> b!152476 (= c!8157 (= (_3!380 lt!238996) (_4!77 lt!238996)))))

(declare-fun call!2141 () Bool)

(declare-fun lt!238994 () (_ BitVec 32))

(declare-fun bm!2138 () Bool)

(assert (=> bm!2138 (= call!2141 (byteRangesEq!0 (ite c!8157 (select (arr!3890 (buf!3570 thiss!1634)) (_3!380 lt!238996)) (select (arr!3890 (buf!3570 thiss!1634)) (_4!77 lt!238996))) (ite c!8157 (select (arr!3890 (buf!3570 thiss!1634)) (_3!380 lt!238996)) (select (arr!3890 (buf!3570 thiss!1634)) (_4!77 lt!238996))) (ite c!8157 lt!238995 #b00000000000000000000000000000000) lt!238994))))

(declare-fun b!152477 () Bool)

(assert (=> b!152477 (= e!101954 e!101953)))

(declare-fun res!127840 () Bool)

(assert (=> b!152477 (=> (not res!127840) (not e!101953))))

(declare-fun e!101955 () Bool)

(assert (=> b!152477 (= res!127840 e!101955)))

(declare-fun res!127839 () Bool)

(assert (=> b!152477 (=> res!127839 e!101955)))

(assert (=> b!152477 (= res!127839 (bvsge (_1!7164 lt!238996) (_2!7164 lt!238996)))))

(assert (=> b!152477 (= lt!238994 ((_ extract 31 0) (bvsrem lt!238486 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152477 (= lt!238995 ((_ extract 31 0) (bvsrem lt!238492 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152477 (= lt!238996 (arrayBitIndices!0 lt!238492 lt!238486))))

(declare-fun b!152478 () Bool)

(assert (=> b!152478 (= e!101956 call!2141)))

(declare-fun b!152479 () Bool)

(assert (=> b!152479 (= e!101955 (arrayRangesEq!368 (buf!3570 thiss!1634) (buf!3570 thiss!1634) (_1!7164 lt!238996) (_2!7164 lt!238996)))))

(declare-fun b!152480 () Bool)

(declare-fun res!127836 () Bool)

(assert (=> b!152480 (= res!127836 (= lt!238994 #b00000000000000000000000000000000))))

(declare-fun e!101958 () Bool)

(assert (=> b!152480 (=> res!127836 e!101958)))

(assert (=> b!152480 (= e!101957 e!101958)))

(declare-fun b!152481 () Bool)

(assert (=> b!152481 (= e!101958 call!2141)))

(assert (= (and d!50052 (not res!127837)) b!152477))

(assert (= (and b!152477 (not res!127839)) b!152479))

(assert (= (and b!152477 res!127840) b!152476))

(assert (= (and b!152476 c!8157) b!152478))

(assert (= (and b!152476 (not c!8157)) b!152475))

(assert (= (and b!152475 res!127838) b!152480))

(assert (= (and b!152480 (not res!127836)) b!152481))

(assert (= (or b!152478 b!152481) bm!2138))

(declare-fun m!238329 () Bool)

(assert (=> b!152475 m!238329))

(assert (=> b!152475 m!238329))

(assert (=> b!152475 m!238329))

(assert (=> b!152475 m!238329))

(declare-fun m!238331 () Bool)

(assert (=> b!152475 m!238331))

(declare-fun m!238333 () Bool)

(assert (=> bm!2138 m!238333))

(assert (=> bm!2138 m!238329))

(declare-fun m!238335 () Bool)

(assert (=> bm!2138 m!238335))

(assert (=> bm!2138 m!238333))

(assert (=> bm!2138 m!238329))

(declare-fun m!238337 () Bool)

(assert (=> b!152477 m!238337))

(declare-fun m!238339 () Bool)

(assert (=> b!152479 m!238339))

(assert (=> b!152255 d!50052))

(assert (=> d!49954 d!49952))

(declare-fun d!50054 () Bool)

(assert (=> d!50054 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!50054 true))

(declare-fun _$14!274 () Unit!9661)

(assert (=> d!50054 (= (choose!11 thiss!1634) _$14!274)))

(declare-fun bs!12237 () Bool)

(assert (= bs!12237 d!50054))

(assert (=> bs!12237 m!237885))

(assert (=> d!49954 d!50054))

(declare-fun d!50056 () Bool)

(declare-fun res!127841 () Bool)

(declare-fun e!101959 () Bool)

(assert (=> d!50056 (=> res!127841 e!101959)))

(assert (=> d!50056 (= res!127841 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!50056 (= (arrayRangesEq!368 arr!237 (_2!7145 lt!238302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101959)))

(declare-fun b!152482 () Bool)

(declare-fun e!101960 () Bool)

(assert (=> b!152482 (= e!101959 e!101960)))

(declare-fun res!127842 () Bool)

(assert (=> b!152482 (=> (not res!127842) (not e!101960))))

(assert (=> b!152482 (= res!127842 (= (select (arr!3890 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3890 (_2!7145 lt!238302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!152483 () Bool)

(assert (=> b!152483 (= e!101960 (arrayRangesEq!368 arr!237 (_2!7145 lt!238302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!50056 (not res!127841)) b!152482))

(assert (= (and b!152482 res!127842) b!152483))

(declare-fun m!238341 () Bool)

(assert (=> b!152482 m!238341))

(declare-fun m!238343 () Bool)

(assert (=> b!152482 m!238343))

(declare-fun m!238345 () Bool)

(assert (=> b!152483 m!238345))

(assert (=> b!152201 d!50056))

(declare-fun d!50058 () Bool)

(declare-fun res!127844 () Bool)

(declare-fun e!101962 () Bool)

(assert (=> d!50058 (=> (not res!127844) (not e!101962))))

(assert (=> d!50058 (= res!127844 (= (size!3073 (buf!3570 (_1!7146 lt!238482))) (size!3073 (buf!3570 thiss!1634))))))

(assert (=> d!50058 (= (isPrefixOf!0 (_1!7146 lt!238482) thiss!1634) e!101962)))

(declare-fun b!152484 () Bool)

(declare-fun res!127845 () Bool)

(assert (=> b!152484 (=> (not res!127845) (not e!101962))))

(assert (=> b!152484 (= res!127845 (bvsle (bitIndex!0 (size!3073 (buf!3570 (_1!7146 lt!238482))) (currentByte!6511 (_1!7146 lt!238482)) (currentBit!6506 (_1!7146 lt!238482))) (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))))))

(declare-fun b!152485 () Bool)

(declare-fun e!101961 () Bool)

(assert (=> b!152485 (= e!101962 e!101961)))

(declare-fun res!127843 () Bool)

(assert (=> b!152485 (=> res!127843 e!101961)))

(assert (=> b!152485 (= res!127843 (= (size!3073 (buf!3570 (_1!7146 lt!238482))) #b00000000000000000000000000000000))))

(declare-fun b!152486 () Bool)

(assert (=> b!152486 (= e!101961 (arrayBitRangesEq!0 (buf!3570 (_1!7146 lt!238482)) (buf!3570 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3073 (buf!3570 (_1!7146 lt!238482))) (currentByte!6511 (_1!7146 lt!238482)) (currentBit!6506 (_1!7146 lt!238482)))))))

(assert (= (and d!50058 res!127844) b!152484))

(assert (= (and b!152484 res!127845) b!152485))

(assert (= (and b!152485 (not res!127843)) b!152486))

(assert (=> b!152484 m!238263))

(assert (=> b!152484 m!237883))

(assert (=> b!152486 m!238263))

(assert (=> b!152486 m!238263))

(declare-fun m!238347 () Bool)

(assert (=> b!152486 m!238347))

(assert (=> b!152253 d!50058))

(declare-fun d!50060 () Bool)

(declare-fun res!127847 () Bool)

(declare-fun e!101964 () Bool)

(assert (=> d!50060 (=> (not res!127847) (not e!101964))))

(assert (=> d!50060 (= res!127847 (= (size!3073 (buf!3570 (_2!7146 lt!238482))) (size!3073 (buf!3570 thiss!1634))))))

(assert (=> d!50060 (= (isPrefixOf!0 (_2!7146 lt!238482) thiss!1634) e!101964)))

(declare-fun b!152487 () Bool)

(declare-fun res!127848 () Bool)

(assert (=> b!152487 (=> (not res!127848) (not e!101964))))

(assert (=> b!152487 (= res!127848 (bvsle (bitIndex!0 (size!3073 (buf!3570 (_2!7146 lt!238482))) (currentByte!6511 (_2!7146 lt!238482)) (currentBit!6506 (_2!7146 lt!238482))) (bitIndex!0 (size!3073 (buf!3570 thiss!1634)) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))))))

(declare-fun b!152488 () Bool)

(declare-fun e!101963 () Bool)

(assert (=> b!152488 (= e!101964 e!101963)))

(declare-fun res!127846 () Bool)

(assert (=> b!152488 (=> res!127846 e!101963)))

(assert (=> b!152488 (= res!127846 (= (size!3073 (buf!3570 (_2!7146 lt!238482))) #b00000000000000000000000000000000))))

(declare-fun b!152489 () Bool)

(assert (=> b!152489 (= e!101963 (arrayBitRangesEq!0 (buf!3570 (_2!7146 lt!238482)) (buf!3570 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3073 (buf!3570 (_2!7146 lt!238482))) (currentByte!6511 (_2!7146 lt!238482)) (currentBit!6506 (_2!7146 lt!238482)))))))

(assert (= (and d!50060 res!127847) b!152487))

(assert (= (and b!152487 res!127848) b!152488))

(assert (= (and b!152488 (not res!127846)) b!152489))

(assert (=> b!152487 m!238265))

(assert (=> b!152487 m!237883))

(assert (=> b!152489 m!238265))

(assert (=> b!152489 m!238265))

(declare-fun m!238349 () Bool)

(assert (=> b!152489 m!238349))

(assert (=> b!152254 d!50060))

(assert (=> d!49950 d!50032))

(assert (=> d!49950 d!50044))

(declare-fun d!50062 () Bool)

(declare-fun e!101967 () Bool)

(assert (=> d!50062 e!101967))

(declare-fun res!127851 () Bool)

(assert (=> d!50062 (=> (not res!127851) (not e!101967))))

(declare-fun lt!239002 () (_ BitVec 64))

(declare-fun lt!239001 () BitStream!5404)

(assert (=> d!50062 (= res!127851 (= (bvadd lt!239002 (bvsub lt!238494 lt!238489)) (bitIndex!0 (size!3073 (buf!3570 lt!239001)) (currentByte!6511 lt!239001) (currentBit!6506 lt!239001))))))

(assert (=> d!50062 (or (not (= (bvand lt!239002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238494 lt!238489) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!239002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!239002 (bvsub lt!238494 lt!238489)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50062 (= lt!239002 (bitIndex!0 (size!3073 (buf!3570 (_2!7146 lt!238482))) (currentByte!6511 (_2!7146 lt!238482)) (currentBit!6506 (_2!7146 lt!238482))))))

(declare-datatypes ((tuple2!13568 0))(
  ( (tuple2!13569 (_1!7165 Unit!9661) (_2!7165 BitStream!5404)) )
))
(declare-fun moveBitIndex!0 (BitStream!5404 (_ BitVec 64)) tuple2!13568)

(assert (=> d!50062 (= lt!239001 (_2!7165 (moveBitIndex!0 (_2!7146 lt!238482) (bvsub lt!238494 lt!238489))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5404 (_ BitVec 64)) Bool)

(assert (=> d!50062 (moveBitIndexPrecond!0 (_2!7146 lt!238482) (bvsub lt!238494 lt!238489))))

(assert (=> d!50062 (= (withMovedBitIndex!0 (_2!7146 lt!238482) (bvsub lt!238494 lt!238489)) lt!239001)))

(declare-fun b!152492 () Bool)

(assert (=> b!152492 (= e!101967 (= (size!3073 (buf!3570 (_2!7146 lt!238482))) (size!3073 (buf!3570 lt!239001))))))

(assert (= (and d!50062 res!127851) b!152492))

(declare-fun m!238351 () Bool)

(assert (=> d!50062 m!238351))

(assert (=> d!50062 m!238265))

(declare-fun m!238353 () Bool)

(assert (=> d!50062 m!238353))

(declare-fun m!238355 () Bool)

(assert (=> d!50062 m!238355))

(assert (=> b!152256 d!50062))

(assert (=> b!152256 d!49950))

(assert (=> d!49906 d!50032))

(assert (=> d!49908 d!49906))

(declare-fun d!50064 () Bool)

(assert (=> d!50064 (validate_offset_bits!1 ((_ sign_extend 32) (size!3073 (buf!3570 thiss!1634))) ((_ sign_extend 32) (currentByte!6511 thiss!1634)) ((_ sign_extend 32) (currentBit!6506 thiss!1634)) lt!238304)))

(assert (=> d!50064 true))

(declare-fun _$6!351 () Unit!9661)

(assert (=> d!50064 (= (choose!9 thiss!1634 (buf!3570 thiss!1634) lt!238304 (BitStream!5405 (buf!3570 thiss!1634) (currentByte!6511 thiss!1634) (currentBit!6506 thiss!1634))) _$6!351)))

(declare-fun bs!12238 () Bool)

(assert (= bs!12238 d!50064))

(assert (=> bs!12238 m!237875))

(assert (=> d!49908 d!50064))

(push 1)

(assert (not bm!2133))

(assert (not b!152472))

(assert (not b!152433))

(assert (not bm!2138))

(assert (not b!152477))

(assert (not d!50064))

(assert (not b!152436))

(assert (not b!152486))

(assert (not b!152479))

(assert (not b!152489))

(assert (not b!152468))

(assert (not d!50054))

(assert (not d!50036))

(assert (not d!50062))

(assert (not d!50034))

(assert (not b!152449))

(assert (not b!152432))

(assert (not b!152475))

(assert (not b!152430))

(assert (not b!152484))

(assert (not d!50050))

(assert (not b!152470))

(assert (not b!152435))

(assert (not b!152483))

(assert (not b!152451))

(assert (not d!50046))

(assert (not bm!2134))

(assert (not bm!2137))

(assert (not bm!2132))

(assert (not b!152453))

(assert (not b!152487))

(assert (not b!152452))

(assert (not b!152438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

