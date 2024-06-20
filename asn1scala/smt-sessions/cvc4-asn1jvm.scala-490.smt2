; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14428 () Bool)

(assert start!14428)

(declare-fun b!74732 () Bool)

(declare-fun e!48905 () Bool)

(declare-fun e!48907 () Bool)

(assert (=> b!74732 (= e!48905 e!48907)))

(declare-fun res!61783 () Bool)

(assert (=> b!74732 (=> res!61783 e!48907)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!74732 (= res!61783 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!3059 0))(
  ( (array!3060 (arr!2023 (Array (_ BitVec 32) (_ BitVec 8))) (size!1429 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2432 0))(
  ( (BitStream!2433 (buf!1810 array!3059) (currentByte!3563 (_ BitVec 32)) (currentBit!3558 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6458 0))(
  ( (tuple2!6459 (_1!3346 BitStream!2432) (_2!3346 BitStream!2432)) )
))
(declare-fun lt!120138 () tuple2!6458)

(declare-datatypes ((tuple2!6460 0))(
  ( (tuple2!6461 (_1!3347 array!3059) (_2!3347 BitStream!2432)) )
))
(declare-fun lt!120137 () tuple2!6460)

(declare-fun readBits!0 (BitStream!2432 (_ BitVec 64)) tuple2!6460)

(assert (=> b!74732 (= lt!120137 (readBits!0 (_1!3346 lt!120138) (bvsub to!314 i!635)))))

(declare-fun thiss!1379 () BitStream!2432)

(declare-fun reader!0 (BitStream!2432 BitStream!2432) tuple2!6458)

(assert (=> b!74732 (= lt!120138 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!74733 () Bool)

(declare-fun e!48904 () Bool)

(declare-fun array_inv!1275 (array!3059) Bool)

(assert (=> b!74733 (= e!48904 (array_inv!1275 (buf!1810 thiss!1379)))))

(declare-fun res!61785 () Bool)

(declare-fun e!48903 () Bool)

(assert (=> start!14428 (=> (not res!61785) (not e!48903))))

(declare-fun srcBuffer!2 () array!3059)

(assert (=> start!14428 (= res!61785 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1429 srcBuffer!2))))))))

(assert (=> start!14428 e!48903))

(assert (=> start!14428 true))

(assert (=> start!14428 (array_inv!1275 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2432) Bool)

(assert (=> start!14428 (and (inv!12 thiss!1379) e!48904)))

(declare-fun b!74734 () Bool)

(assert (=> b!74734 (= e!48903 (not e!48905))))

(declare-fun res!61781 () Bool)

(assert (=> b!74734 (=> res!61781 e!48905)))

(declare-fun lt!120136 () (_ BitVec 64))

(assert (=> b!74734 (= res!61781 (or (bvslt i!635 to!314) (not (= lt!120136 (bvsub (bvadd lt!120136 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2432 BitStream!2432) Bool)

(assert (=> b!74734 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4938 0))(
  ( (Unit!4939) )
))
(declare-fun lt!120139 () Unit!4938)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2432) Unit!4938)

(assert (=> b!74734 (= lt!120139 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74734 (= lt!120136 (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379)))))

(declare-fun b!74735 () Bool)

(declare-fun res!61782 () Bool)

(assert (=> b!74735 (=> res!61782 e!48905)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74735 (= res!61782 (not (invariant!0 (currentBit!3558 thiss!1379) (currentByte!3563 thiss!1379) (size!1429 (buf!1810 thiss!1379)))))))

(declare-fun b!74736 () Bool)

(declare-fun res!61784 () Bool)

(assert (=> b!74736 (=> (not res!61784) (not e!48903))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74736 (= res!61784 (validate_offset_bits!1 ((_ sign_extend 32) (size!1429 (buf!1810 thiss!1379))) ((_ sign_extend 32) (currentByte!3563 thiss!1379)) ((_ sign_extend 32) (currentBit!3558 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74737 () Bool)

(assert (=> b!74737 (= e!48907 (inv!12 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))))))

(declare-fun checkByteArrayBitContent!0 (BitStream!2432 array!3059 array!3059 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74737 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3347 lt!120137) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!14428 res!61785) b!74736))

(assert (= (and b!74736 res!61784) b!74734))

(assert (= (and b!74734 (not res!61781)) b!74735))

(assert (= (and b!74735 (not res!61782)) b!74732))

(assert (= (and b!74732 (not res!61783)) b!74737))

(assert (= start!14428 b!74733))

(declare-fun m!119737 () Bool)

(assert (=> b!74735 m!119737))

(declare-fun m!119739 () Bool)

(assert (=> b!74734 m!119739))

(declare-fun m!119741 () Bool)

(assert (=> b!74734 m!119741))

(declare-fun m!119743 () Bool)

(assert (=> b!74734 m!119743))

(declare-fun m!119745 () Bool)

(assert (=> b!74737 m!119745))

(declare-fun m!119747 () Bool)

(assert (=> b!74737 m!119747))

(declare-fun m!119749 () Bool)

(assert (=> b!74732 m!119749))

(declare-fun m!119751 () Bool)

(assert (=> b!74732 m!119751))

(declare-fun m!119753 () Bool)

(assert (=> start!14428 m!119753))

(declare-fun m!119755 () Bool)

(assert (=> start!14428 m!119755))

(declare-fun m!119757 () Bool)

(assert (=> b!74733 m!119757))

(declare-fun m!119759 () Bool)

(assert (=> b!74736 m!119759))

(push 1)

(assert (not b!74735))

(assert (not b!74733))

(assert (not b!74732))

(assert (not start!14428))

(assert (not b!74734))

(assert (not b!74737))

(assert (not b!74736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23728 () Bool)

(assert (=> d!23728 (= (array_inv!1275 (buf!1810 thiss!1379)) (bvsge (size!1429 (buf!1810 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74733 d!23728))

(declare-fun d!23730 () Bool)

(declare-fun res!61792 () Bool)

(declare-fun e!48913 () Bool)

(assert (=> d!23730 (=> (not res!61792) (not e!48913))))

(assert (=> d!23730 (= res!61792 (= (size!1429 (buf!1810 thiss!1379)) (size!1429 (buf!1810 thiss!1379))))))

(assert (=> d!23730 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48913)))

(declare-fun b!74744 () Bool)

(declare-fun res!61793 () Bool)

(assert (=> b!74744 (=> (not res!61793) (not e!48913))))

(assert (=> b!74744 (= res!61793 (bvsle (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379)) (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379))))))

(declare-fun b!74745 () Bool)

(declare-fun e!48914 () Bool)

(assert (=> b!74745 (= e!48913 e!48914)))

(declare-fun res!61794 () Bool)

(assert (=> b!74745 (=> res!61794 e!48914)))

(assert (=> b!74745 (= res!61794 (= (size!1429 (buf!1810 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74746 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3059 array!3059 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74746 (= e!48914 (arrayBitRangesEq!0 (buf!1810 thiss!1379) (buf!1810 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379))))))

(assert (= (and d!23730 res!61792) b!74744))

(assert (= (and b!74744 res!61793) b!74745))

(assert (= (and b!74745 (not res!61794)) b!74746))

(assert (=> b!74744 m!119743))

(assert (=> b!74744 m!119743))

(assert (=> b!74746 m!119743))

(assert (=> b!74746 m!119743))

(declare-fun m!119761 () Bool)

(assert (=> b!74746 m!119761))

(assert (=> b!74734 d!23730))

(declare-fun d!23732 () Bool)

(assert (=> d!23732 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!120142 () Unit!4938)

(declare-fun choose!11 (BitStream!2432) Unit!4938)

(assert (=> d!23732 (= lt!120142 (choose!11 thiss!1379))))

(assert (=> d!23732 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!120142)))

(declare-fun bs!5714 () Bool)

(assert (= bs!5714 d!23732))

(assert (=> bs!5714 m!119739))

(declare-fun m!119763 () Bool)

(assert (=> bs!5714 m!119763))

(assert (=> b!74734 d!23732))

(declare-fun d!23734 () Bool)

(declare-fun e!48920 () Bool)

(assert (=> d!23734 e!48920))

(declare-fun res!61814 () Bool)

(assert (=> d!23734 (=> (not res!61814) (not e!48920))))

(declare-fun lt!120184 () (_ BitVec 64))

(declare-fun lt!120185 () (_ BitVec 64))

(declare-fun lt!120183 () (_ BitVec 64))

(assert (=> d!23734 (= res!61814 (= lt!120185 (bvsub lt!120183 lt!120184)))))

(assert (=> d!23734 (or (= (bvand lt!120183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120184 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120183 lt!120184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23734 (= lt!120184 (remainingBits!0 ((_ sign_extend 32) (size!1429 (buf!1810 thiss!1379))) ((_ sign_extend 32) (currentByte!3563 thiss!1379)) ((_ sign_extend 32) (currentBit!3558 thiss!1379))))))

(declare-fun lt!120186 () (_ BitVec 64))

(declare-fun lt!120187 () (_ BitVec 64))

(assert (=> d!23734 (= lt!120183 (bvmul lt!120186 lt!120187))))

(assert (=> d!23734 (or (= lt!120186 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!120187 (bvsdiv (bvmul lt!120186 lt!120187) lt!120186)))))

(assert (=> d!23734 (= lt!120187 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23734 (= lt!120186 ((_ sign_extend 32) (size!1429 (buf!1810 thiss!1379))))))

(assert (=> d!23734 (= lt!120185 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3563 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3558 thiss!1379))))))

(assert (=> d!23734 (invariant!0 (currentBit!3558 thiss!1379) (currentByte!3563 thiss!1379) (size!1429 (buf!1810 thiss!1379)))))

(assert (=> d!23734 (= (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379)) lt!120185)))

(declare-fun b!74766 () Bool)

(declare-fun res!61815 () Bool)

(assert (=> b!74766 (=> (not res!61815) (not e!48920))))

(assert (=> b!74766 (= res!61815 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120185))))

(declare-fun b!74767 () Bool)

(declare-fun lt!120182 () (_ BitVec 64))

(assert (=> b!74767 (= e!48920 (bvsle lt!120185 (bvmul lt!120182 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74767 (or (= lt!120182 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!120182 #b0000000000000000000000000000000000000000000000000000000000001000) lt!120182)))))

(assert (=> b!74767 (= lt!120182 ((_ sign_extend 32) (size!1429 (buf!1810 thiss!1379))))))

(assert (= (and d!23734 res!61814) b!74766))

(assert (= (and b!74766 res!61815) b!74767))

(declare-fun m!119777 () Bool)

(assert (=> d!23734 m!119777))

(assert (=> d!23734 m!119737))

(assert (=> b!74734 d!23734))

(declare-fun d!23738 () Bool)

(assert (=> d!23738 (= (inv!12 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) (invariant!0 (currentBit!3558 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) (currentByte!3563 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) (size!1429 (buf!1810 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))))))))

(declare-fun bs!5715 () Bool)

(assert (= bs!5715 d!23738))

(declare-fun m!119779 () Bool)

(assert (=> bs!5715 m!119779))

(assert (=> b!74737 d!23738))

(declare-fun d!23740 () Bool)

(declare-fun res!61820 () Bool)

(declare-fun e!48925 () Bool)

(assert (=> d!23740 (=> res!61820 e!48925)))

(assert (=> d!23740 (= res!61820 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23740 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3347 lt!120137) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!48925)))

(declare-fun b!74772 () Bool)

(declare-fun e!48926 () Bool)

(assert (=> b!74772 (= e!48925 e!48926)))

(declare-fun res!61821 () Bool)

(assert (=> b!74772 (=> (not res!61821) (not e!48926))))

(assert (=> b!74772 (= res!61821 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2023 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2023 (_1!3347 lt!120137)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!74773 () Bool)

(assert (=> b!74773 (= e!48926 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3347 lt!120137) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23740 (not res!61820)) b!74772))

(assert (= (and b!74772 res!61821) b!74773))

(declare-fun m!119781 () Bool)

(assert (=> b!74772 m!119781))

(declare-fun m!119783 () Bool)

(assert (=> b!74772 m!119783))

(declare-fun m!119785 () Bool)

(assert (=> b!74772 m!119785))

(declare-fun m!119787 () Bool)

(assert (=> b!74772 m!119787))

(declare-fun m!119789 () Bool)

(assert (=> b!74773 m!119789))

(assert (=> b!74737 d!23740))

(declare-fun d!23742 () Bool)

(declare-fun e!48948 () Bool)

(assert (=> d!23742 e!48948))

(declare-fun res!61860 () Bool)

(assert (=> d!23742 (=> (not res!61860) (not e!48948))))

(declare-fun lt!120289 () tuple2!6460)

(assert (=> d!23742 (= res!61860 (= (buf!1810 (_2!3347 lt!120289)) (buf!1810 (_1!3346 lt!120138))))))

(declare-datatypes ((tuple3!198 0))(
  ( (tuple3!199 (_1!3349 Unit!4938) (_2!3349 BitStream!2432) (_3!118 array!3059)) )
))
(declare-fun lt!120288 () tuple3!198)

(assert (=> d!23742 (= lt!120289 (tuple2!6461 (_3!118 lt!120288) (_2!3349 lt!120288)))))

(declare-fun readBitsLoop!0 (BitStream!2432 (_ BitVec 64) array!3059 (_ BitVec 64) (_ BitVec 64)) tuple3!198)

(assert (=> d!23742 (= lt!120288 (readBitsLoop!0 (_1!3346 lt!120138) (bvsub to!314 i!635) (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23742 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23742 (= (readBits!0 (_1!3346 lt!120138) (bvsub to!314 i!635)) lt!120289)))

(declare-fun b!74818 () Bool)

(declare-fun res!61862 () Bool)

(assert (=> b!74818 (=> (not res!61862) (not e!48948))))

(assert (=> b!74818 (= res!61862 (bvsle (currentByte!3563 (_1!3346 lt!120138)) (currentByte!3563 (_2!3347 lt!120289))))))

(declare-fun b!74819 () Bool)

(declare-fun res!61863 () Bool)

(assert (=> b!74819 (=> (not res!61863) (not e!48948))))

(declare-fun lt!120293 () (_ BitVec 64))

(assert (=> b!74819 (= res!61863 (= (bvadd lt!120293 (bvsub to!314 i!635)) (bitIndex!0 (size!1429 (buf!1810 (_2!3347 lt!120289))) (currentByte!3563 (_2!3347 lt!120289)) (currentBit!3558 (_2!3347 lt!120289)))))))

(assert (=> b!74819 (or (not (= (bvand lt!120293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120293 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74819 (= lt!120293 (bitIndex!0 (size!1429 (buf!1810 (_1!3346 lt!120138))) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_1!3346 lt!120138))))))

(declare-fun b!74820 () Bool)

(declare-datatypes ((List!772 0))(
  ( (Nil!769) (Cons!768 (h!887 Bool) (t!1522 List!772)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2432 array!3059 (_ BitVec 64) (_ BitVec 64)) List!772)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2432 BitStream!2432 (_ BitVec 64)) List!772)

(assert (=> b!74820 (= e!48948 (= (byteArrayBitContentToList!0 (_2!3347 lt!120289) (_1!3347 lt!120289) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3347 lt!120289) (_1!3346 lt!120138) (bvsub to!314 i!635))))))

(declare-fun b!74821 () Bool)

(declare-fun res!61864 () Bool)

(assert (=> b!74821 (=> (not res!61864) (not e!48948))))

(declare-fun lt!120291 () (_ BitVec 64))

(assert (=> b!74821 (= res!61864 (= (size!1429 (_1!3347 lt!120289)) ((_ extract 31 0) lt!120291)))))

(assert (=> b!74821 (and (bvslt lt!120291 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!120291 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!120294 () (_ BitVec 64))

(declare-fun lt!120290 () (_ BitVec 64))

(assert (=> b!74821 (= lt!120291 (bvsdiv lt!120294 lt!120290))))

(assert (=> b!74821 (and (not (= lt!120290 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!120294 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!120290 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!74821 (= lt!120290 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!120287 () (_ BitVec 64))

(declare-fun lt!120295 () (_ BitVec 64))

(assert (=> b!74821 (= lt!120294 (bvsub lt!120287 lt!120295))))

(assert (=> b!74821 (or (= (bvand lt!120287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120295 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120287 lt!120295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74821 (= lt!120295 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!120292 () (_ BitVec 64))

(assert (=> b!74821 (= lt!120287 (bvadd (bvsub to!314 i!635) lt!120292))))

(assert (=> b!74821 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120292 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!120292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74821 (= lt!120292 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!74822 () Bool)

(declare-fun res!61861 () Bool)

(assert (=> b!74822 (=> (not res!61861) (not e!48948))))

(assert (=> b!74822 (= res!61861 (invariant!0 (currentBit!3558 (_2!3347 lt!120289)) (currentByte!3563 (_2!3347 lt!120289)) (size!1429 (buf!1810 (_2!3347 lt!120289)))))))

(assert (= (and d!23742 res!61860) b!74819))

(assert (= (and b!74819 res!61863) b!74822))

(assert (= (and b!74822 res!61861) b!74821))

(assert (= (and b!74821 res!61864) b!74818))

(assert (= (and b!74818 res!61862) b!74820))

(declare-fun m!119829 () Bool)

(assert (=> d!23742 m!119829))

(declare-fun m!119831 () Bool)

(assert (=> b!74819 m!119831))

(declare-fun m!119833 () Bool)

(assert (=> b!74819 m!119833))

(declare-fun m!119835 () Bool)

(assert (=> b!74820 m!119835))

(declare-fun m!119837 () Bool)

(assert (=> b!74820 m!119837))

(declare-fun m!119839 () Bool)

(assert (=> b!74822 m!119839))

(assert (=> b!74732 d!23742))

(declare-fun b!74839 () Bool)

(declare-fun e!48957 () Unit!4938)

(declare-fun Unit!4941 () Unit!4938)

(assert (=> b!74839 (= e!48957 Unit!4941)))

(declare-fun b!74840 () Bool)

(declare-fun res!61879 () Bool)

(declare-fun e!48958 () Bool)

(assert (=> b!74840 (=> (not res!61879) (not e!48958))))

(declare-fun lt!120358 () tuple2!6458)

(assert (=> b!74840 (= res!61879 (isPrefixOf!0 (_1!3346 lt!120358) thiss!1379))))

(declare-fun b!74841 () Bool)

(declare-fun lt!120343 () Unit!4938)

(assert (=> b!74841 (= e!48957 lt!120343)))

(declare-fun lt!120361 () (_ BitVec 64))

(assert (=> b!74841 (= lt!120361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120351 () (_ BitVec 64))

(assert (=> b!74841 (= lt!120351 (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3059 array!3059 (_ BitVec 64) (_ BitVec 64)) Unit!4938)

(assert (=> b!74841 (= lt!120343 (arrayBitRangesEqSymmetric!0 (buf!1810 thiss!1379) (buf!1810 thiss!1379) lt!120361 lt!120351))))

(assert (=> b!74841 (arrayBitRangesEq!0 (buf!1810 thiss!1379) (buf!1810 thiss!1379) lt!120361 lt!120351)))

(declare-fun d!23758 () Bool)

(assert (=> d!23758 e!48958))

(declare-fun res!61878 () Bool)

(assert (=> d!23758 (=> (not res!61878) (not e!48958))))

(assert (=> d!23758 (= res!61878 (isPrefixOf!0 (_1!3346 lt!120358) (_2!3346 lt!120358)))))

(declare-fun lt!120354 () BitStream!2432)

(assert (=> d!23758 (= lt!120358 (tuple2!6459 lt!120354 thiss!1379))))

(declare-fun lt!120350 () Unit!4938)

(declare-fun lt!120359 () Unit!4938)

(assert (=> d!23758 (= lt!120350 lt!120359)))

(assert (=> d!23758 (isPrefixOf!0 lt!120354 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2432 BitStream!2432 BitStream!2432) Unit!4938)

(assert (=> d!23758 (= lt!120359 (lemmaIsPrefixTransitive!0 lt!120354 thiss!1379 thiss!1379))))

(declare-fun lt!120349 () Unit!4938)

(declare-fun lt!120345 () Unit!4938)

(assert (=> d!23758 (= lt!120349 lt!120345)))

(assert (=> d!23758 (isPrefixOf!0 lt!120354 thiss!1379)))

(assert (=> d!23758 (= lt!120345 (lemmaIsPrefixTransitive!0 lt!120354 thiss!1379 thiss!1379))))

(declare-fun lt!120347 () Unit!4938)

(assert (=> d!23758 (= lt!120347 e!48957)))

(declare-fun c!5478 () Bool)

(assert (=> d!23758 (= c!5478 (not (= (size!1429 (buf!1810 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!120356 () Unit!4938)

(declare-fun lt!120344 () Unit!4938)

(assert (=> d!23758 (= lt!120356 lt!120344)))

(assert (=> d!23758 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23758 (= lt!120344 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120348 () Unit!4938)

(declare-fun lt!120342 () Unit!4938)

(assert (=> d!23758 (= lt!120348 lt!120342)))

(assert (=> d!23758 (= lt!120342 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120346 () Unit!4938)

(declare-fun lt!120355 () Unit!4938)

(assert (=> d!23758 (= lt!120346 lt!120355)))

(assert (=> d!23758 (isPrefixOf!0 lt!120354 lt!120354)))

(assert (=> d!23758 (= lt!120355 (lemmaIsPrefixRefl!0 lt!120354))))

(declare-fun lt!120353 () Unit!4938)

(declare-fun lt!120360 () Unit!4938)

(assert (=> d!23758 (= lt!120353 lt!120360)))

(assert (=> d!23758 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23758 (= lt!120360 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23758 (= lt!120354 (BitStream!2433 (buf!1810 thiss!1379) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379)))))

(assert (=> d!23758 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23758 (= (reader!0 thiss!1379 thiss!1379) lt!120358)))

(declare-fun b!74842 () Bool)

(declare-fun res!61877 () Bool)

(assert (=> b!74842 (=> (not res!61877) (not e!48958))))

(assert (=> b!74842 (= res!61877 (isPrefixOf!0 (_2!3346 lt!120358) thiss!1379))))

(declare-fun b!74843 () Bool)

(declare-fun lt!120357 () (_ BitVec 64))

(declare-fun lt!120352 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2432 (_ BitVec 64)) BitStream!2432)

(assert (=> b!74843 (= e!48958 (= (_1!3346 lt!120358) (withMovedBitIndex!0 (_2!3346 lt!120358) (bvsub lt!120357 lt!120352))))))

(assert (=> b!74843 (or (= (bvand lt!120357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120352 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120357 lt!120352) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74843 (= lt!120352 (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379)))))

(assert (=> b!74843 (= lt!120357 (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379)))))

(assert (= (and d!23758 c!5478) b!74841))

(assert (= (and d!23758 (not c!5478)) b!74839))

(assert (= (and d!23758 res!61878) b!74840))

(assert (= (and b!74840 res!61879) b!74842))

(assert (= (and b!74842 res!61877) b!74843))

(assert (=> b!74841 m!119743))

(declare-fun m!119841 () Bool)

(assert (=> b!74841 m!119841))

(declare-fun m!119843 () Bool)

(assert (=> b!74841 m!119843))

(declare-fun m!119845 () Bool)

(assert (=> b!74843 m!119845))

(assert (=> b!74843 m!119743))

(assert (=> b!74843 m!119743))

(assert (=> d!23758 m!119739))

(declare-fun m!119847 () Bool)

(assert (=> d!23758 m!119847))

(declare-fun m!119849 () Bool)

(assert (=> d!23758 m!119849))

(declare-fun m!119851 () Bool)

(assert (=> d!23758 m!119851))

(assert (=> d!23758 m!119739))

(assert (=> d!23758 m!119741))

(assert (=> d!23758 m!119849))

(assert (=> d!23758 m!119739))

(declare-fun m!119853 () Bool)

(assert (=> d!23758 m!119853))

(declare-fun m!119855 () Bool)

(assert (=> d!23758 m!119855))

(assert (=> d!23758 m!119741))

(declare-fun m!119857 () Bool)

(assert (=> b!74840 m!119857))

(declare-fun m!119859 () Bool)

(assert (=> b!74842 m!119859))

(assert (=> b!74732 d!23758))

(declare-fun d!23762 () Bool)

(assert (=> d!23762 (= (array_inv!1275 srcBuffer!2) (bvsge (size!1429 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14428 d!23762))

(declare-fun d!23764 () Bool)

(assert (=> d!23764 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3558 thiss!1379) (currentByte!3563 thiss!1379) (size!1429 (buf!1810 thiss!1379))))))

(declare-fun bs!5720 () Bool)

(assert (= bs!5720 d!23764))

(assert (=> bs!5720 m!119737))

(assert (=> start!14428 d!23764))

(declare-fun d!23766 () Bool)

(assert (=> d!23766 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1429 (buf!1810 thiss!1379))) ((_ sign_extend 32) (currentByte!3563 thiss!1379)) ((_ sign_extend 32) (currentBit!3558 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1429 (buf!1810 thiss!1379))) ((_ sign_extend 32) (currentByte!3563 thiss!1379)) ((_ sign_extend 32) (currentBit!3558 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5721 () Bool)

(assert (= bs!5721 d!23766))

(assert (=> bs!5721 m!119777))

(assert (=> b!74736 d!23766))

(declare-fun d!23768 () Bool)

(assert (=> d!23768 (= (invariant!0 (currentBit!3558 thiss!1379) (currentByte!3563 thiss!1379) (size!1429 (buf!1810 thiss!1379))) (and (bvsge (currentBit!3558 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3558 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3563 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3563 thiss!1379) (size!1429 (buf!1810 thiss!1379))) (and (= (currentBit!3558 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3563 thiss!1379) (size!1429 (buf!1810 thiss!1379)))))))))

(assert (=> b!74735 d!23768))

(push 1)

(assert (not d!23734))

(assert (not d!23738))

(assert (not d!23764))

(assert (not d!23742))

(assert (not b!74822))

(assert (not b!74744))

(assert (not d!23732))

(assert (not b!74841))

(assert (not d!23766))

(assert (not d!23758))

(assert (not b!74843))

(assert (not b!74819))

(assert (not b!74820))

(assert (not b!74746))

(assert (not b!74773))

(assert (not b!74840))

(assert (not b!74842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23808 () Bool)

(declare-fun res!61941 () Bool)

(declare-fun e!49013 () Bool)

(assert (=> d!23808 (=> (not res!61941) (not e!49013))))

(assert (=> d!23808 (= res!61941 (= (size!1429 (buf!1810 (_2!3346 lt!120358))) (size!1429 (buf!1810 thiss!1379))))))

(assert (=> d!23808 (= (isPrefixOf!0 (_2!3346 lt!120358) thiss!1379) e!49013)))

(declare-fun b!74935 () Bool)

(declare-fun res!61942 () Bool)

(assert (=> b!74935 (=> (not res!61942) (not e!49013))))

(assert (=> b!74935 (= res!61942 (bvsle (bitIndex!0 (size!1429 (buf!1810 (_2!3346 lt!120358))) (currentByte!3563 (_2!3346 lt!120358)) (currentBit!3558 (_2!3346 lt!120358))) (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379))))))

(declare-fun b!74936 () Bool)

(declare-fun e!49014 () Bool)

(assert (=> b!74936 (= e!49013 e!49014)))

(declare-fun res!61943 () Bool)

(assert (=> b!74936 (=> res!61943 e!49014)))

(assert (=> b!74936 (= res!61943 (= (size!1429 (buf!1810 (_2!3346 lt!120358))) #b00000000000000000000000000000000))))

(declare-fun b!74937 () Bool)

(assert (=> b!74937 (= e!49014 (arrayBitRangesEq!0 (buf!1810 (_2!3346 lt!120358)) (buf!1810 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1429 (buf!1810 (_2!3346 lt!120358))) (currentByte!3563 (_2!3346 lt!120358)) (currentBit!3558 (_2!3346 lt!120358)))))))

(assert (= (and d!23808 res!61941) b!74935))

(assert (= (and b!74935 res!61942) b!74936))

(assert (= (and b!74936 (not res!61943)) b!74937))

(declare-fun m!119953 () Bool)

(assert (=> b!74935 m!119953))

(assert (=> b!74935 m!119743))

(assert (=> b!74937 m!119953))

(assert (=> b!74937 m!119953))

(declare-fun m!119955 () Bool)

(assert (=> b!74937 m!119955))

(assert (=> b!74842 d!23808))

(declare-fun d!23810 () Bool)

(assert (=> d!23810 (= (remainingBits!0 ((_ sign_extend 32) (size!1429 (buf!1810 thiss!1379))) ((_ sign_extend 32) (currentByte!3563 thiss!1379)) ((_ sign_extend 32) (currentBit!3558 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1429 (buf!1810 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3563 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3558 thiss!1379)))))))

(assert (=> d!23734 d!23810))

(assert (=> d!23734 d!23768))

(assert (=> d!23732 d!23730))

(declare-fun d!23812 () Bool)

(assert (=> d!23812 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23812 true))

(declare-fun _$14!256 () Unit!4938)

(assert (=> d!23812 (= (choose!11 thiss!1379) _$14!256)))

(declare-fun bs!5728 () Bool)

(assert (= bs!5728 d!23812))

(assert (=> bs!5728 m!119739))

(assert (=> d!23732 d!23812))

(declare-fun d!23814 () Bool)

(declare-fun e!49017 () Bool)

(assert (=> d!23814 e!49017))

(declare-fun res!61946 () Bool)

(assert (=> d!23814 (=> (not res!61946) (not e!49017))))

(declare-fun lt!120492 () BitStream!2432)

(declare-fun lt!120493 () (_ BitVec 64))

(assert (=> d!23814 (= res!61946 (= (bvadd lt!120493 (bvsub lt!120357 lt!120352)) (bitIndex!0 (size!1429 (buf!1810 lt!120492)) (currentByte!3563 lt!120492) (currentBit!3558 lt!120492))))))

(assert (=> d!23814 (or (not (= (bvand lt!120493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120357 lt!120352) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120493 (bvsub lt!120357 lt!120352)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23814 (= lt!120493 (bitIndex!0 (size!1429 (buf!1810 (_2!3346 lt!120358))) (currentByte!3563 (_2!3346 lt!120358)) (currentBit!3558 (_2!3346 lt!120358))))))

(declare-datatypes ((tuple2!6470 0))(
  ( (tuple2!6471 (_1!3356 Unit!4938) (_2!3356 BitStream!2432)) )
))
(declare-fun moveBitIndex!0 (BitStream!2432 (_ BitVec 64)) tuple2!6470)

(assert (=> d!23814 (= lt!120492 (_2!3356 (moveBitIndex!0 (_2!3346 lt!120358) (bvsub lt!120357 lt!120352))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!2432 (_ BitVec 64)) Bool)

(assert (=> d!23814 (moveBitIndexPrecond!0 (_2!3346 lt!120358) (bvsub lt!120357 lt!120352))))

(assert (=> d!23814 (= (withMovedBitIndex!0 (_2!3346 lt!120358) (bvsub lt!120357 lt!120352)) lt!120492)))

(declare-fun b!74940 () Bool)

(assert (=> b!74940 (= e!49017 (= (size!1429 (buf!1810 (_2!3346 lt!120358))) (size!1429 (buf!1810 lt!120492))))))

(assert (= (and d!23814 res!61946) b!74940))

(declare-fun m!119957 () Bool)

(assert (=> d!23814 m!119957))

(assert (=> d!23814 m!119953))

(declare-fun m!119959 () Bool)

(assert (=> d!23814 m!119959))

(declare-fun m!119961 () Bool)

(assert (=> d!23814 m!119961))

(assert (=> b!74843 d!23814))

(assert (=> b!74843 d!23734))

(declare-fun d!23816 () Bool)

(assert (=> d!23816 (= (invariant!0 (currentBit!3558 (_2!3347 lt!120289)) (currentByte!3563 (_2!3347 lt!120289)) (size!1429 (buf!1810 (_2!3347 lt!120289)))) (and (bvsge (currentBit!3558 (_2!3347 lt!120289)) #b00000000000000000000000000000000) (bvslt (currentBit!3558 (_2!3347 lt!120289)) #b00000000000000000000000000001000) (bvsge (currentByte!3563 (_2!3347 lt!120289)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3563 (_2!3347 lt!120289)) (size!1429 (buf!1810 (_2!3347 lt!120289)))) (and (= (currentBit!3558 (_2!3347 lt!120289)) #b00000000000000000000000000000000) (= (currentByte!3563 (_2!3347 lt!120289)) (size!1429 (buf!1810 (_2!3347 lt!120289))))))))))

(assert (=> b!74822 d!23816))

(declare-fun d!23818 () Bool)

(assert (=> d!23818 (= (invariant!0 (currentBit!3558 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) (currentByte!3563 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) (size!1429 (buf!1810 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))))) (and (bvsge (currentBit!3558 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) #b00000000000000000000000000000000) (bvslt (currentBit!3558 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) #b00000000000000000000000000001000) (bvsge (currentByte!3563 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!3563 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) (size!1429 (buf!1810 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))))) (and (= (currentBit!3558 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) #b00000000000000000000000000000000) (= (currentByte!3563 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137)))) (size!1429 (buf!1810 (BitStream!2433 (buf!1810 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_2!3347 lt!120137))))))))))))

(assert (=> d!23738 d!23818))

(assert (=> d!23764 d!23768))

(assert (=> b!74744 d!23734))

(declare-fun d!23820 () Bool)

(declare-fun res!61947 () Bool)

(declare-fun e!49018 () Bool)

(assert (=> d!23820 (=> (not res!61947) (not e!49018))))

(assert (=> d!23820 (= res!61947 (= (size!1429 (buf!1810 (_1!3346 lt!120358))) (size!1429 (buf!1810 thiss!1379))))))

(assert (=> d!23820 (= (isPrefixOf!0 (_1!3346 lt!120358) thiss!1379) e!49018)))

(declare-fun b!74941 () Bool)

(declare-fun res!61948 () Bool)

(assert (=> b!74941 (=> (not res!61948) (not e!49018))))

(assert (=> b!74941 (= res!61948 (bvsle (bitIndex!0 (size!1429 (buf!1810 (_1!3346 lt!120358))) (currentByte!3563 (_1!3346 lt!120358)) (currentBit!3558 (_1!3346 lt!120358))) (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379))))))

(declare-fun b!74942 () Bool)

(declare-fun e!49019 () Bool)

(assert (=> b!74942 (= e!49018 e!49019)))

(declare-fun res!61949 () Bool)

(assert (=> b!74942 (=> res!61949 e!49019)))

(assert (=> b!74942 (= res!61949 (= (size!1429 (buf!1810 (_1!3346 lt!120358))) #b00000000000000000000000000000000))))

(declare-fun b!74943 () Bool)

(assert (=> b!74943 (= e!49019 (arrayBitRangesEq!0 (buf!1810 (_1!3346 lt!120358)) (buf!1810 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1429 (buf!1810 (_1!3346 lt!120358))) (currentByte!3563 (_1!3346 lt!120358)) (currentBit!3558 (_1!3346 lt!120358)))))))

(assert (= (and d!23820 res!61947) b!74941))

(assert (= (and b!74941 res!61948) b!74942))

(assert (= (and b!74942 (not res!61949)) b!74943))

(declare-fun m!119963 () Bool)

(assert (=> b!74941 m!119963))

(assert (=> b!74941 m!119743))

(assert (=> b!74943 m!119963))

(assert (=> b!74943 m!119963))

(declare-fun m!119965 () Bool)

(assert (=> b!74943 m!119965))

(assert (=> b!74840 d!23820))

(declare-fun d!23822 () Bool)

(declare-fun e!49020 () Bool)

(assert (=> d!23822 e!49020))

(declare-fun res!61950 () Bool)

(assert (=> d!23822 (=> (not res!61950) (not e!49020))))

(declare-fun lt!120497 () (_ BitVec 64))

(declare-fun lt!120496 () (_ BitVec 64))

(declare-fun lt!120495 () (_ BitVec 64))

(assert (=> d!23822 (= res!61950 (= lt!120497 (bvsub lt!120495 lt!120496)))))

(assert (=> d!23822 (or (= (bvand lt!120495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120496 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120495 lt!120496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23822 (= lt!120496 (remainingBits!0 ((_ sign_extend 32) (size!1429 (buf!1810 (_2!3347 lt!120289)))) ((_ sign_extend 32) (currentByte!3563 (_2!3347 lt!120289))) ((_ sign_extend 32) (currentBit!3558 (_2!3347 lt!120289)))))))

(declare-fun lt!120498 () (_ BitVec 64))

(declare-fun lt!120499 () (_ BitVec 64))

(assert (=> d!23822 (= lt!120495 (bvmul lt!120498 lt!120499))))

(assert (=> d!23822 (or (= lt!120498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!120499 (bvsdiv (bvmul lt!120498 lt!120499) lt!120498)))))

(assert (=> d!23822 (= lt!120499 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23822 (= lt!120498 ((_ sign_extend 32) (size!1429 (buf!1810 (_2!3347 lt!120289)))))))

(assert (=> d!23822 (= lt!120497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3563 (_2!3347 lt!120289))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3558 (_2!3347 lt!120289)))))))

(assert (=> d!23822 (invariant!0 (currentBit!3558 (_2!3347 lt!120289)) (currentByte!3563 (_2!3347 lt!120289)) (size!1429 (buf!1810 (_2!3347 lt!120289))))))

(assert (=> d!23822 (= (bitIndex!0 (size!1429 (buf!1810 (_2!3347 lt!120289))) (currentByte!3563 (_2!3347 lt!120289)) (currentBit!3558 (_2!3347 lt!120289))) lt!120497)))

(declare-fun b!74944 () Bool)

(declare-fun res!61951 () Bool)

(assert (=> b!74944 (=> (not res!61951) (not e!49020))))

(assert (=> b!74944 (= res!61951 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120497))))

(declare-fun b!74945 () Bool)

(declare-fun lt!120494 () (_ BitVec 64))

(assert (=> b!74945 (= e!49020 (bvsle lt!120497 (bvmul lt!120494 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74945 (or (= lt!120494 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!120494 #b0000000000000000000000000000000000000000000000000000000000001000) lt!120494)))))

(assert (=> b!74945 (= lt!120494 ((_ sign_extend 32) (size!1429 (buf!1810 (_2!3347 lt!120289)))))))

(assert (= (and d!23822 res!61950) b!74944))

(assert (= (and b!74944 res!61951) b!74945))

(declare-fun m!119967 () Bool)

(assert (=> d!23822 m!119967))

(assert (=> d!23822 m!119839))

(assert (=> b!74819 d!23822))

(declare-fun d!23824 () Bool)

(declare-fun e!49021 () Bool)

(assert (=> d!23824 e!49021))

(declare-fun res!61952 () Bool)

(assert (=> d!23824 (=> (not res!61952) (not e!49021))))

(declare-fun lt!120503 () (_ BitVec 64))

(declare-fun lt!120501 () (_ BitVec 64))

(declare-fun lt!120502 () (_ BitVec 64))

(assert (=> d!23824 (= res!61952 (= lt!120503 (bvsub lt!120501 lt!120502)))))

(assert (=> d!23824 (or (= (bvand lt!120501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120501 lt!120502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23824 (= lt!120502 (remainingBits!0 ((_ sign_extend 32) (size!1429 (buf!1810 (_1!3346 lt!120138)))) ((_ sign_extend 32) (currentByte!3563 (_1!3346 lt!120138))) ((_ sign_extend 32) (currentBit!3558 (_1!3346 lt!120138)))))))

(declare-fun lt!120504 () (_ BitVec 64))

(declare-fun lt!120505 () (_ BitVec 64))

(assert (=> d!23824 (= lt!120501 (bvmul lt!120504 lt!120505))))

(assert (=> d!23824 (or (= lt!120504 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!120505 (bvsdiv (bvmul lt!120504 lt!120505) lt!120504)))))

(assert (=> d!23824 (= lt!120505 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23824 (= lt!120504 ((_ sign_extend 32) (size!1429 (buf!1810 (_1!3346 lt!120138)))))))

(assert (=> d!23824 (= lt!120503 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3563 (_1!3346 lt!120138))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3558 (_1!3346 lt!120138)))))))

(assert (=> d!23824 (invariant!0 (currentBit!3558 (_1!3346 lt!120138)) (currentByte!3563 (_1!3346 lt!120138)) (size!1429 (buf!1810 (_1!3346 lt!120138))))))

(assert (=> d!23824 (= (bitIndex!0 (size!1429 (buf!1810 (_1!3346 lt!120138))) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_1!3346 lt!120138))) lt!120503)))

(declare-fun b!74946 () Bool)

(declare-fun res!61953 () Bool)

(assert (=> b!74946 (=> (not res!61953) (not e!49021))))

(assert (=> b!74946 (= res!61953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120503))))

(declare-fun b!74947 () Bool)

(declare-fun lt!120500 () (_ BitVec 64))

(assert (=> b!74947 (= e!49021 (bvsle lt!120503 (bvmul lt!120500 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74947 (or (= lt!120500 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!120500 #b0000000000000000000000000000000000000000000000000000000000001000) lt!120500)))))

(assert (=> b!74947 (= lt!120500 ((_ sign_extend 32) (size!1429 (buf!1810 (_1!3346 lt!120138)))))))

(assert (= (and d!23824 res!61952) b!74946))

(assert (= (and b!74946 res!61953) b!74947))

(declare-fun m!119969 () Bool)

(assert (=> d!23824 m!119969))

(declare-fun m!119971 () Bool)

(assert (=> d!23824 m!119971))

(assert (=> b!74819 d!23824))

(declare-fun d!23826 () Bool)

(declare-fun res!61954 () Bool)

(declare-fun e!49022 () Bool)

(assert (=> d!23826 (=> res!61954 e!49022)))

(assert (=> d!23826 (= res!61954 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23826 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3347 lt!120137) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) e!49022)))

(declare-fun b!74948 () Bool)

(declare-fun e!49023 () Bool)

(assert (=> b!74948 (= e!49022 e!49023)))

(declare-fun res!61955 () Bool)

(assert (=> b!74948 (=> (not res!61955) (not e!49023))))

(assert (=> b!74948 (= res!61955 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2023 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2023 (_1!3347 lt!120137)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!74949 () Bool)

(assert (=> b!74949 (= e!49023 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3347 lt!120137) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23826 (not res!61954)) b!74948))

(assert (= (and b!74948 res!61955) b!74949))

(declare-fun m!119973 () Bool)

(assert (=> b!74948 m!119973))

(declare-fun m!119975 () Bool)

(assert (=> b!74948 m!119975))

(declare-fun m!119977 () Bool)

(assert (=> b!74948 m!119977))

(declare-fun m!119979 () Bool)

(assert (=> b!74948 m!119979))

(declare-fun m!119981 () Bool)

(assert (=> b!74949 m!119981))

(assert (=> b!74773 d!23826))

(declare-fun d!23828 () Bool)

(declare-fun res!61967 () Bool)

(declare-fun e!49038 () Bool)

(assert (=> d!23828 (=> res!61967 e!49038)))

(assert (=> d!23828 (= res!61967 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379))))))

(assert (=> d!23828 (= (arrayBitRangesEq!0 (buf!1810 thiss!1379) (buf!1810 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379))) e!49038)))

(declare-fun b!74964 () Bool)

(declare-fun res!61970 () Bool)

(declare-fun lt!120514 () (_ BitVec 32))

(assert (=> b!74964 (= res!61970 (= lt!120514 #b00000000000000000000000000000000))))

(declare-fun e!49040 () Bool)

(assert (=> b!74964 (=> res!61970 e!49040)))

(declare-fun e!49037 () Bool)

(assert (=> b!74964 (= e!49037 e!49040)))

(declare-fun b!74965 () Bool)

(declare-fun e!49036 () Bool)

(declare-fun e!49041 () Bool)

(assert (=> b!74965 (= e!49036 e!49041)))

(declare-fun c!5496 () Bool)

(declare-datatypes ((tuple4!40 0))(
  ( (tuple4!41 (_1!3357 (_ BitVec 32)) (_2!3357 (_ BitVec 32)) (_3!121 (_ BitVec 32)) (_4!20 (_ BitVec 32))) )
))
(declare-fun lt!120512 () tuple4!40)

(assert (=> b!74965 (= c!5496 (= (_3!121 lt!120512) (_4!20 lt!120512)))))

(declare-fun b!74966 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74966 (= e!49040 (byteRangesEq!0 (select (arr!2023 (buf!1810 thiss!1379)) (_4!20 lt!120512)) (select (arr!2023 (buf!1810 thiss!1379)) (_4!20 lt!120512)) #b00000000000000000000000000000000 lt!120514))))

(declare-fun lt!120513 () (_ BitVec 32))

(declare-fun call!949 () Bool)

(declare-fun bm!946 () Bool)

(assert (=> bm!946 (= call!949 (byteRangesEq!0 (select (arr!2023 (buf!1810 thiss!1379)) (_3!121 lt!120512)) (select (arr!2023 (buf!1810 thiss!1379)) (_3!121 lt!120512)) lt!120513 (ite c!5496 lt!120514 #b00000000000000000000000000001000)))))

(declare-fun b!74967 () Bool)

(assert (=> b!74967 (= e!49038 e!49036)))

(declare-fun res!61966 () Bool)

(assert (=> b!74967 (=> (not res!61966) (not e!49036))))

(declare-fun e!49039 () Bool)

(assert (=> b!74967 (= res!61966 e!49039)))

(declare-fun res!61969 () Bool)

(assert (=> b!74967 (=> res!61969 e!49039)))

(assert (=> b!74967 (= res!61969 (bvsge (_1!3357 lt!120512) (_2!3357 lt!120512)))))

(assert (=> b!74967 (= lt!120514 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74967 (= lt!120513 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!40)

(assert (=> b!74967 (= lt!120512 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379))))))

(declare-fun b!74968 () Bool)

(declare-fun arrayRangesEq!21 (array!3059 array!3059 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74968 (= e!49039 (arrayRangesEq!21 (buf!1810 thiss!1379) (buf!1810 thiss!1379) (_1!3357 lt!120512) (_2!3357 lt!120512)))))

(declare-fun b!74969 () Bool)

(assert (=> b!74969 (= e!49041 call!949)))

(declare-fun b!74970 () Bool)

(assert (=> b!74970 (= e!49041 e!49037)))

(declare-fun res!61968 () Bool)

(assert (=> b!74970 (= res!61968 call!949)))

(assert (=> b!74970 (=> (not res!61968) (not e!49037))))

(assert (= (and d!23828 (not res!61967)) b!74967))

(assert (= (and b!74967 (not res!61969)) b!74968))

(assert (= (and b!74967 res!61966) b!74965))

(assert (= (and b!74965 c!5496) b!74969))

(assert (= (and b!74965 (not c!5496)) b!74970))

(assert (= (and b!74970 res!61968) b!74964))

(assert (= (and b!74964 (not res!61970)) b!74966))

(assert (= (or b!74969 b!74970) bm!946))

(declare-fun m!119983 () Bool)

(assert (=> b!74966 m!119983))

(assert (=> b!74966 m!119983))

(assert (=> b!74966 m!119983))

(assert (=> b!74966 m!119983))

(declare-fun m!119985 () Bool)

(assert (=> b!74966 m!119985))

(declare-fun m!119987 () Bool)

(assert (=> bm!946 m!119987))

(assert (=> bm!946 m!119987))

(assert (=> bm!946 m!119987))

(assert (=> bm!946 m!119987))

(declare-fun m!119989 () Bool)

(assert (=> bm!946 m!119989))

(assert (=> b!74967 m!119743))

(declare-fun m!119991 () Bool)

(assert (=> b!74967 m!119991))

(declare-fun m!119993 () Bool)

(assert (=> b!74968 m!119993))

(assert (=> b!74746 d!23828))

(assert (=> b!74746 d!23734))

(declare-fun d!23830 () Bool)

(declare-fun e!49080 () Bool)

(assert (=> d!23830 e!49080))

(declare-fun res!62031 () Bool)

(assert (=> d!23830 (=> (not res!62031) (not e!49080))))

(declare-fun lt!120721 () (_ BitVec 64))

(declare-fun lt!120739 () tuple3!198)

(assert (=> d!23830 (= res!62031 (= (bvsub lt!120721 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1429 (buf!1810 (_2!3349 lt!120739))) (currentByte!3563 (_2!3349 lt!120739)) (currentBit!3558 (_2!3349 lt!120739)))))))

(assert (=> d!23830 (or (= (bvand lt!120721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120721 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!120718 () (_ BitVec 64))

(assert (=> d!23830 (= lt!120721 (bvadd lt!120718 (bvsub to!314 i!635)))))

(assert (=> d!23830 (or (not (= (bvand lt!120718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120718 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23830 (= lt!120718 (bitIndex!0 (size!1429 (buf!1810 (_1!3346 lt!120138))) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_1!3346 lt!120138))))))

(declare-fun e!49083 () tuple3!198)

(assert (=> d!23830 (= lt!120739 e!49083)))

(declare-fun c!5503 () Bool)

(assert (=> d!23830 (= c!5503 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23830 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23830 (= (readBitsLoop!0 (_1!3346 lt!120138) (bvsub to!314 i!635) (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) lt!120739)))

(declare-fun b!75042 () Bool)

(declare-fun res!62033 () Bool)

(assert (=> b!75042 (=> (not res!62033) (not e!49080))))

(assert (=> b!75042 (= res!62033 (invariant!0 (currentBit!3558 (_2!3349 lt!120739)) (currentByte!3563 (_2!3349 lt!120739)) (size!1429 (buf!1810 (_2!3349 lt!120739)))))))

(declare-fun b!75043 () Bool)

(declare-fun lt!120722 () Unit!4938)

(declare-fun lt!120720 () tuple3!198)

(assert (=> b!75043 (= e!49083 (tuple3!199 lt!120722 (_2!3349 lt!120720) (_3!118 lt!120720)))))

(declare-datatypes ((tuple2!6472 0))(
  ( (tuple2!6473 (_1!3358 Bool) (_2!3358 BitStream!2432)) )
))
(declare-fun lt!120742 () tuple2!6472)

(declare-fun readBit!0 (BitStream!2432) tuple2!6472)

(assert (=> b!75043 (= lt!120742 (readBit!0 (_1!3346 lt!120138)))))

(declare-fun lt!120725 () (_ BitVec 32))

(assert (=> b!75043 (= lt!120725 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!120737 () (_ BitVec 32))

(assert (=> b!75043 (= lt!120737 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!120740 () array!3059)

(assert (=> b!75043 (= lt!120740 (array!3060 (store (arr!2023 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!120725 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2023 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!120725)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!120737)))) ((_ sign_extend 24) (ite (_1!3358 lt!120742) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!120737) #b00000000))))) (size!1429 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!120745 () (_ BitVec 64))

(assert (=> b!75043 (= lt!120745 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!120723 () (_ BitVec 64))

(assert (=> b!75043 (= lt!120723 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!120736 () Unit!4938)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2432 BitStream!2432 (_ BitVec 64) (_ BitVec 64)) Unit!4938)

(assert (=> b!75043 (= lt!120736 (validateOffsetBitsIneqLemma!0 (_1!3346 lt!120138) (_2!3358 lt!120742) lt!120745 lt!120723))))

(assert (=> b!75043 (validate_offset_bits!1 ((_ sign_extend 32) (size!1429 (buf!1810 (_2!3358 lt!120742)))) ((_ sign_extend 32) (currentByte!3563 (_2!3358 lt!120742))) ((_ sign_extend 32) (currentBit!3558 (_2!3358 lt!120742))) (bvsub lt!120745 lt!120723))))

(declare-fun lt!120749 () Unit!4938)

(assert (=> b!75043 (= lt!120749 lt!120736)))

(assert (=> b!75043 (= lt!120720 (readBitsLoop!0 (_2!3358 lt!120742) (bvsub to!314 i!635) lt!120740 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 i!635)))))

(declare-fun res!62036 () Bool)

(assert (=> b!75043 (= res!62036 (= (bvsub (bvadd (bitIndex!0 (size!1429 (buf!1810 (_1!3346 lt!120138))) (currentByte!3563 (_1!3346 lt!120138)) (currentBit!3558 (_1!3346 lt!120138))) (bvsub to!314 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1429 (buf!1810 (_2!3349 lt!120720))) (currentByte!3563 (_2!3349 lt!120720)) (currentBit!3558 (_2!3349 lt!120720)))))))

(declare-fun e!49081 () Bool)

(assert (=> b!75043 (=> (not res!62036) (not e!49081))))

(assert (=> b!75043 e!49081))

(declare-fun lt!120741 () Unit!4938)

(declare-fun Unit!4947 () Unit!4938)

(assert (=> b!75043 (= lt!120741 Unit!4947)))

(declare-fun lt!120748 () (_ BitVec 32))

(assert (=> b!75043 (= lt!120748 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!120751 () (_ BitVec 32))

(assert (=> b!75043 (= lt!120751 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!120747 () Unit!4938)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!3059 (_ BitVec 64) Bool) Unit!4938)

(assert (=> b!75043 (= lt!120747 (arrayBitRangesUpdatedAtLemma!0 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3358 lt!120742)))))

(assert (=> b!75043 (arrayBitRangesEq!0 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!3060 (store (arr!2023 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!120748 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2023 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!120748)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!120751)))) ((_ sign_extend 24) (ite (_1!3358 lt!120742) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!120751) #b00000000))))) (size!1429 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120730 () Unit!4938)

(assert (=> b!75043 (= lt!120730 lt!120747)))

(declare-fun lt!120744 () (_ BitVec 64))

(assert (=> b!75043 (= lt!120744 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120729 () Unit!4938)

(declare-fun arrayBitRangesEqTransitive!0 (array!3059 array!3059 array!3059 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4938)

(assert (=> b!75043 (= lt!120729 (arrayBitRangesEqTransitive!0 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!120740 (_3!118 lt!120720) lt!120744 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!962 () Bool)

(assert (=> b!75043 call!962))

(declare-fun lt!120734 () Unit!4938)

(assert (=> b!75043 (= lt!120734 lt!120729)))

(declare-fun call!961 () Bool)

(assert (=> b!75043 call!961))

(declare-fun lt!120750 () Unit!4938)

(declare-fun Unit!4948 () Unit!4938)

(assert (=> b!75043 (= lt!120750 Unit!4948)))

(declare-fun lt!120743 () Unit!4938)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!3059 array!3059 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4938)

(assert (=> b!75043 (= lt!120743 (arrayBitRangesEqImpliesEq!0 lt!120740 (_3!118 lt!120720) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bitAt!0 (array!3059 (_ BitVec 64)) Bool)

(assert (=> b!75043 (= (bitAt!0 lt!120740 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!118 lt!120720) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!120726 () Unit!4938)

(assert (=> b!75043 (= lt!120726 lt!120743)))

(declare-fun lt!120724 () Unit!4938)

(declare-fun Unit!4949 () Unit!4938)

(assert (=> b!75043 (= lt!120724 Unit!4949)))

(declare-fun lt!120719 () Bool)

(assert (=> b!75043 (= lt!120719 (= (bitAt!0 (_3!118 lt!120720) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!3358 lt!120742)))))

(declare-fun Unit!4950 () Unit!4938)

(assert (=> b!75043 (= lt!120722 Unit!4950)))

(assert (=> b!75043 lt!120719))

(declare-fun b!75044 () Bool)

(assert (=> b!75044 (= e!49080 (= (byteArrayBitContentToList!0 (_2!3349 lt!120739) (_3!118 lt!120739) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!3349 lt!120739) (_1!3346 lt!120138) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75044 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75044 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75045 () Bool)

(declare-fun e!49082 () Bool)

(declare-datatypes ((tuple2!6474 0))(
  ( (tuple2!6475 (_1!3359 BitStream!2432) (_2!3359 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2432) tuple2!6474)

(assert (=> b!75045 (= e!49082 (= (bitAt!0 (_3!118 lt!120739) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!3359 (readBitPure!0 (_1!3346 lt!120138)))))))

(declare-fun bm!958 () Bool)

(assert (=> bm!958 (= call!962 (arrayBitRangesEq!0 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5503 (_3!118 lt!120720) (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (ite c!5503 lt!120744 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!5503 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1429 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!75046 () Bool)

(declare-fun res!62030 () Bool)

(assert (=> b!75046 (=> (not res!62030) (not e!49080))))

(assert (=> b!75046 (= res!62030 e!49082)))

(declare-fun res!62034 () Bool)

(assert (=> b!75046 (=> res!62034 e!49082)))

(assert (=> b!75046 (= res!62034 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))))

(declare-fun lt!120735 () (_ BitVec 64))

(declare-fun lt!120738 () (_ BitVec 64))

(declare-fun lt!120728 () array!3059)

(declare-fun lt!120732 () array!3059)

(declare-fun bm!959 () Bool)

(assert (=> bm!959 (= call!961 (arrayBitRangesEq!0 (ite c!5503 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!120728) (ite c!5503 (_3!118 lt!120720) lt!120732) (ite c!5503 #b0000000000000000000000000000000000000000000000000000000000000000 lt!120735) (ite c!5503 #b0000000000000000000000000000000000000000000000000000000000000000 lt!120738)))))

(declare-fun b!75047 () Bool)

(assert (=> b!75047 (= e!49081 (and (= (buf!1810 (_1!3346 lt!120138)) (buf!1810 (_2!3349 lt!120720))) (= (size!1429 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1429 (_3!118 lt!120720)))))))

(declare-fun b!75048 () Bool)

(declare-fun res!62035 () Bool)

(assert (=> b!75048 (=> (not res!62035) (not e!49080))))

(assert (=> b!75048 (= res!62035 (and (= (buf!1810 (_1!3346 lt!120138)) (buf!1810 (_2!3349 lt!120739))) (= (size!1429 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1429 (_3!118 lt!120739)))))))

(declare-fun lt!120731 () Unit!4938)

(declare-fun b!75049 () Bool)

(assert (=> b!75049 (= e!49083 (tuple3!199 lt!120731 (_1!3346 lt!120138) (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!120733 () Unit!4938)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!3059) Unit!4938)

(assert (=> b!75049 (= lt!120733 (arrayBitRangesEqReflexiveLemma!0 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!75049 call!962))

(declare-fun lt!120717 () Unit!4938)

(assert (=> b!75049 (= lt!120717 lt!120733)))

(assert (=> b!75049 (= lt!120728 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!75049 (= lt!120732 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!120752 () (_ BitVec 64))

(assert (=> b!75049 (= lt!120752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120746 () (_ BitVec 64))

(assert (=> b!75049 (= lt!120746 ((_ sign_extend 32) (size!1429 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!120727 () (_ BitVec 64))

(assert (=> b!75049 (= lt!120727 (bvmul lt!120746 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!75049 (= lt!120735 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!75049 (= lt!120738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!3059 array!3059 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4938)

(assert (=> b!75049 (= lt!120731 (arrayBitRangesEqSlicedLemma!0 lt!120728 lt!120732 lt!120752 lt!120727 lt!120735 lt!120738))))

(assert (=> b!75049 call!961))

(declare-fun b!75050 () Bool)

(declare-fun res!62032 () Bool)

(assert (=> b!75050 (=> (not res!62032) (not e!49080))))

(assert (=> b!75050 (= res!62032 (arrayBitRangesEq!0 (array!3060 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!118 lt!120739) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23830 c!5503) b!75043))

(assert (= (and d!23830 (not c!5503)) b!75049))

(assert (= (and b!75043 res!62036) b!75047))

(assert (= (or b!75043 b!75049) bm!959))

(assert (= (or b!75043 b!75049) bm!958))

(assert (= (and d!23830 res!62031) b!75048))

(assert (= (and b!75048 res!62035) b!75050))

(assert (= (and b!75050 res!62032) b!75046))

(assert (= (and b!75046 (not res!62034)) b!75045))

(assert (= (and b!75046 res!62030) b!75042))

(assert (= (and b!75042 res!62033) b!75044))

(declare-fun m!120087 () Bool)

(assert (=> bm!958 m!120087))

(declare-fun m!120089 () Bool)

(assert (=> b!75042 m!120089))

(declare-fun m!120091 () Bool)

(assert (=> b!75049 m!120091))

(declare-fun m!120093 () Bool)

(assert (=> b!75049 m!120093))

(declare-fun m!120095 () Bool)

(assert (=> b!75044 m!120095))

(declare-fun m!120097 () Bool)

(assert (=> b!75044 m!120097))

(declare-fun m!120099 () Bool)

(assert (=> b!75043 m!120099))

(declare-fun m!120101 () Bool)

(assert (=> b!75043 m!120101))

(declare-fun m!120103 () Bool)

(assert (=> b!75043 m!120103))

(declare-fun m!120105 () Bool)

(assert (=> b!75043 m!120105))

(declare-fun m!120107 () Bool)

(assert (=> b!75043 m!120107))

(declare-fun m!120109 () Bool)

(assert (=> b!75043 m!120109))

(declare-fun m!120111 () Bool)

(assert (=> b!75043 m!120111))

(declare-fun m!120113 () Bool)

(assert (=> b!75043 m!120113))

(declare-fun m!120115 () Bool)

(assert (=> b!75043 m!120115))

(declare-fun m!120117 () Bool)

(assert (=> b!75043 m!120117))

(declare-fun m!120119 () Bool)

(assert (=> b!75043 m!120119))

(assert (=> b!75043 m!119833))

(declare-fun m!120121 () Bool)

(assert (=> b!75043 m!120121))

(declare-fun m!120123 () Bool)

(assert (=> b!75043 m!120123))

(declare-fun m!120125 () Bool)

(assert (=> b!75043 m!120125))

(declare-fun m!120127 () Bool)

(assert (=> b!75043 m!120127))

(declare-fun m!120129 () Bool)

(assert (=> b!75043 m!120129))

(declare-fun m!120131 () Bool)

(assert (=> b!75043 m!120131))

(declare-fun m!120133 () Bool)

(assert (=> bm!959 m!120133))

(declare-fun m!120135 () Bool)

(assert (=> b!75045 m!120135))

(declare-fun m!120137 () Bool)

(assert (=> b!75045 m!120137))

(declare-fun m!120139 () Bool)

(assert (=> b!75050 m!120139))

(declare-fun m!120141 () Bool)

(assert (=> d!23830 m!120141))

(assert (=> d!23830 m!119833))

(assert (=> d!23742 d!23830))

(assert (=> b!74841 d!23734))

(declare-fun d!23858 () Bool)

(assert (=> d!23858 (arrayBitRangesEq!0 (buf!1810 thiss!1379) (buf!1810 thiss!1379) lt!120361 lt!120351)))

(declare-fun lt!120755 () Unit!4938)

(declare-fun choose!8 (array!3059 array!3059 (_ BitVec 64) (_ BitVec 64)) Unit!4938)

(assert (=> d!23858 (= lt!120755 (choose!8 (buf!1810 thiss!1379) (buf!1810 thiss!1379) lt!120361 lt!120351))))

(assert (=> d!23858 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120361) (bvsle lt!120361 lt!120351))))

(assert (=> d!23858 (= (arrayBitRangesEqSymmetric!0 (buf!1810 thiss!1379) (buf!1810 thiss!1379) lt!120361 lt!120351) lt!120755)))

(declare-fun bs!5734 () Bool)

(assert (= bs!5734 d!23858))

(assert (=> bs!5734 m!119843))

(declare-fun m!120143 () Bool)

(assert (=> bs!5734 m!120143))

(assert (=> b!74841 d!23858))

(declare-fun d!23860 () Bool)

(declare-fun res!62038 () Bool)

(declare-fun e!49086 () Bool)

(assert (=> d!23860 (=> res!62038 e!49086)))

(assert (=> d!23860 (= res!62038 (bvsge lt!120361 lt!120351))))

(assert (=> d!23860 (= (arrayBitRangesEq!0 (buf!1810 thiss!1379) (buf!1810 thiss!1379) lt!120361 lt!120351) e!49086)))

(declare-fun b!75051 () Bool)

(declare-fun res!62041 () Bool)

(declare-fun lt!120758 () (_ BitVec 32))

(assert (=> b!75051 (= res!62041 (= lt!120758 #b00000000000000000000000000000000))))

(declare-fun e!49088 () Bool)

(assert (=> b!75051 (=> res!62041 e!49088)))

(declare-fun e!49085 () Bool)

(assert (=> b!75051 (= e!49085 e!49088)))

(declare-fun b!75052 () Bool)

(declare-fun e!49084 () Bool)

(declare-fun e!49089 () Bool)

(assert (=> b!75052 (= e!49084 e!49089)))

(declare-fun c!5504 () Bool)

(declare-fun lt!120756 () tuple4!40)

(assert (=> b!75052 (= c!5504 (= (_3!121 lt!120756) (_4!20 lt!120756)))))

(declare-fun b!75053 () Bool)

(assert (=> b!75053 (= e!49088 (byteRangesEq!0 (select (arr!2023 (buf!1810 thiss!1379)) (_4!20 lt!120756)) (select (arr!2023 (buf!1810 thiss!1379)) (_4!20 lt!120756)) #b00000000000000000000000000000000 lt!120758))))

(declare-fun lt!120757 () (_ BitVec 32))

(declare-fun bm!960 () Bool)

(declare-fun call!963 () Bool)

(assert (=> bm!960 (= call!963 (byteRangesEq!0 (select (arr!2023 (buf!1810 thiss!1379)) (_3!121 lt!120756)) (select (arr!2023 (buf!1810 thiss!1379)) (_3!121 lt!120756)) lt!120757 (ite c!5504 lt!120758 #b00000000000000000000000000001000)))))

(declare-fun b!75054 () Bool)

(assert (=> b!75054 (= e!49086 e!49084)))

(declare-fun res!62037 () Bool)

(assert (=> b!75054 (=> (not res!62037) (not e!49084))))

(declare-fun e!49087 () Bool)

(assert (=> b!75054 (= res!62037 e!49087)))

(declare-fun res!62040 () Bool)

(assert (=> b!75054 (=> res!62040 e!49087)))

(assert (=> b!75054 (= res!62040 (bvsge (_1!3357 lt!120756) (_2!3357 lt!120756)))))

(assert (=> b!75054 (= lt!120758 ((_ extract 31 0) (bvsrem lt!120351 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75054 (= lt!120757 ((_ extract 31 0) (bvsrem lt!120361 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75054 (= lt!120756 (arrayBitIndices!0 lt!120361 lt!120351))))

(declare-fun b!75055 () Bool)

(assert (=> b!75055 (= e!49087 (arrayRangesEq!21 (buf!1810 thiss!1379) (buf!1810 thiss!1379) (_1!3357 lt!120756) (_2!3357 lt!120756)))))

(declare-fun b!75056 () Bool)

(assert (=> b!75056 (= e!49089 call!963)))

(declare-fun b!75057 () Bool)

(assert (=> b!75057 (= e!49089 e!49085)))

(declare-fun res!62039 () Bool)

(assert (=> b!75057 (= res!62039 call!963)))

(assert (=> b!75057 (=> (not res!62039) (not e!49085))))

(assert (= (and d!23860 (not res!62038)) b!75054))

(assert (= (and b!75054 (not res!62040)) b!75055))

(assert (= (and b!75054 res!62037) b!75052))

(assert (= (and b!75052 c!5504) b!75056))

(assert (= (and b!75052 (not c!5504)) b!75057))

(assert (= (and b!75057 res!62039) b!75051))

(assert (= (and b!75051 (not res!62041)) b!75053))

(assert (= (or b!75056 b!75057) bm!960))

(declare-fun m!120145 () Bool)

(assert (=> b!75053 m!120145))

(assert (=> b!75053 m!120145))

(assert (=> b!75053 m!120145))

(assert (=> b!75053 m!120145))

(declare-fun m!120147 () Bool)

(assert (=> b!75053 m!120147))

(declare-fun m!120149 () Bool)

(assert (=> bm!960 m!120149))

(assert (=> bm!960 m!120149))

(assert (=> bm!960 m!120149))

(assert (=> bm!960 m!120149))

(declare-fun m!120151 () Bool)

(assert (=> bm!960 m!120151))

(declare-fun m!120153 () Bool)

(assert (=> b!75054 m!120153))

(declare-fun m!120155 () Bool)

(assert (=> b!75055 m!120155))

(assert (=> b!74841 d!23860))

(assert (=> d!23758 d!23730))

(declare-fun d!23862 () Bool)

(declare-fun res!62042 () Bool)

(declare-fun e!49090 () Bool)

(assert (=> d!23862 (=> (not res!62042) (not e!49090))))

(assert (=> d!23862 (= res!62042 (= (size!1429 (buf!1810 lt!120354)) (size!1429 (buf!1810 thiss!1379))))))

(assert (=> d!23862 (= (isPrefixOf!0 lt!120354 thiss!1379) e!49090)))

(declare-fun b!75058 () Bool)

(declare-fun res!62043 () Bool)

(assert (=> b!75058 (=> (not res!62043) (not e!49090))))

(assert (=> b!75058 (= res!62043 (bvsle (bitIndex!0 (size!1429 (buf!1810 lt!120354)) (currentByte!3563 lt!120354) (currentBit!3558 lt!120354)) (bitIndex!0 (size!1429 (buf!1810 thiss!1379)) (currentByte!3563 thiss!1379) (currentBit!3558 thiss!1379))))))

(declare-fun b!75059 () Bool)

(declare-fun e!49091 () Bool)

(assert (=> b!75059 (= e!49090 e!49091)))

(declare-fun res!62044 () Bool)

(assert (=> b!75059 (=> res!62044 e!49091)))

(assert (=> b!75059 (= res!62044 (= (size!1429 (buf!1810 lt!120354)) #b00000000000000000000000000000000))))

(declare-fun b!75060 () Bool)

(assert (=> b!75060 (= e!49091 (arrayBitRangesEq!0 (buf!1810 lt!120354) (buf!1810 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1429 (buf!1810 lt!120354)) (currentByte!3563 lt!120354) (currentBit!3558 lt!120354))))))

(assert (= (and d!23862 res!62042) b!75058))

(assert (= (and b!75058 res!62043) b!75059))

(assert (= (and b!75059 (not res!62044)) b!75060))

(declare-fun m!120157 () Bool)

(assert (=> b!75058 m!120157))

(assert (=> b!75058 m!119743))

(assert (=> b!75060 m!120157))

(assert (=> b!75060 m!120157))

(declare-fun m!120159 () Bool)

(assert (=> b!75060 m!120159))

(assert (=> d!23758 d!23862))

(declare-fun d!23864 () Bool)

(declare-fun res!62045 () Bool)

(declare-fun e!49092 () Bool)

(assert (=> d!23864 (=> (not res!62045) (not e!49092))))

(assert (=> d!23864 (= res!62045 (= (size!1429 (buf!1810 (_1!3346 lt!120358))) (size!1429 (buf!1810 (_2!3346 lt!120358)))))))

(assert (=> d!23864 (= (isPrefixOf!0 (_1!3346 lt!120358) (_2!3346 lt!120358)) e!49092)))

(declare-fun b!75061 () Bool)

(declare-fun res!62046 () Bool)

(assert (=> b!75061 (=> (not res!62046) (not e!49092))))

(assert (=> b!75061 (= res!62046 (bvsle (bitIndex!0 (size!1429 (buf!1810 (_1!3346 lt!120358))) (currentByte!3563 (_1!3346 lt!120358)) (currentBit!3558 (_1!3346 lt!120358))) (bitIndex!0 (size!1429 (buf!1810 (_2!3346 lt!120358))) (currentByte!3563 (_2!3346 lt!120358)) (currentBit!3558 (_2!3346 lt!120358)))))))

(declare-fun b!75062 () Bool)

(declare-fun e!49093 () Bool)

(assert (=> b!75062 (= e!49092 e!49093)))

(declare-fun res!62047 () Bool)

(assert (=> b!75062 (=> res!62047 e!49093)))

(assert (=> b!75062 (= res!62047 (= (size!1429 (buf!1810 (_1!3346 lt!120358))) #b00000000000000000000000000000000))))

(declare-fun b!75063 () Bool)

(assert (=> b!75063 (= e!49093 (arrayBitRangesEq!0 (buf!1810 (_1!3346 lt!120358)) (buf!1810 (_2!3346 lt!120358)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1429 (buf!1810 (_1!3346 lt!120358))) (currentByte!3563 (_1!3346 lt!120358)) (currentBit!3558 (_1!3346 lt!120358)))))))

(assert (= (and d!23864 res!62045) b!75061))

(assert (= (and b!75061 res!62046) b!75062))

(assert (= (and b!75062 (not res!62047)) b!75063))

(assert (=> b!75061 m!119963))

(assert (=> b!75061 m!119953))

(assert (=> b!75063 m!119963))

(assert (=> b!75063 m!119963))

(declare-fun m!120161 () Bool)

(assert (=> b!75063 m!120161))

(assert (=> d!23758 d!23864))

(assert (=> d!23758 d!23732))

(declare-fun d!23866 () Bool)

(assert (=> d!23866 (isPrefixOf!0 lt!120354 lt!120354)))

(declare-fun lt!120759 () Unit!4938)

(assert (=> d!23866 (= lt!120759 (choose!11 lt!120354))))

(assert (=> d!23866 (= (lemmaIsPrefixRefl!0 lt!120354) lt!120759)))

(declare-fun bs!5735 () Bool)

(assert (= bs!5735 d!23866))

(assert (=> bs!5735 m!119851))

(declare-fun m!120163 () Bool)

(assert (=> bs!5735 m!120163))

(assert (=> d!23758 d!23866))

(declare-fun d!23868 () Bool)

(assert (=> d!23868 (isPrefixOf!0 lt!120354 thiss!1379)))

(declare-fun lt!120762 () Unit!4938)

(declare-fun choose!30 (BitStream!2432 BitStream!2432 BitStream!2432) Unit!4938)

(assert (=> d!23868 (= lt!120762 (choose!30 lt!120354 thiss!1379 thiss!1379))))

(assert (=> d!23868 (isPrefixOf!0 lt!120354 thiss!1379)))

(assert (=> d!23868 (= (lemmaIsPrefixTransitive!0 lt!120354 thiss!1379 thiss!1379) lt!120762)))

(declare-fun bs!5736 () Bool)

(assert (= bs!5736 d!23868))

(assert (=> bs!5736 m!119853))

(declare-fun m!120165 () Bool)

(assert (=> bs!5736 m!120165))

(assert (=> bs!5736 m!119853))

(assert (=> d!23758 d!23868))

(declare-fun d!23870 () Bool)

(declare-fun res!62048 () Bool)

(declare-fun e!49094 () Bool)

(assert (=> d!23870 (=> (not res!62048) (not e!49094))))

(assert (=> d!23870 (= res!62048 (= (size!1429 (buf!1810 lt!120354)) (size!1429 (buf!1810 lt!120354))))))

(assert (=> d!23870 (= (isPrefixOf!0 lt!120354 lt!120354) e!49094)))

(declare-fun b!75064 () Bool)

(declare-fun res!62049 () Bool)

(assert (=> b!75064 (=> (not res!62049) (not e!49094))))

(assert (=> b!75064 (= res!62049 (bvsle (bitIndex!0 (size!1429 (buf!1810 lt!120354)) (currentByte!3563 lt!120354) (currentBit!3558 lt!120354)) (bitIndex!0 (size!1429 (buf!1810 lt!120354)) (currentByte!3563 lt!120354) (currentBit!3558 lt!120354))))))

(declare-fun b!75065 () Bool)

(declare-fun e!49095 () Bool)

(assert (=> b!75065 (= e!49094 e!49095)))

(declare-fun res!62050 () Bool)

(assert (=> b!75065 (=> res!62050 e!49095)))

(assert (=> b!75065 (= res!62050 (= (size!1429 (buf!1810 lt!120354)) #b00000000000000000000000000000000))))

(declare-fun b!75066 () Bool)

(assert (=> b!75066 (= e!49095 (arrayBitRangesEq!0 (buf!1810 lt!120354) (buf!1810 lt!120354) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1429 (buf!1810 lt!120354)) (currentByte!3563 lt!120354) (currentBit!3558 lt!120354))))))

(assert (= (and d!23870 res!62048) b!75064))

(assert (= (and b!75064 res!62049) b!75065))

(assert (= (and b!75065 (not res!62050)) b!75066))

(assert (=> b!75064 m!120157))

(assert (=> b!75064 m!120157))

(assert (=> b!75066 m!120157))

(assert (=> b!75066 m!120157))

(declare-fun m!120167 () Bool)

(assert (=> b!75066 m!120167))

(assert (=> d!23758 d!23870))

(declare-fun d!23872 () Bool)

(declare-fun c!5507 () Bool)

(assert (=> d!23872 (= c!5507 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49098 () List!772)

(assert (=> d!23872 (= (byteArrayBitContentToList!0 (_2!3347 lt!120289) (_1!3347 lt!120289) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49098)))

(declare-fun b!75071 () Bool)

(assert (=> b!75071 (= e!49098 Nil!769)))

(declare-fun b!75072 () Bool)

(assert (=> b!75072 (= e!49098 (Cons!768 (not (= (bvand ((_ sign_extend 24) (select (arr!2023 (_1!3347 lt!120289)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3347 lt!120289) (_1!3347 lt!120289) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23872 c!5507) b!75071))

(assert (= (and d!23872 (not c!5507)) b!75072))

(declare-fun m!120169 () Bool)

(assert (=> b!75072 m!120169))

(assert (=> b!75072 m!119787))

(declare-fun m!120171 () Bool)

(assert (=> b!75072 m!120171))

(assert (=> b!74820 d!23872))

(declare-fun b!75081 () Bool)

(declare-datatypes ((tuple2!6476 0))(
  ( (tuple2!6477 (_1!3360 List!772) (_2!3360 BitStream!2432)) )
))
(declare-fun e!49104 () tuple2!6476)

(assert (=> b!75081 (= e!49104 (tuple2!6477 Nil!769 (_1!3346 lt!120138)))))

(declare-fun b!75083 () Bool)

(declare-fun e!49103 () Bool)

(declare-fun lt!120771 () List!772)

(declare-fun isEmpty!238 (List!772) Bool)

(assert (=> b!75083 (= e!49103 (isEmpty!238 lt!120771))))

(declare-fun b!75082 () Bool)

(declare-fun lt!120770 () tuple2!6472)

(declare-fun lt!120769 () (_ BitVec 64))

(assert (=> b!75082 (= e!49104 (tuple2!6477 (Cons!768 (_1!3358 lt!120770) (bitStreamReadBitsIntoList!0 (_2!3347 lt!120289) (_2!3358 lt!120770) (bvsub (bvsub to!314 i!635) lt!120769))) (_2!3358 lt!120770)))))

(assert (=> b!75082 (= lt!120770 (readBit!0 (_1!3346 lt!120138)))))

(assert (=> b!75082 (= lt!120769 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!75084 () Bool)

(declare-fun length!397 (List!772) Int)

(assert (=> b!75084 (= e!49103 (> (length!397 lt!120771) 0))))

(declare-fun d!23874 () Bool)

(assert (=> d!23874 e!49103))

(declare-fun c!5513 () Bool)

(assert (=> d!23874 (= c!5513 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23874 (= lt!120771 (_1!3360 e!49104))))

(declare-fun c!5512 () Bool)

(assert (=> d!23874 (= c!5512 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23874 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23874 (= (bitStreamReadBitsIntoList!0 (_2!3347 lt!120289) (_1!3346 lt!120138) (bvsub to!314 i!635)) lt!120771)))

(assert (= (and d!23874 c!5512) b!75081))

(assert (= (and d!23874 (not c!5512)) b!75082))

(assert (= (and d!23874 c!5513) b!75083))

(assert (= (and d!23874 (not c!5513)) b!75084))

(declare-fun m!120173 () Bool)

(assert (=> b!75083 m!120173))

(declare-fun m!120175 () Bool)

(assert (=> b!75082 m!120175))

(assert (=> b!75082 m!120115))

(declare-fun m!120177 () Bool)

(assert (=> b!75084 m!120177))

(assert (=> b!74820 d!23874))

(assert (=> d!23766 d!23810))

(push 1)

(assert (not d!23824))

(assert (not b!74937))

(assert (not b!75072))

(assert (not bm!959))

(assert (not b!74943))

(assert (not bm!958))

(assert (not b!74966))

(assert (not b!75063))

(assert (not b!75064))

(assert (not b!75053))

(assert (not b!75084))

(assert (not b!75049))

(assert (not d!23866))

(assert (not b!75060))

(assert (not b!75083))

(assert (not b!74967))

(assert (not d!23868))

(assert (not b!75043))

(assert (not b!75050))

(assert (not b!74941))

(assert (not b!75061))

(assert (not b!75045))

(assert (not b!75054))

(assert (not d!23858))

(assert (not d!23812))

(assert (not b!75066))

(assert (not b!74935))

(assert (not b!74949))

(assert (not d!23814))

(assert (not b!75082))

(assert (not d!23822))

(assert (not b!75044))

(assert (not b!75055))

(assert (not bm!946))

(assert (not b!75058))

(assert (not b!74968))

(assert (not b!75042))

(assert (not d!23830))

(assert (not bm!960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

