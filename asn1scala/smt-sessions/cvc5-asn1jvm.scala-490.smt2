; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14424 () Bool)

(assert start!14424)

(declare-fun b!74696 () Bool)

(declare-fun res!61753 () Bool)

(declare-fun e!48870 () Bool)

(assert (=> b!74696 (=> (not res!61753) (not e!48870))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!3055 0))(
  ( (array!3056 (arr!2021 (Array (_ BitVec 32) (_ BitVec 8))) (size!1427 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2428 0))(
  ( (BitStream!2429 (buf!1808 array!3055) (currentByte!3561 (_ BitVec 32)) (currentBit!3556 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2428)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74696 (= res!61753 (validate_offset_bits!1 ((_ sign_extend 32) (size!1427 (buf!1808 thiss!1379))) ((_ sign_extend 32) (currentByte!3561 thiss!1379)) ((_ sign_extend 32) (currentBit!3556 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74697 () Bool)

(declare-fun e!48869 () Bool)

(declare-fun array_inv!1273 (array!3055) Bool)

(assert (=> b!74697 (= e!48869 (array_inv!1273 (buf!1808 thiss!1379)))))

(declare-fun b!74698 () Bool)

(declare-fun e!48867 () Bool)

(declare-datatypes ((tuple2!6450 0))(
  ( (tuple2!6451 (_1!3342 BitStream!2428) (_2!3342 BitStream!2428)) )
))
(declare-fun lt!120113 () tuple2!6450)

(declare-datatypes ((tuple2!6452 0))(
  ( (tuple2!6453 (_1!3343 array!3055) (_2!3343 BitStream!2428)) )
))
(declare-fun lt!120112 () tuple2!6452)

(declare-fun inv!12 (BitStream!2428) Bool)

(assert (=> b!74698 (= e!48867 (inv!12 (BitStream!2429 (buf!1808 (_1!3342 lt!120113)) (currentByte!3561 (_1!3342 lt!120113)) (currentBit!3556 (_2!3343 lt!120112)))))))

(declare-fun srcBuffer!2 () array!3055)

(declare-fun checkByteArrayBitContent!0 (BitStream!2428 array!3055 array!3055 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74698 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3343 lt!120112) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!74699 () Bool)

(declare-fun res!61751 () Bool)

(declare-fun e!48872 () Bool)

(assert (=> b!74699 (=> res!61751 e!48872)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74699 (= res!61751 (not (invariant!0 (currentBit!3556 thiss!1379) (currentByte!3561 thiss!1379) (size!1427 (buf!1808 thiss!1379)))))))

(declare-fun res!61752 () Bool)

(assert (=> start!14424 (=> (not res!61752) (not e!48870))))

(assert (=> start!14424 (= res!61752 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1427 srcBuffer!2))))))))

(assert (=> start!14424 e!48870))

(assert (=> start!14424 true))

(assert (=> start!14424 (array_inv!1273 srcBuffer!2)))

(assert (=> start!14424 (and (inv!12 thiss!1379) e!48869)))

(declare-fun b!74700 () Bool)

(assert (=> b!74700 (= e!48870 (not e!48872))))

(declare-fun res!61754 () Bool)

(assert (=> b!74700 (=> res!61754 e!48872)))

(declare-fun lt!120115 () (_ BitVec 64))

(assert (=> b!74700 (= res!61754 (or (bvslt i!635 to!314) (not (= lt!120115 (bvsub (bvadd lt!120115 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2428 BitStream!2428) Bool)

(assert (=> b!74700 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4934 0))(
  ( (Unit!4935) )
))
(declare-fun lt!120114 () Unit!4934)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2428) Unit!4934)

(assert (=> b!74700 (= lt!120114 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74700 (= lt!120115 (bitIndex!0 (size!1427 (buf!1808 thiss!1379)) (currentByte!3561 thiss!1379) (currentBit!3556 thiss!1379)))))

(declare-fun b!74701 () Bool)

(assert (=> b!74701 (= e!48872 e!48867)))

(declare-fun res!61755 () Bool)

(assert (=> b!74701 (=> res!61755 e!48867)))

(assert (=> b!74701 (= res!61755 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2428 (_ BitVec 64)) tuple2!6452)

(assert (=> b!74701 (= lt!120112 (readBits!0 (_1!3342 lt!120113) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2428 BitStream!2428) tuple2!6450)

(assert (=> b!74701 (= lt!120113 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!14424 res!61752) b!74696))

(assert (= (and b!74696 res!61753) b!74700))

(assert (= (and b!74700 (not res!61754)) b!74699))

(assert (= (and b!74699 (not res!61751)) b!74701))

(assert (= (and b!74701 (not res!61755)) b!74698))

(assert (= start!14424 b!74697))

(declare-fun m!119689 () Bool)

(assert (=> b!74701 m!119689))

(declare-fun m!119691 () Bool)

(assert (=> b!74701 m!119691))

(declare-fun m!119693 () Bool)

(assert (=> b!74696 m!119693))

(declare-fun m!119695 () Bool)

(assert (=> b!74700 m!119695))

(declare-fun m!119697 () Bool)

(assert (=> b!74700 m!119697))

(declare-fun m!119699 () Bool)

(assert (=> b!74700 m!119699))

(declare-fun m!119701 () Bool)

(assert (=> b!74697 m!119701))

(declare-fun m!119703 () Bool)

(assert (=> start!14424 m!119703))

(declare-fun m!119705 () Bool)

(assert (=> start!14424 m!119705))

(declare-fun m!119707 () Bool)

(assert (=> b!74698 m!119707))

(declare-fun m!119709 () Bool)

(assert (=> b!74698 m!119709))

(declare-fun m!119711 () Bool)

(assert (=> b!74699 m!119711))

(push 1)

(assert (not b!74700))

(assert (not start!14424))

(assert (not b!74698))

(assert (not b!74696))

(assert (not b!74699))

(assert (not b!74701))

(assert (not b!74697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23720 () Bool)

(assert (=> d!23720 (= (array_inv!1273 srcBuffer!2) (bvsge (size!1427 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14424 d!23720))

(declare-fun d!23722 () Bool)

(assert (=> d!23722 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3556 thiss!1379) (currentByte!3561 thiss!1379) (size!1427 (buf!1808 thiss!1379))))))

(declare-fun bs!5712 () Bool)

(assert (= bs!5712 d!23722))

(assert (=> bs!5712 m!119711))

(assert (=> start!14424 d!23722))

(declare-fun d!23724 () Bool)

(assert (=> d!23724 (= (array_inv!1273 (buf!1808 thiss!1379)) (bvsge (size!1427 (buf!1808 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74697 d!23724))

(declare-fun b!74757 () Bool)

(declare-fun res!61808 () Bool)

(declare-fun e!48917 () Bool)

(assert (=> b!74757 (=> (not res!61808) (not e!48917))))

(declare-fun lt!120169 () tuple2!6452)

(assert (=> b!74757 (= res!61808 (invariant!0 (currentBit!3556 (_2!3343 lt!120169)) (currentByte!3561 (_2!3343 lt!120169)) (size!1427 (buf!1808 (_2!3343 lt!120169)))))))

(declare-fun b!74758 () Bool)

(declare-fun res!61806 () Bool)

(assert (=> b!74758 (=> (not res!61806) (not e!48917))))

(declare-fun lt!120162 () (_ BitVec 64))

(assert (=> b!74758 (= res!61806 (= (bvadd lt!120162 (bvsub to!314 i!635)) (bitIndex!0 (size!1427 (buf!1808 (_2!3343 lt!120169))) (currentByte!3561 (_2!3343 lt!120169)) (currentBit!3556 (_2!3343 lt!120169)))))))

(assert (=> b!74758 (or (not (= (bvand lt!120162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120162 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74758 (= lt!120162 (bitIndex!0 (size!1427 (buf!1808 (_1!3342 lt!120113))) (currentByte!3561 (_1!3342 lt!120113)) (currentBit!3556 (_1!3342 lt!120113))))))

(declare-fun b!74759 () Bool)

(declare-fun res!61805 () Bool)

(assert (=> b!74759 (=> (not res!61805) (not e!48917))))

(declare-fun lt!120166 () (_ BitVec 64))

(assert (=> b!74759 (= res!61805 (= (size!1427 (_1!3343 lt!120169)) ((_ extract 31 0) lt!120166)))))

(assert (=> b!74759 (and (bvslt lt!120166 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!120166 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!120167 () (_ BitVec 64))

(declare-fun lt!120165 () (_ BitVec 64))

(assert (=> b!74759 (= lt!120166 (bvsdiv lt!120167 lt!120165))))

(assert (=> b!74759 (and (not (= lt!120165 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!120167 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!120165 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!74759 (= lt!120165 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!120161 () (_ BitVec 64))

(declare-fun lt!120168 () (_ BitVec 64))

(assert (=> b!74759 (= lt!120167 (bvsub lt!120161 lt!120168))))

(assert (=> b!74759 (or (= (bvand lt!120161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120161 lt!120168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74759 (= lt!120168 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!120163 () (_ BitVec 64))

(assert (=> b!74759 (= lt!120161 (bvadd (bvsub to!314 i!635) lt!120163))))

(assert (=> b!74759 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120163 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!120163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74759 (= lt!120163 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!74760 () Bool)

(declare-fun res!61807 () Bool)

(assert (=> b!74760 (=> (not res!61807) (not e!48917))))

(assert (=> b!74760 (= res!61807 (bvsle (currentByte!3561 (_1!3342 lt!120113)) (currentByte!3561 (_2!3343 lt!120169))))))

(declare-fun d!23726 () Bool)

(assert (=> d!23726 e!48917))

(declare-fun res!61809 () Bool)

(assert (=> d!23726 (=> (not res!61809) (not e!48917))))

(assert (=> d!23726 (= res!61809 (= (buf!1808 (_2!3343 lt!120169)) (buf!1808 (_1!3342 lt!120113))))))

(declare-datatypes ((tuple3!196 0))(
  ( (tuple3!197 (_1!3348 Unit!4934) (_2!3348 BitStream!2428) (_3!117 array!3055)) )
))
(declare-fun lt!120164 () tuple3!196)

(assert (=> d!23726 (= lt!120169 (tuple2!6453 (_3!117 lt!120164) (_2!3348 lt!120164)))))

(declare-fun readBitsLoop!0 (BitStream!2428 (_ BitVec 64) array!3055 (_ BitVec 64) (_ BitVec 64)) tuple3!196)

(assert (=> d!23726 (= lt!120164 (readBitsLoop!0 (_1!3342 lt!120113) (bvsub to!314 i!635) (array!3056 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23726 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23726 (= (readBits!0 (_1!3342 lt!120113) (bvsub to!314 i!635)) lt!120169)))

(declare-fun b!74761 () Bool)

(declare-datatypes ((List!771 0))(
  ( (Nil!768) (Cons!767 (h!886 Bool) (t!1521 List!771)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2428 array!3055 (_ BitVec 64) (_ BitVec 64)) List!771)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2428 BitStream!2428 (_ BitVec 64)) List!771)

(assert (=> b!74761 (= e!48917 (= (byteArrayBitContentToList!0 (_2!3343 lt!120169) (_1!3343 lt!120169) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3343 lt!120169) (_1!3342 lt!120113) (bvsub to!314 i!635))))))

(assert (= (and d!23726 res!61809) b!74758))

(assert (= (and b!74758 res!61806) b!74757))

(assert (= (and b!74757 res!61808) b!74759))

(assert (= (and b!74759 res!61805) b!74760))

(assert (= (and b!74760 res!61807) b!74761))

(declare-fun m!119765 () Bool)

(assert (=> b!74757 m!119765))

(declare-fun m!119767 () Bool)

(assert (=> b!74758 m!119767))

(declare-fun m!119769 () Bool)

(assert (=> b!74758 m!119769))

(declare-fun m!119771 () Bool)

(assert (=> d!23726 m!119771))

(declare-fun m!119773 () Bool)

(assert (=> b!74761 m!119773))

(declare-fun m!119775 () Bool)

(assert (=> b!74761 m!119775))

(assert (=> b!74701 d!23726))

(declare-fun b!74784 () Bool)

(declare-fun res!61828 () Bool)

(declare-fun e!48932 () Bool)

(assert (=> b!74784 (=> (not res!61828) (not e!48932))))

(declare-fun lt!120242 () tuple2!6450)

(assert (=> b!74784 (= res!61828 (isPrefixOf!0 (_1!3342 lt!120242) thiss!1379))))

(declare-fun b!74785 () Bool)

(declare-fun e!48931 () Unit!4934)

(declare-fun Unit!4940 () Unit!4934)

(assert (=> b!74785 (= e!48931 Unit!4940)))

(declare-fun d!23736 () Bool)

(assert (=> d!23736 e!48932))

(declare-fun res!61829 () Bool)

(assert (=> d!23736 (=> (not res!61829) (not e!48932))))

(assert (=> d!23736 (= res!61829 (isPrefixOf!0 (_1!3342 lt!120242) (_2!3342 lt!120242)))))

(declare-fun lt!120233 () BitStream!2428)

(assert (=> d!23736 (= lt!120242 (tuple2!6451 lt!120233 thiss!1379))))

(declare-fun lt!120243 () Unit!4934)

(declare-fun lt!120231 () Unit!4934)

(assert (=> d!23736 (= lt!120243 lt!120231)))

(assert (=> d!23736 (isPrefixOf!0 lt!120233 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2428 BitStream!2428 BitStream!2428) Unit!4934)

(assert (=> d!23736 (= lt!120231 (lemmaIsPrefixTransitive!0 lt!120233 thiss!1379 thiss!1379))))

(declare-fun lt!120246 () Unit!4934)

(declare-fun lt!120240 () Unit!4934)

(assert (=> d!23736 (= lt!120246 lt!120240)))

(assert (=> d!23736 (isPrefixOf!0 lt!120233 thiss!1379)))

(assert (=> d!23736 (= lt!120240 (lemmaIsPrefixTransitive!0 lt!120233 thiss!1379 thiss!1379))))

(declare-fun lt!120241 () Unit!4934)

(assert (=> d!23736 (= lt!120241 e!48931)))

(declare-fun c!5475 () Bool)

(assert (=> d!23736 (= c!5475 (not (= (size!1427 (buf!1808 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!120239 () Unit!4934)

(declare-fun lt!120230 () Unit!4934)

(assert (=> d!23736 (= lt!120239 lt!120230)))

(assert (=> d!23736 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23736 (= lt!120230 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120235 () Unit!4934)

(declare-fun lt!120237 () Unit!4934)

(assert (=> d!23736 (= lt!120235 lt!120237)))

(assert (=> d!23736 (= lt!120237 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120232 () Unit!4934)

(declare-fun lt!120238 () Unit!4934)

(assert (=> d!23736 (= lt!120232 lt!120238)))

(assert (=> d!23736 (isPrefixOf!0 lt!120233 lt!120233)))

(assert (=> d!23736 (= lt!120238 (lemmaIsPrefixRefl!0 lt!120233))))

(declare-fun lt!120247 () Unit!4934)

(declare-fun lt!120245 () Unit!4934)

(assert (=> d!23736 (= lt!120247 lt!120245)))

(assert (=> d!23736 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23736 (= lt!120245 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23736 (= lt!120233 (BitStream!2429 (buf!1808 thiss!1379) (currentByte!3561 thiss!1379) (currentBit!3556 thiss!1379)))))

(assert (=> d!23736 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23736 (= (reader!0 thiss!1379 thiss!1379) lt!120242)))

(declare-fun b!74786 () Bool)

(declare-fun lt!120228 () (_ BitVec 64))

(declare-fun lt!120234 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2428 (_ BitVec 64)) BitStream!2428)

(assert (=> b!74786 (= e!48932 (= (_1!3342 lt!120242) (withMovedBitIndex!0 (_2!3342 lt!120242) (bvsub lt!120234 lt!120228))))))

(assert (=> b!74786 (or (= (bvand lt!120234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120234 lt!120228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74786 (= lt!120228 (bitIndex!0 (size!1427 (buf!1808 thiss!1379)) (currentByte!3561 thiss!1379) (currentBit!3556 thiss!1379)))))

(assert (=> b!74786 (= lt!120234 (bitIndex!0 (size!1427 (buf!1808 thiss!1379)) (currentByte!3561 thiss!1379) (currentBit!3556 thiss!1379)))))

(declare-fun b!74787 () Bool)

(declare-fun lt!120236 () Unit!4934)

(assert (=> b!74787 (= e!48931 lt!120236)))

(declare-fun lt!120244 () (_ BitVec 64))

(assert (=> b!74787 (= lt!120244 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120229 () (_ BitVec 64))

(assert (=> b!74787 (= lt!120229 (bitIndex!0 (size!1427 (buf!1808 thiss!1379)) (currentByte!3561 thiss!1379) (currentBit!3556 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3055 array!3055 (_ BitVec 64) (_ BitVec 64)) Unit!4934)

(assert (=> b!74787 (= lt!120236 (arrayBitRangesEqSymmetric!0 (buf!1808 thiss!1379) (buf!1808 thiss!1379) lt!120244 lt!120229))))

(declare-fun arrayBitRangesEq!0 (array!3055 array!3055 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74787 (arrayBitRangesEq!0 (buf!1808 thiss!1379) (buf!1808 thiss!1379) lt!120244 lt!120229)))

(declare-fun b!74788 () Bool)

(declare-fun res!61830 () Bool)

(assert (=> b!74788 (=> (not res!61830) (not e!48932))))

(assert (=> b!74788 (= res!61830 (isPrefixOf!0 (_2!3342 lt!120242) thiss!1379))))

(assert (= (and d!23736 c!5475) b!74787))

(assert (= (and d!23736 (not c!5475)) b!74785))

(assert (= (and d!23736 res!61829) b!74784))

(assert (= (and b!74784 res!61828) b!74788))

(assert (= (and b!74788 res!61830) b!74786))

(declare-fun m!119791 () Bool)

(assert (=> b!74786 m!119791))

(assert (=> b!74786 m!119699))

(assert (=> b!74786 m!119699))

(assert (=> d!23736 m!119697))

(declare-fun m!119793 () Bool)

(assert (=> d!23736 m!119793))

(declare-fun m!119795 () Bool)

(assert (=> d!23736 m!119795))

(assert (=> d!23736 m!119695))

(declare-fun m!119797 () Bool)

(assert (=> d!23736 m!119797))

(declare-fun m!119799 () Bool)

(assert (=> d!23736 m!119799))

(declare-fun m!119801 () Bool)

(assert (=> d!23736 m!119801))

(assert (=> d!23736 m!119793))

(assert (=> d!23736 m!119695))

(assert (=> d!23736 m!119695))

(assert (=> d!23736 m!119697))

(declare-fun m!119803 () Bool)

(assert (=> b!74784 m!119803))

(assert (=> b!74787 m!119699))

(declare-fun m!119805 () Bool)

(assert (=> b!74787 m!119805))

(declare-fun m!119807 () Bool)

(assert (=> b!74787 m!119807))

(declare-fun m!119809 () Bool)

(assert (=> b!74788 m!119809))

(assert (=> b!74701 d!23736))

(declare-fun d!23744 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23744 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1427 (buf!1808 thiss!1379))) ((_ sign_extend 32) (currentByte!3561 thiss!1379)) ((_ sign_extend 32) (currentBit!3556 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1427 (buf!1808 thiss!1379))) ((_ sign_extend 32) (currentByte!3561 thiss!1379)) ((_ sign_extend 32) (currentBit!3556 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5716 () Bool)

(assert (= bs!5716 d!23744))

(declare-fun m!119811 () Bool)

(assert (=> bs!5716 m!119811))

(assert (=> b!74696 d!23744))

(declare-fun d!23746 () Bool)

(assert (=> d!23746 (= (invariant!0 (currentBit!3556 thiss!1379) (currentByte!3561 thiss!1379) (size!1427 (buf!1808 thiss!1379))) (and (bvsge (currentBit!3556 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3556 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3561 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3561 thiss!1379) (size!1427 (buf!1808 thiss!1379))) (and (= (currentBit!3556 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3561 thiss!1379) (size!1427 (buf!1808 thiss!1379)))))))))

(assert (=> b!74699 d!23746))

(declare-fun d!23748 () Bool)

(declare-fun res!61839 () Bool)

(declare-fun e!48938 () Bool)

(assert (=> d!23748 (=> (not res!61839) (not e!48938))))

(assert (=> d!23748 (= res!61839 (= (size!1427 (buf!1808 thiss!1379)) (size!1427 (buf!1808 thiss!1379))))))

(assert (=> d!23748 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48938)))

(declare-fun b!74795 () Bool)

(declare-fun res!61838 () Bool)

(assert (=> b!74795 (=> (not res!61838) (not e!48938))))

(assert (=> b!74795 (= res!61838 (bvsle (bitIndex!0 (size!1427 (buf!1808 thiss!1379)) (currentByte!3561 thiss!1379) (currentBit!3556 thiss!1379)) (bitIndex!0 (size!1427 (buf!1808 thiss!1379)) (currentByte!3561 thiss!1379) (currentBit!3556 thiss!1379))))))

(declare-fun b!74796 () Bool)

(declare-fun e!48937 () Bool)

(assert (=> b!74796 (= e!48938 e!48937)))

(declare-fun res!61837 () Bool)

(assert (=> b!74796 (=> res!61837 e!48937)))

(assert (=> b!74796 (= res!61837 (= (size!1427 (buf!1808 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74797 () Bool)

(assert (=> b!74797 (= e!48937 (arrayBitRangesEq!0 (buf!1808 thiss!1379) (buf!1808 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1427 (buf!1808 thiss!1379)) (currentByte!3561 thiss!1379) (currentBit!3556 thiss!1379))))))

(assert (= (and d!23748 res!61839) b!74795))

(assert (= (and b!74795 res!61838) b!74796))

(assert (= (and b!74796 (not res!61837)) b!74797))

(assert (=> b!74795 m!119699))

(assert (=> b!74795 m!119699))

(assert (=> b!74797 m!119699))

(assert (=> b!74797 m!119699))

(declare-fun m!119813 () Bool)

(assert (=> b!74797 m!119813))

(assert (=> b!74700 d!23748))

(declare-fun d!23750 () Bool)

(assert (=> d!23750 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!120250 () Unit!4934)

(declare-fun choose!11 (BitStream!2428) Unit!4934)

(assert (=> d!23750 (= lt!120250 (choose!11 thiss!1379))))

(assert (=> d!23750 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!120250)))

(declare-fun bs!5718 () Bool)

(assert (= bs!5718 d!23750))

(assert (=> bs!5718 m!119695))

(declare-fun m!119815 () Bool)

(assert (=> bs!5718 m!119815))

(assert (=> b!74700 d!23750))

(declare-fun d!23752 () Bool)

(declare-fun e!48941 () Bool)

(assert (=> d!23752 e!48941))

(declare-fun res!61844 () Bool)

(assert (=> d!23752 (=> (not res!61844) (not e!48941))))

(declare-fun lt!120268 () (_ BitVec 64))

(declare-fun lt!120263 () (_ BitVec 64))

(declare-fun lt!120267 () (_ BitVec 64))

(assert (=> d!23752 (= res!61844 (= lt!120263 (bvsub lt!120268 lt!120267)))))

(assert (=> d!23752 (or (= (bvand lt!120268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120267 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120268 lt!120267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23752 (= lt!120267 (remainingBits!0 ((_ sign_extend 32) (size!1427 (buf!1808 thiss!1379))) ((_ sign_extend 32) (currentByte!3561 thiss!1379)) ((_ sign_extend 32) (currentBit!3556 thiss!1379))))))

(declare-fun lt!120265 () (_ BitVec 64))

(declare-fun lt!120266 () (_ BitVec 64))

(assert (=> d!23752 (= lt!120268 (bvmul lt!120265 lt!120266))))

(assert (=> d!23752 (or (= lt!120265 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!120266 (bvsdiv (bvmul lt!120265 lt!120266) lt!120265)))))

(assert (=> d!23752 (= lt!120266 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23752 (= lt!120265 ((_ sign_extend 32) (size!1427 (buf!1808 thiss!1379))))))

(assert (=> d!23752 (= lt!120263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3561 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3556 thiss!1379))))))

(assert (=> d!23752 (invariant!0 (currentBit!3556 thiss!1379) (currentByte!3561 thiss!1379) (size!1427 (buf!1808 thiss!1379)))))

(assert (=> d!23752 (= (bitIndex!0 (size!1427 (buf!1808 thiss!1379)) (currentByte!3561 thiss!1379) (currentBit!3556 thiss!1379)) lt!120263)))

(declare-fun b!74802 () Bool)

(declare-fun res!61845 () Bool)

(assert (=> b!74802 (=> (not res!61845) (not e!48941))))

(assert (=> b!74802 (= res!61845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120263))))

(declare-fun b!74803 () Bool)

(declare-fun lt!120264 () (_ BitVec 64))

(assert (=> b!74803 (= e!48941 (bvsle lt!120263 (bvmul lt!120264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74803 (or (= lt!120264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!120264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!120264)))))

(assert (=> b!74803 (= lt!120264 ((_ sign_extend 32) (size!1427 (buf!1808 thiss!1379))))))

(assert (= (and d!23752 res!61844) b!74802))

(assert (= (and b!74802 res!61845) b!74803))

(assert (=> d!23752 m!119811))

(assert (=> d!23752 m!119711))

(assert (=> b!74700 d!23752))

(declare-fun d!23754 () Bool)

(assert (=> d!23754 (= (inv!12 (BitStream!2429 (buf!1808 (_1!3342 lt!120113)) (currentByte!3561 (_1!3342 lt!120113)) (currentBit!3556 (_2!3343 lt!120112)))) (invariant!0 (currentBit!3556 (BitStream!2429 (buf!1808 (_1!3342 lt!120113)) (currentByte!3561 (_1!3342 lt!120113)) (currentBit!3556 (_2!3343 lt!120112)))) (currentByte!3561 (BitStream!2429 (buf!1808 (_1!3342 lt!120113)) (currentByte!3561 (_1!3342 lt!120113)) (currentBit!3556 (_2!3343 lt!120112)))) (size!1427 (buf!1808 (BitStream!2429 (buf!1808 (_1!3342 lt!120113)) (currentByte!3561 (_1!3342 lt!120113)) (currentBit!3556 (_2!3343 lt!120112)))))))))

(declare-fun bs!5719 () Bool)

(assert (= bs!5719 d!23754))

(declare-fun m!119817 () Bool)

(assert (=> bs!5719 m!119817))

(assert (=> b!74698 d!23754))

(declare-fun d!23756 () Bool)

(declare-fun res!61865 () Bool)

(declare-fun e!48949 () Bool)

(assert (=> d!23756 (=> res!61865 e!48949)))

(assert (=> d!23756 (= res!61865 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23756 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3343 lt!120112) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!48949)))

(declare-fun b!74823 () Bool)

(declare-fun e!48950 () Bool)

(assert (=> b!74823 (= e!48949 e!48950)))

(declare-fun res!61866 () Bool)

(assert (=> b!74823 (=> (not res!61866) (not e!48950))))

(assert (=> b!74823 (= res!61866 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2021 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2021 (_1!3343 lt!120112)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!74824 () Bool)

(assert (=> b!74824 (= e!48950 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3343 lt!120112) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23756 (not res!61865)) b!74823))

(assert (= (and b!74823 res!61866) b!74824))

(declare-fun m!119819 () Bool)

(assert (=> b!74823 m!119819))

(declare-fun m!119821 () Bool)

(assert (=> b!74823 m!119821))

(declare-fun m!119823 () Bool)

(assert (=> b!74823 m!119823))

(declare-fun m!119825 () Bool)

(assert (=> b!74823 m!119825))

(declare-fun m!119827 () Bool)

(assert (=> b!74824 m!119827))

(assert (=> b!74698 d!23756))

(push 1)

(assert (not b!74784))

(assert (not d!23752))

(assert (not d!23726))

(assert (not d!23736))

(assert (not b!74757))

(assert (not b!74797))

(assert (not d!23750))

(assert (not d!23744))

(assert (not b!74786))

(assert (not b!74788))

(assert (not b!74761))

(assert (not b!74758))

(assert (not d!23722))

(assert (not b!74824))

(assert (not b!74795))

(assert (not b!74787))

(assert (not d!23754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

