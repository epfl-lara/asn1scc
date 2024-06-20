; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14426 () Bool)

(assert start!14426)

(declare-fun b!74714 () Bool)

(declare-fun e!48885 () Bool)

(declare-datatypes ((array!3057 0))(
  ( (array!3058 (arr!2022 (Array (_ BitVec 32) (_ BitVec 8))) (size!1428 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2430 0))(
  ( (BitStream!2431 (buf!1809 array!3057) (currentByte!3562 (_ BitVec 32)) (currentBit!3557 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2430)

(declare-fun array_inv!1274 (array!3057) Bool)

(assert (=> b!74714 (= e!48885 (array_inv!1274 (buf!1809 thiss!1379)))))

(declare-fun res!61767 () Bool)

(declare-fun e!48888 () Bool)

(assert (=> start!14426 (=> (not res!61767) (not e!48888))))

(declare-fun srcBuffer!2 () array!3057)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14426 (= res!61767 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1428 srcBuffer!2))))))))

(assert (=> start!14426 e!48888))

(assert (=> start!14426 true))

(assert (=> start!14426 (array_inv!1274 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2430) Bool)

(assert (=> start!14426 (and (inv!12 thiss!1379) e!48885)))

(declare-fun b!74715 () Bool)

(declare-fun res!61768 () Bool)

(assert (=> b!74715 (=> (not res!61768) (not e!48888))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74715 (= res!61768 (validate_offset_bits!1 ((_ sign_extend 32) (size!1428 (buf!1809 thiss!1379))) ((_ sign_extend 32) (currentByte!3562 thiss!1379)) ((_ sign_extend 32) (currentBit!3557 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74716 () Bool)

(declare-fun e!48890 () Bool)

(assert (=> b!74716 (= e!48888 (not e!48890))))

(declare-fun res!61766 () Bool)

(assert (=> b!74716 (=> res!61766 e!48890)))

(declare-fun lt!120125 () (_ BitVec 64))

(assert (=> b!74716 (= res!61766 (or (bvslt i!635 to!314) (not (= lt!120125 (bvsub (bvadd lt!120125 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2430 BitStream!2430) Bool)

(assert (=> b!74716 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4936 0))(
  ( (Unit!4937) )
))
(declare-fun lt!120126 () Unit!4936)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2430) Unit!4936)

(assert (=> b!74716 (= lt!120126 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74716 (= lt!120125 (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379)))))

(declare-fun b!74717 () Bool)

(declare-fun res!61769 () Bool)

(assert (=> b!74717 (=> res!61769 e!48890)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74717 (= res!61769 (not (invariant!0 (currentBit!3557 thiss!1379) (currentByte!3562 thiss!1379) (size!1428 (buf!1809 thiss!1379)))))))

(declare-fun b!74718 () Bool)

(declare-fun e!48889 () Bool)

(assert (=> b!74718 (= e!48890 e!48889)))

(declare-fun res!61770 () Bool)

(assert (=> b!74718 (=> res!61770 e!48889)))

(assert (=> b!74718 (= res!61770 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6454 0))(
  ( (tuple2!6455 (_1!3344 array!3057) (_2!3344 BitStream!2430)) )
))
(declare-fun lt!120124 () tuple2!6454)

(declare-datatypes ((tuple2!6456 0))(
  ( (tuple2!6457 (_1!3345 BitStream!2430) (_2!3345 BitStream!2430)) )
))
(declare-fun lt!120127 () tuple2!6456)

(declare-fun readBits!0 (BitStream!2430 (_ BitVec 64)) tuple2!6454)

(assert (=> b!74718 (= lt!120124 (readBits!0 (_1!3345 lt!120127) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2430 BitStream!2430) tuple2!6456)

(assert (=> b!74718 (= lt!120127 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!74719 () Bool)

(assert (=> b!74719 (= e!48889 (inv!12 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))))))

(declare-fun checkByteArrayBitContent!0 (BitStream!2430 array!3057 array!3057 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74719 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3344 lt!120124) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!14426 res!61767) b!74715))

(assert (= (and b!74715 res!61768) b!74716))

(assert (= (and b!74716 (not res!61766)) b!74717))

(assert (= (and b!74717 (not res!61769)) b!74718))

(assert (= (and b!74718 (not res!61770)) b!74719))

(assert (= start!14426 b!74714))

(declare-fun m!119713 () Bool)

(assert (=> start!14426 m!119713))

(declare-fun m!119715 () Bool)

(assert (=> start!14426 m!119715))

(declare-fun m!119717 () Bool)

(assert (=> b!74716 m!119717))

(declare-fun m!119719 () Bool)

(assert (=> b!74716 m!119719))

(declare-fun m!119721 () Bool)

(assert (=> b!74716 m!119721))

(declare-fun m!119723 () Bool)

(assert (=> b!74719 m!119723))

(declare-fun m!119725 () Bool)

(assert (=> b!74719 m!119725))

(declare-fun m!119727 () Bool)

(assert (=> b!74718 m!119727))

(declare-fun m!119729 () Bool)

(assert (=> b!74718 m!119729))

(declare-fun m!119731 () Bool)

(assert (=> b!74715 m!119731))

(declare-fun m!119733 () Bool)

(assert (=> b!74717 m!119733))

(declare-fun m!119735 () Bool)

(assert (=> b!74714 m!119735))

(check-sat (not b!74718) (not b!74715) (not b!74719) (not b!74714) (not b!74717) (not start!14426) (not b!74716))
(check-sat)
(get-model)

(declare-fun b!74850 () Bool)

(declare-fun res!61886 () Bool)

(declare-fun e!48959 () Bool)

(assert (=> b!74850 (=> (not res!61886) (not e!48959))))

(declare-fun lt!120374 () tuple2!6454)

(assert (=> b!74850 (= res!61886 (bvsle (currentByte!3562 (_1!3345 lt!120127)) (currentByte!3562 (_2!3344 lt!120374))))))

(declare-fun b!74851 () Bool)

(declare-fun res!61890 () Bool)

(assert (=> b!74851 (=> (not res!61890) (not e!48959))))

(declare-fun lt!120382 () (_ BitVec 64))

(assert (=> b!74851 (= res!61890 (= (size!1428 (_1!3344 lt!120374)) ((_ extract 31 0) lt!120382)))))

(assert (=> b!74851 (and (bvslt lt!120382 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!120382 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!120375 () (_ BitVec 64))

(declare-fun lt!120376 () (_ BitVec 64))

(assert (=> b!74851 (= lt!120382 (bvsdiv lt!120375 lt!120376))))

(assert (=> b!74851 (and (not (= lt!120376 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!120375 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!120376 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!74851 (= lt!120376 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!120380 () (_ BitVec 64))

(declare-fun lt!120378 () (_ BitVec 64))

(assert (=> b!74851 (= lt!120375 (bvsub lt!120380 lt!120378))))

(assert (=> b!74851 (or (= (bvand lt!120380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120378 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120380 lt!120378) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74851 (= lt!120378 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!120381 () (_ BitVec 64))

(assert (=> b!74851 (= lt!120380 (bvadd (bvsub to!314 i!635) lt!120381))))

(assert (=> b!74851 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120381 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!120381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74851 (= lt!120381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!74853 () Bool)

(declare-fun res!61888 () Bool)

(assert (=> b!74853 (=> (not res!61888) (not e!48959))))

(assert (=> b!74853 (= res!61888 (invariant!0 (currentBit!3557 (_2!3344 lt!120374)) (currentByte!3562 (_2!3344 lt!120374)) (size!1428 (buf!1809 (_2!3344 lt!120374)))))))

(declare-fun b!74854 () Bool)

(declare-datatypes ((List!773 0))(
  ( (Nil!770) (Cons!769 (h!888 Bool) (t!1523 List!773)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2430 array!3057 (_ BitVec 64) (_ BitVec 64)) List!773)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2430 BitStream!2430 (_ BitVec 64)) List!773)

(assert (=> b!74854 (= e!48959 (= (byteArrayBitContentToList!0 (_2!3344 lt!120374) (_1!3344 lt!120374) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3344 lt!120374) (_1!3345 lt!120127) (bvsub to!314 i!635))))))

(declare-fun d!23760 () Bool)

(assert (=> d!23760 e!48959))

(declare-fun res!61887 () Bool)

(assert (=> d!23760 (=> (not res!61887) (not e!48959))))

(assert (=> d!23760 (= res!61887 (= (buf!1809 (_2!3344 lt!120374)) (buf!1809 (_1!3345 lt!120127))))))

(declare-datatypes ((tuple3!200 0))(
  ( (tuple3!201 (_1!3350 Unit!4936) (_2!3350 BitStream!2430) (_3!119 array!3057)) )
))
(declare-fun lt!120377 () tuple3!200)

(assert (=> d!23760 (= lt!120374 (tuple2!6455 (_3!119 lt!120377) (_2!3350 lt!120377)))))

(declare-fun readBitsLoop!0 (BitStream!2430 (_ BitVec 64) array!3057 (_ BitVec 64) (_ BitVec 64)) tuple3!200)

(assert (=> d!23760 (= lt!120377 (readBitsLoop!0 (_1!3345 lt!120127) (bvsub to!314 i!635) (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23760 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23760 (= (readBits!0 (_1!3345 lt!120127) (bvsub to!314 i!635)) lt!120374)))

(declare-fun b!74852 () Bool)

(declare-fun res!61889 () Bool)

(assert (=> b!74852 (=> (not res!61889) (not e!48959))))

(declare-fun lt!120379 () (_ BitVec 64))

(assert (=> b!74852 (= res!61889 (= (bvadd lt!120379 (bvsub to!314 i!635)) (bitIndex!0 (size!1428 (buf!1809 (_2!3344 lt!120374))) (currentByte!3562 (_2!3344 lt!120374)) (currentBit!3557 (_2!3344 lt!120374)))))))

(assert (=> b!74852 (or (not (= (bvand lt!120379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120379 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74852 (= lt!120379 (bitIndex!0 (size!1428 (buf!1809 (_1!3345 lt!120127))) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_1!3345 lt!120127))))))

(assert (= (and d!23760 res!61887) b!74852))

(assert (= (and b!74852 res!61889) b!74853))

(assert (= (and b!74853 res!61888) b!74851))

(assert (= (and b!74851 res!61890) b!74850))

(assert (= (and b!74850 res!61886) b!74854))

(declare-fun m!119861 () Bool)

(assert (=> b!74853 m!119861))

(declare-fun m!119863 () Bool)

(assert (=> b!74854 m!119863))

(declare-fun m!119865 () Bool)

(assert (=> b!74854 m!119865))

(declare-fun m!119867 () Bool)

(assert (=> d!23760 m!119867))

(declare-fun m!119869 () Bool)

(assert (=> b!74852 m!119869))

(declare-fun m!119871 () Bool)

(assert (=> b!74852 m!119871))

(assert (=> b!74718 d!23760))

(declare-fun e!48964 () Bool)

(declare-fun lt!120442 () tuple2!6456)

(declare-fun lt!120440 () (_ BitVec 64))

(declare-fun b!74865 () Bool)

(declare-fun lt!120424 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2430 (_ BitVec 64)) BitStream!2430)

(assert (=> b!74865 (= e!48964 (= (_1!3345 lt!120442) (withMovedBitIndex!0 (_2!3345 lt!120442) (bvsub lt!120424 lt!120440))))))

(assert (=> b!74865 (or (= (bvand lt!120424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120440 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120424 lt!120440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74865 (= lt!120440 (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379)))))

(assert (=> b!74865 (= lt!120424 (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379)))))

(declare-fun d!23770 () Bool)

(assert (=> d!23770 e!48964))

(declare-fun res!61898 () Bool)

(assert (=> d!23770 (=> (not res!61898) (not e!48964))))

(assert (=> d!23770 (= res!61898 (isPrefixOf!0 (_1!3345 lt!120442) (_2!3345 lt!120442)))))

(declare-fun lt!120439 () BitStream!2430)

(assert (=> d!23770 (= lt!120442 (tuple2!6457 lt!120439 thiss!1379))))

(declare-fun lt!120436 () Unit!4936)

(declare-fun lt!120434 () Unit!4936)

(assert (=> d!23770 (= lt!120436 lt!120434)))

(assert (=> d!23770 (isPrefixOf!0 lt!120439 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2430 BitStream!2430 BitStream!2430) Unit!4936)

(assert (=> d!23770 (= lt!120434 (lemmaIsPrefixTransitive!0 lt!120439 thiss!1379 thiss!1379))))

(declare-fun lt!120429 () Unit!4936)

(declare-fun lt!120437 () Unit!4936)

(assert (=> d!23770 (= lt!120429 lt!120437)))

(assert (=> d!23770 (isPrefixOf!0 lt!120439 thiss!1379)))

(assert (=> d!23770 (= lt!120437 (lemmaIsPrefixTransitive!0 lt!120439 thiss!1379 thiss!1379))))

(declare-fun lt!120427 () Unit!4936)

(declare-fun e!48965 () Unit!4936)

(assert (=> d!23770 (= lt!120427 e!48965)))

(declare-fun c!5481 () Bool)

(assert (=> d!23770 (= c!5481 (not (= (size!1428 (buf!1809 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!120438 () Unit!4936)

(declare-fun lt!120433 () Unit!4936)

(assert (=> d!23770 (= lt!120438 lt!120433)))

(assert (=> d!23770 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23770 (= lt!120433 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120431 () Unit!4936)

(declare-fun lt!120432 () Unit!4936)

(assert (=> d!23770 (= lt!120431 lt!120432)))

(assert (=> d!23770 (= lt!120432 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120426 () Unit!4936)

(declare-fun lt!120441 () Unit!4936)

(assert (=> d!23770 (= lt!120426 lt!120441)))

(assert (=> d!23770 (isPrefixOf!0 lt!120439 lt!120439)))

(assert (=> d!23770 (= lt!120441 (lemmaIsPrefixRefl!0 lt!120439))))

(declare-fun lt!120425 () Unit!4936)

(declare-fun lt!120435 () Unit!4936)

(assert (=> d!23770 (= lt!120425 lt!120435)))

(assert (=> d!23770 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23770 (= lt!120435 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23770 (= lt!120439 (BitStream!2431 (buf!1809 thiss!1379) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379)))))

(assert (=> d!23770 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23770 (= (reader!0 thiss!1379 thiss!1379) lt!120442)))

(declare-fun b!74866 () Bool)

(declare-fun Unit!4942 () Unit!4936)

(assert (=> b!74866 (= e!48965 Unit!4942)))

(declare-fun b!74867 () Bool)

(declare-fun res!61899 () Bool)

(assert (=> b!74867 (=> (not res!61899) (not e!48964))))

(assert (=> b!74867 (= res!61899 (isPrefixOf!0 (_2!3345 lt!120442) thiss!1379))))

(declare-fun b!74868 () Bool)

(declare-fun res!61897 () Bool)

(assert (=> b!74868 (=> (not res!61897) (not e!48964))))

(assert (=> b!74868 (= res!61897 (isPrefixOf!0 (_1!3345 lt!120442) thiss!1379))))

(declare-fun b!74869 () Bool)

(declare-fun lt!120428 () Unit!4936)

(assert (=> b!74869 (= e!48965 lt!120428)))

(declare-fun lt!120423 () (_ BitVec 64))

(assert (=> b!74869 (= lt!120423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120430 () (_ BitVec 64))

(assert (=> b!74869 (= lt!120430 (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3057 array!3057 (_ BitVec 64) (_ BitVec 64)) Unit!4936)

(assert (=> b!74869 (= lt!120428 (arrayBitRangesEqSymmetric!0 (buf!1809 thiss!1379) (buf!1809 thiss!1379) lt!120423 lt!120430))))

(declare-fun arrayBitRangesEq!0 (array!3057 array!3057 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74869 (arrayBitRangesEq!0 (buf!1809 thiss!1379) (buf!1809 thiss!1379) lt!120423 lt!120430)))

(assert (= (and d!23770 c!5481) b!74869))

(assert (= (and d!23770 (not c!5481)) b!74866))

(assert (= (and d!23770 res!61898) b!74868))

(assert (= (and b!74868 res!61897) b!74867))

(assert (= (and b!74867 res!61899) b!74865))

(declare-fun m!119873 () Bool)

(assert (=> d!23770 m!119873))

(assert (=> d!23770 m!119719))

(assert (=> d!23770 m!119719))

(declare-fun m!119875 () Bool)

(assert (=> d!23770 m!119875))

(declare-fun m!119877 () Bool)

(assert (=> d!23770 m!119877))

(declare-fun m!119879 () Bool)

(assert (=> d!23770 m!119879))

(assert (=> d!23770 m!119717))

(declare-fun m!119881 () Bool)

(assert (=> d!23770 m!119881))

(assert (=> d!23770 m!119881))

(assert (=> d!23770 m!119717))

(assert (=> d!23770 m!119717))

(declare-fun m!119883 () Bool)

(assert (=> b!74868 m!119883))

(declare-fun m!119885 () Bool)

(assert (=> b!74865 m!119885))

(assert (=> b!74865 m!119721))

(assert (=> b!74865 m!119721))

(declare-fun m!119887 () Bool)

(assert (=> b!74867 m!119887))

(assert (=> b!74869 m!119721))

(declare-fun m!119889 () Bool)

(assert (=> b!74869 m!119889))

(declare-fun m!119891 () Bool)

(assert (=> b!74869 m!119891))

(assert (=> b!74718 d!23770))

(declare-fun d!23772 () Bool)

(declare-fun res!61908 () Bool)

(declare-fun e!48971 () Bool)

(assert (=> d!23772 (=> (not res!61908) (not e!48971))))

(assert (=> d!23772 (= res!61908 (= (size!1428 (buf!1809 thiss!1379)) (size!1428 (buf!1809 thiss!1379))))))

(assert (=> d!23772 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48971)))

(declare-fun b!74876 () Bool)

(declare-fun res!61906 () Bool)

(assert (=> b!74876 (=> (not res!61906) (not e!48971))))

(assert (=> b!74876 (= res!61906 (bvsle (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379)) (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379))))))

(declare-fun b!74877 () Bool)

(declare-fun e!48970 () Bool)

(assert (=> b!74877 (= e!48971 e!48970)))

(declare-fun res!61907 () Bool)

(assert (=> b!74877 (=> res!61907 e!48970)))

(assert (=> b!74877 (= res!61907 (= (size!1428 (buf!1809 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74878 () Bool)

(assert (=> b!74878 (= e!48970 (arrayBitRangesEq!0 (buf!1809 thiss!1379) (buf!1809 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379))))))

(assert (= (and d!23772 res!61908) b!74876))

(assert (= (and b!74876 res!61906) b!74877))

(assert (= (and b!74877 (not res!61907)) b!74878))

(assert (=> b!74876 m!119721))

(assert (=> b!74876 m!119721))

(assert (=> b!74878 m!119721))

(assert (=> b!74878 m!119721))

(declare-fun m!119893 () Bool)

(assert (=> b!74878 m!119893))

(assert (=> b!74716 d!23772))

(declare-fun d!23774 () Bool)

(assert (=> d!23774 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!120445 () Unit!4936)

(declare-fun choose!11 (BitStream!2430) Unit!4936)

(assert (=> d!23774 (= lt!120445 (choose!11 thiss!1379))))

(assert (=> d!23774 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!120445)))

(declare-fun bs!5723 () Bool)

(assert (= bs!5723 d!23774))

(assert (=> bs!5723 m!119717))

(declare-fun m!119895 () Bool)

(assert (=> bs!5723 m!119895))

(assert (=> b!74716 d!23774))

(declare-fun d!23776 () Bool)

(declare-fun e!48974 () Bool)

(assert (=> d!23776 e!48974))

(declare-fun res!61914 () Bool)

(assert (=> d!23776 (=> (not res!61914) (not e!48974))))

(declare-fun lt!120462 () (_ BitVec 64))

(declare-fun lt!120459 () (_ BitVec 64))

(declare-fun lt!120458 () (_ BitVec 64))

(assert (=> d!23776 (= res!61914 (= lt!120462 (bvsub lt!120458 lt!120459)))))

(assert (=> d!23776 (or (= (bvand lt!120458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120458 lt!120459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23776 (= lt!120459 (remainingBits!0 ((_ sign_extend 32) (size!1428 (buf!1809 thiss!1379))) ((_ sign_extend 32) (currentByte!3562 thiss!1379)) ((_ sign_extend 32) (currentBit!3557 thiss!1379))))))

(declare-fun lt!120461 () (_ BitVec 64))

(declare-fun lt!120460 () (_ BitVec 64))

(assert (=> d!23776 (= lt!120458 (bvmul lt!120461 lt!120460))))

(assert (=> d!23776 (or (= lt!120461 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!120460 (bvsdiv (bvmul lt!120461 lt!120460) lt!120461)))))

(assert (=> d!23776 (= lt!120460 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23776 (= lt!120461 ((_ sign_extend 32) (size!1428 (buf!1809 thiss!1379))))))

(assert (=> d!23776 (= lt!120462 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3562 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3557 thiss!1379))))))

(assert (=> d!23776 (invariant!0 (currentBit!3557 thiss!1379) (currentByte!3562 thiss!1379) (size!1428 (buf!1809 thiss!1379)))))

(assert (=> d!23776 (= (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379)) lt!120462)))

(declare-fun b!74883 () Bool)

(declare-fun res!61913 () Bool)

(assert (=> b!74883 (=> (not res!61913) (not e!48974))))

(assert (=> b!74883 (= res!61913 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120462))))

(declare-fun b!74884 () Bool)

(declare-fun lt!120463 () (_ BitVec 64))

(assert (=> b!74884 (= e!48974 (bvsle lt!120462 (bvmul lt!120463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74884 (or (= lt!120463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!120463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!120463)))))

(assert (=> b!74884 (= lt!120463 ((_ sign_extend 32) (size!1428 (buf!1809 thiss!1379))))))

(assert (= (and d!23776 res!61914) b!74883))

(assert (= (and b!74883 res!61913) b!74884))

(declare-fun m!119897 () Bool)

(assert (=> d!23776 m!119897))

(assert (=> d!23776 m!119733))

(assert (=> b!74716 d!23776))

(declare-fun d!23778 () Bool)

(assert (=> d!23778 (= (invariant!0 (currentBit!3557 thiss!1379) (currentByte!3562 thiss!1379) (size!1428 (buf!1809 thiss!1379))) (and (bvsge (currentBit!3557 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3557 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3562 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3562 thiss!1379) (size!1428 (buf!1809 thiss!1379))) (and (= (currentBit!3557 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3562 thiss!1379) (size!1428 (buf!1809 thiss!1379)))))))))

(assert (=> b!74717 d!23778))

(declare-fun d!23780 () Bool)

(assert (=> d!23780 (= (array_inv!1274 srcBuffer!2) (bvsge (size!1428 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14426 d!23780))

(declare-fun d!23782 () Bool)

(assert (=> d!23782 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3557 thiss!1379) (currentByte!3562 thiss!1379) (size!1428 (buf!1809 thiss!1379))))))

(declare-fun bs!5724 () Bool)

(assert (= bs!5724 d!23782))

(assert (=> bs!5724 m!119733))

(assert (=> start!14426 d!23782))

(declare-fun d!23784 () Bool)

(assert (=> d!23784 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1428 (buf!1809 thiss!1379))) ((_ sign_extend 32) (currentByte!3562 thiss!1379)) ((_ sign_extend 32) (currentBit!3557 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1428 (buf!1809 thiss!1379))) ((_ sign_extend 32) (currentByte!3562 thiss!1379)) ((_ sign_extend 32) (currentBit!3557 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5725 () Bool)

(assert (= bs!5725 d!23784))

(assert (=> bs!5725 m!119897))

(assert (=> b!74715 d!23784))

(declare-fun d!23786 () Bool)

(assert (=> d!23786 (= (inv!12 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) (invariant!0 (currentBit!3557 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) (currentByte!3562 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) (size!1428 (buf!1809 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))))))))

(declare-fun bs!5726 () Bool)

(assert (= bs!5726 d!23786))

(declare-fun m!119899 () Bool)

(assert (=> bs!5726 m!119899))

(assert (=> b!74719 d!23786))

(declare-fun d!23788 () Bool)

(declare-fun res!61919 () Bool)

(declare-fun e!48979 () Bool)

(assert (=> d!23788 (=> res!61919 e!48979)))

(assert (=> d!23788 (= res!61919 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23788 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3344 lt!120124) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!48979)))

(declare-fun b!74889 () Bool)

(declare-fun e!48980 () Bool)

(assert (=> b!74889 (= e!48979 e!48980)))

(declare-fun res!61920 () Bool)

(assert (=> b!74889 (=> (not res!61920) (not e!48980))))

(assert (=> b!74889 (= res!61920 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2022 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2022 (_1!3344 lt!120124)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!74890 () Bool)

(assert (=> b!74890 (= e!48980 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3344 lt!120124) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23788 (not res!61919)) b!74889))

(assert (= (and b!74889 res!61920) b!74890))

(declare-fun m!119901 () Bool)

(assert (=> b!74889 m!119901))

(declare-fun m!119903 () Bool)

(assert (=> b!74889 m!119903))

(declare-fun m!119905 () Bool)

(assert (=> b!74889 m!119905))

(declare-fun m!119907 () Bool)

(assert (=> b!74889 m!119907))

(declare-fun m!119909 () Bool)

(assert (=> b!74890 m!119909))

(assert (=> b!74719 d!23788))

(declare-fun d!23790 () Bool)

(assert (=> d!23790 (= (array_inv!1274 (buf!1809 thiss!1379)) (bvsge (size!1428 (buf!1809 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74714 d!23790))

(check-sat (not b!74878) (not d!23776) (not b!74852) (not b!74876) (not d!23786) (not d!23760) (not d!23782) (not b!74854) (not b!74868) (not b!74890) (not b!74853) (not d!23784) (not b!74865) (not b!74869) (not d!23770) (not d!23774) (not b!74867))
(check-sat)
(get-model)

(declare-fun d!23792 () Bool)

(assert (=> d!23792 (= (invariant!0 (currentBit!3557 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) (currentByte!3562 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) (size!1428 (buf!1809 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))))) (and (bvsge (currentBit!3557 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) #b00000000000000000000000000000000) (bvslt (currentBit!3557 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) #b00000000000000000000000000001000) (bvsge (currentByte!3562 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!3562 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) (size!1428 (buf!1809 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))))) (and (= (currentBit!3557 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) #b00000000000000000000000000000000) (= (currentByte!3562 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124)))) (size!1428 (buf!1809 (BitStream!2431 (buf!1809 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_2!3344 lt!120124))))))))))))

(assert (=> d!23786 d!23792))

(declare-fun d!23794 () Bool)

(declare-fun c!5484 () Bool)

(assert (=> d!23794 (= c!5484 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!48983 () List!773)

(assert (=> d!23794 (= (byteArrayBitContentToList!0 (_2!3344 lt!120374) (_1!3344 lt!120374) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!48983)))

(declare-fun b!74895 () Bool)

(assert (=> b!74895 (= e!48983 Nil!770)))

(declare-fun b!74896 () Bool)

(assert (=> b!74896 (= e!48983 (Cons!769 (not (= (bvand ((_ sign_extend 24) (select (arr!2022 (_1!3344 lt!120374)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3344 lt!120374) (_1!3344 lt!120374) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23794 c!5484) b!74895))

(assert (= (and d!23794 (not c!5484)) b!74896))

(declare-fun m!119911 () Bool)

(assert (=> b!74896 m!119911))

(assert (=> b!74896 m!119907))

(declare-fun m!119913 () Bool)

(assert (=> b!74896 m!119913))

(assert (=> b!74854 d!23794))

(declare-fun b!74907 () Bool)

(declare-fun e!48988 () Bool)

(declare-fun lt!120471 () List!773)

(declare-fun isEmpty!237 (List!773) Bool)

(assert (=> b!74907 (= e!48988 (isEmpty!237 lt!120471))))

(declare-fun b!74908 () Bool)

(declare-fun length!396 (List!773) Int)

(assert (=> b!74908 (= e!48988 (> (length!396 lt!120471) 0))))

(declare-fun b!74905 () Bool)

(declare-datatypes ((tuple2!6462 0))(
  ( (tuple2!6463 (_1!3351 List!773) (_2!3351 BitStream!2430)) )
))
(declare-fun e!48989 () tuple2!6462)

(assert (=> b!74905 (= e!48989 (tuple2!6463 Nil!770 (_1!3345 lt!120127)))))

(declare-fun b!74906 () Bool)

(declare-fun lt!120470 () (_ BitVec 64))

(declare-datatypes ((tuple2!6464 0))(
  ( (tuple2!6465 (_1!3352 Bool) (_2!3352 BitStream!2430)) )
))
(declare-fun lt!120472 () tuple2!6464)

(assert (=> b!74906 (= e!48989 (tuple2!6463 (Cons!769 (_1!3352 lt!120472) (bitStreamReadBitsIntoList!0 (_2!3344 lt!120374) (_2!3352 lt!120472) (bvsub (bvsub to!314 i!635) lt!120470))) (_2!3352 lt!120472)))))

(declare-fun readBit!0 (BitStream!2430) tuple2!6464)

(assert (=> b!74906 (= lt!120472 (readBit!0 (_1!3345 lt!120127)))))

(assert (=> b!74906 (= lt!120470 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!23796 () Bool)

(assert (=> d!23796 e!48988))

(declare-fun c!5490 () Bool)

(assert (=> d!23796 (= c!5490 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23796 (= lt!120471 (_1!3351 e!48989))))

(declare-fun c!5489 () Bool)

(assert (=> d!23796 (= c!5489 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23796 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23796 (= (bitStreamReadBitsIntoList!0 (_2!3344 lt!120374) (_1!3345 lt!120127) (bvsub to!314 i!635)) lt!120471)))

(assert (= (and d!23796 c!5489) b!74905))

(assert (= (and d!23796 (not c!5489)) b!74906))

(assert (= (and d!23796 c!5490) b!74907))

(assert (= (and d!23796 (not c!5490)) b!74908))

(declare-fun m!119915 () Bool)

(assert (=> b!74907 m!119915))

(declare-fun m!119917 () Bool)

(assert (=> b!74908 m!119917))

(declare-fun m!119919 () Bool)

(assert (=> b!74906 m!119919))

(declare-fun m!119921 () Bool)

(assert (=> b!74906 m!119921))

(assert (=> b!74854 d!23796))

(declare-fun d!23798 () Bool)

(declare-fun e!48992 () Bool)

(assert (=> d!23798 e!48992))

(declare-fun res!61923 () Bool)

(assert (=> d!23798 (=> (not res!61923) (not e!48992))))

(declare-fun lt!120478 () (_ BitVec 64))

(declare-fun lt!120477 () BitStream!2430)

(assert (=> d!23798 (= res!61923 (= (bvadd lt!120478 (bvsub lt!120424 lt!120440)) (bitIndex!0 (size!1428 (buf!1809 lt!120477)) (currentByte!3562 lt!120477) (currentBit!3557 lt!120477))))))

(assert (=> d!23798 (or (not (= (bvand lt!120478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120424 lt!120440) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120478 (bvsub lt!120424 lt!120440)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23798 (= lt!120478 (bitIndex!0 (size!1428 (buf!1809 (_2!3345 lt!120442))) (currentByte!3562 (_2!3345 lt!120442)) (currentBit!3557 (_2!3345 lt!120442))))))

(declare-datatypes ((tuple2!6466 0))(
  ( (tuple2!6467 (_1!3353 Unit!4936) (_2!3353 BitStream!2430)) )
))
(declare-fun moveBitIndex!0 (BitStream!2430 (_ BitVec 64)) tuple2!6466)

(assert (=> d!23798 (= lt!120477 (_2!3353 (moveBitIndex!0 (_2!3345 lt!120442) (bvsub lt!120424 lt!120440))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!2430 (_ BitVec 64)) Bool)

(assert (=> d!23798 (moveBitIndexPrecond!0 (_2!3345 lt!120442) (bvsub lt!120424 lt!120440))))

(assert (=> d!23798 (= (withMovedBitIndex!0 (_2!3345 lt!120442) (bvsub lt!120424 lt!120440)) lt!120477)))

(declare-fun b!74911 () Bool)

(assert (=> b!74911 (= e!48992 (= (size!1428 (buf!1809 (_2!3345 lt!120442))) (size!1428 (buf!1809 lt!120477))))))

(assert (= (and d!23798 res!61923) b!74911))

(declare-fun m!119923 () Bool)

(assert (=> d!23798 m!119923))

(declare-fun m!119925 () Bool)

(assert (=> d!23798 m!119925))

(declare-fun m!119927 () Bool)

(assert (=> d!23798 m!119927))

(declare-fun m!119929 () Bool)

(assert (=> d!23798 m!119929))

(assert (=> b!74865 d!23798))

(assert (=> b!74865 d!23776))

(assert (=> b!74876 d!23776))

(declare-fun d!23800 () Bool)

(assert (=> d!23800 (= (invariant!0 (currentBit!3557 (_2!3344 lt!120374)) (currentByte!3562 (_2!3344 lt!120374)) (size!1428 (buf!1809 (_2!3344 lt!120374)))) (and (bvsge (currentBit!3557 (_2!3344 lt!120374)) #b00000000000000000000000000000000) (bvslt (currentBit!3557 (_2!3344 lt!120374)) #b00000000000000000000000000001000) (bvsge (currentByte!3562 (_2!3344 lt!120374)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3562 (_2!3344 lt!120374)) (size!1428 (buf!1809 (_2!3344 lt!120374)))) (and (= (currentBit!3557 (_2!3344 lt!120374)) #b00000000000000000000000000000000) (= (currentByte!3562 (_2!3344 lt!120374)) (size!1428 (buf!1809 (_2!3344 lt!120374))))))))))

(assert (=> b!74853 d!23800))

(declare-fun d!23802 () Bool)

(declare-fun res!61935 () Bool)

(declare-fun e!49009 () Bool)

(assert (=> d!23802 (=> res!61935 e!49009)))

(assert (=> d!23802 (= res!61935 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379))))))

(assert (=> d!23802 (= (arrayBitRangesEq!0 (buf!1809 thiss!1379) (buf!1809 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379))) e!49009)))

(declare-fun b!74926 () Bool)

(declare-fun e!49006 () Bool)

(declare-fun call!946 () Bool)

(assert (=> b!74926 (= e!49006 call!946)))

(declare-fun c!5493 () Bool)

(declare-fun lt!120486 () (_ BitVec 32))

(declare-fun lt!120487 () (_ BitVec 32))

(declare-fun bm!943 () Bool)

(declare-datatypes ((tuple4!38 0))(
  ( (tuple4!39 (_1!3354 (_ BitVec 32)) (_2!3354 (_ BitVec 32)) (_3!120 (_ BitVec 32)) (_4!19 (_ BitVec 32))) )
))
(declare-fun lt!120485 () tuple4!38)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!943 (= call!946 (byteRangesEq!0 (ite c!5493 (select (arr!2022 (buf!1809 thiss!1379)) (_3!120 lt!120485)) (select (arr!2022 (buf!1809 thiss!1379)) (_4!19 lt!120485))) (ite c!5493 (select (arr!2022 (buf!1809 thiss!1379)) (_3!120 lt!120485)) (select (arr!2022 (buf!1809 thiss!1379)) (_4!19 lt!120485))) (ite c!5493 lt!120486 #b00000000000000000000000000000000) lt!120487))))

(declare-fun b!74927 () Bool)

(declare-fun e!49007 () Bool)

(declare-fun arrayRangesEq!20 (array!3057 array!3057 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74927 (= e!49007 (arrayRangesEq!20 (buf!1809 thiss!1379) (buf!1809 thiss!1379) (_1!3354 lt!120485) (_2!3354 lt!120485)))))

(declare-fun b!74928 () Bool)

(declare-fun e!49008 () Bool)

(assert (=> b!74928 (= e!49008 call!946)))

(declare-fun b!74929 () Bool)

(declare-fun e!49010 () Bool)

(assert (=> b!74929 (= e!49010 e!49008)))

(assert (=> b!74929 (= c!5493 (= (_3!120 lt!120485) (_4!19 lt!120485)))))

(declare-fun b!74930 () Bool)

(declare-fun e!49005 () Bool)

(assert (=> b!74930 (= e!49008 e!49005)))

(declare-fun res!61934 () Bool)

(assert (=> b!74930 (= res!61934 (byteRangesEq!0 (select (arr!2022 (buf!1809 thiss!1379)) (_3!120 lt!120485)) (select (arr!2022 (buf!1809 thiss!1379)) (_3!120 lt!120485)) lt!120486 #b00000000000000000000000000001000))))

(assert (=> b!74930 (=> (not res!61934) (not e!49005))))

(declare-fun b!74931 () Bool)

(assert (=> b!74931 (= e!49009 e!49010)))

(declare-fun res!61938 () Bool)

(assert (=> b!74931 (=> (not res!61938) (not e!49010))))

(assert (=> b!74931 (= res!61938 e!49007)))

(declare-fun res!61937 () Bool)

(assert (=> b!74931 (=> res!61937 e!49007)))

(assert (=> b!74931 (= res!61937 (bvsge (_1!3354 lt!120485) (_2!3354 lt!120485)))))

(assert (=> b!74931 (= lt!120487 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74931 (= lt!120486 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!38)

(assert (=> b!74931 (= lt!120485 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379))))))

(declare-fun b!74932 () Bool)

(declare-fun res!61936 () Bool)

(assert (=> b!74932 (= res!61936 (= lt!120487 #b00000000000000000000000000000000))))

(assert (=> b!74932 (=> res!61936 e!49006)))

(assert (=> b!74932 (= e!49005 e!49006)))

(assert (= (and d!23802 (not res!61935)) b!74931))

(assert (= (and b!74931 (not res!61937)) b!74927))

(assert (= (and b!74931 res!61938) b!74929))

(assert (= (and b!74929 c!5493) b!74928))

(assert (= (and b!74929 (not c!5493)) b!74930))

(assert (= (and b!74930 res!61934) b!74932))

(assert (= (and b!74932 (not res!61936)) b!74926))

(assert (= (or b!74928 b!74926) bm!943))

(declare-fun m!119931 () Bool)

(assert (=> bm!943 m!119931))

(declare-fun m!119933 () Bool)

(assert (=> bm!943 m!119933))

(assert (=> bm!943 m!119933))

(declare-fun m!119935 () Bool)

(assert (=> bm!943 m!119935))

(assert (=> bm!943 m!119931))

(declare-fun m!119937 () Bool)

(assert (=> b!74927 m!119937))

(assert (=> b!74930 m!119931))

(assert (=> b!74930 m!119931))

(assert (=> b!74930 m!119931))

(assert (=> b!74930 m!119931))

(declare-fun m!119939 () Bool)

(assert (=> b!74930 m!119939))

(assert (=> b!74931 m!119721))

(declare-fun m!119941 () Bool)

(assert (=> b!74931 m!119941))

(assert (=> b!74878 d!23802))

(assert (=> b!74878 d!23776))

(declare-fun d!23804 () Bool)

(declare-fun res!61939 () Bool)

(declare-fun e!49011 () Bool)

(assert (=> d!23804 (=> res!61939 e!49011)))

(assert (=> d!23804 (= res!61939 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23804 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3344 lt!120124) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) e!49011)))

(declare-fun b!74933 () Bool)

(declare-fun e!49012 () Bool)

(assert (=> b!74933 (= e!49011 e!49012)))

(declare-fun res!61940 () Bool)

(assert (=> b!74933 (=> (not res!61940) (not e!49012))))

(assert (=> b!74933 (= res!61940 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2022 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2022 (_1!3344 lt!120124)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!74934 () Bool)

(assert (=> b!74934 (= e!49012 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3344 lt!120124) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23804 (not res!61939)) b!74933))

(assert (= (and b!74933 res!61940) b!74934))

(declare-fun m!119943 () Bool)

(assert (=> b!74933 m!119943))

(declare-fun m!119945 () Bool)

(assert (=> b!74933 m!119945))

(declare-fun m!119947 () Bool)

(assert (=> b!74933 m!119947))

(declare-fun m!119949 () Bool)

(assert (=> b!74933 m!119949))

(declare-fun m!119951 () Bool)

(assert (=> b!74934 m!119951))

(assert (=> b!74890 d!23804))

(declare-fun e!49052 () Bool)

(declare-fun lt!120613 () tuple3!200)

(declare-fun b!74989 () Bool)

(assert (=> b!74989 (= e!49052 (and (= (buf!1809 (_1!3345 lt!120127)) (buf!1809 (_2!3350 lt!120613))) (= (size!1428 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1428 (_3!119 lt!120613)))))))

(declare-fun e!49050 () tuple3!200)

(declare-fun lt!120617 () Unit!4936)

(declare-fun b!74990 () Bool)

(assert (=> b!74990 (= e!49050 (tuple3!201 lt!120617 (_1!3345 lt!120127) (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!120598 () Unit!4936)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!3057) Unit!4936)

(assert (=> b!74990 (= lt!120598 (arrayBitRangesEqReflexiveLemma!0 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun call!954 () Bool)

(assert (=> b!74990 call!954))

(declare-fun lt!120596 () Unit!4936)

(assert (=> b!74990 (= lt!120596 lt!120598)))

(declare-fun lt!120593 () array!3057)

(assert (=> b!74990 (= lt!120593 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!120590 () array!3057)

(assert (=> b!74990 (= lt!120590 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!120620 () (_ BitVec 64))

(assert (=> b!74990 (= lt!120620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120603 () (_ BitVec 64))

(assert (=> b!74990 (= lt!120603 ((_ sign_extend 32) (size!1428 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!120600 () (_ BitVec 64))

(assert (=> b!74990 (= lt!120600 (bvmul lt!120603 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!120601 () (_ BitVec 64))

(assert (=> b!74990 (= lt!120601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120605 () (_ BitVec 64))

(assert (=> b!74990 (= lt!120605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!3057 array!3057 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4936)

(assert (=> b!74990 (= lt!120617 (arrayBitRangesEqSlicedLemma!0 lt!120593 lt!120590 lt!120620 lt!120600 lt!120601 lt!120605))))

(declare-fun call!955 () Bool)

(assert (=> b!74990 call!955))

(declare-fun b!74991 () Bool)

(declare-fun e!49053 () Bool)

(declare-fun lt!120597 () tuple3!200)

(assert (=> b!74991 (= e!49053 (= (byteArrayBitContentToList!0 (_2!3350 lt!120597) (_3!119 lt!120597) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!3350 lt!120597) (_1!3345 lt!120127) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!74991 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74991 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!74992 () Bool)

(declare-fun res!61986 () Bool)

(assert (=> b!74992 (=> (not res!61986) (not e!49053))))

(assert (=> b!74992 (= res!61986 (arrayBitRangesEq!0 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!119 lt!120597) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!23806 () Bool)

(assert (=> d!23806 e!49053))

(declare-fun res!61990 () Bool)

(assert (=> d!23806 (=> (not res!61990) (not e!49053))))

(declare-fun lt!120611 () (_ BitVec 64))

(assert (=> d!23806 (= res!61990 (= (bvsub lt!120611 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1428 (buf!1809 (_2!3350 lt!120597))) (currentByte!3562 (_2!3350 lt!120597)) (currentBit!3557 (_2!3350 lt!120597)))))))

(assert (=> d!23806 (or (= (bvand lt!120611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120611 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!120615 () (_ BitVec 64))

(assert (=> d!23806 (= lt!120611 (bvadd lt!120615 (bvsub to!314 i!635)))))

(assert (=> d!23806 (or (not (= (bvand lt!120615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120615 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23806 (= lt!120615 (bitIndex!0 (size!1428 (buf!1809 (_1!3345 lt!120127))) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_1!3345 lt!120127))))))

(assert (=> d!23806 (= lt!120597 e!49050)))

(declare-fun c!5499 () Bool)

(assert (=> d!23806 (= c!5499 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23806 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23806 (= (readBitsLoop!0 (_1!3345 lt!120127) (bvsub to!314 i!635) (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) lt!120597)))

(declare-fun b!74993 () Bool)

(declare-fun res!61985 () Bool)

(assert (=> b!74993 (=> (not res!61985) (not e!49053))))

(declare-fun e!49051 () Bool)

(assert (=> b!74993 (= res!61985 e!49051)))

(declare-fun res!61989 () Bool)

(assert (=> b!74993 (=> res!61989 e!49051)))

(assert (=> b!74993 (= res!61989 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))))

(declare-fun lt!120588 () (_ BitVec 32))

(declare-fun lt!120599 () tuple2!6464)

(declare-fun bm!951 () Bool)

(declare-fun lt!120608 () (_ BitVec 32))

(assert (=> bm!951 (= call!954 (arrayBitRangesEq!0 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5499 (array!3058 (store (arr!2022 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!120608 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2022 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!120608)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!120588)))) ((_ sign_extend 24) (ite (_1!3352 lt!120599) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!120588) #b00000000))))) (size!1428 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5499 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1428 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!74994 () Bool)

(declare-fun bitAt!0 (array!3057 (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!6468 0))(
  ( (tuple2!6469 (_1!3355 BitStream!2430) (_2!3355 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2430) tuple2!6468)

(assert (=> b!74994 (= e!49051 (= (bitAt!0 (_3!119 lt!120597) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!3355 (readBitPure!0 (_1!3345 lt!120127)))))))

(declare-fun b!74995 () Bool)

(declare-fun lt!120616 () Unit!4936)

(assert (=> b!74995 (= e!49050 (tuple3!201 lt!120616 (_2!3350 lt!120613) (_3!119 lt!120613)))))

(assert (=> b!74995 (= lt!120599 (readBit!0 (_1!3345 lt!120127)))))

(declare-fun lt!120621 () (_ BitVec 32))

(assert (=> b!74995 (= lt!120621 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!120619 () (_ BitVec 32))

(assert (=> b!74995 (= lt!120619 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!120602 () array!3057)

(assert (=> b!74995 (= lt!120602 (array!3058 (store (arr!2022 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!120621 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2022 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!120621)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!120619)))) ((_ sign_extend 24) (ite (_1!3352 lt!120599) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!120619) #b00000000))))) (size!1428 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!120595 () (_ BitVec 64))

(assert (=> b!74995 (= lt!120595 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!120606 () (_ BitVec 64))

(assert (=> b!74995 (= lt!120606 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!120612 () Unit!4936)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2430 BitStream!2430 (_ BitVec 64) (_ BitVec 64)) Unit!4936)

(assert (=> b!74995 (= lt!120612 (validateOffsetBitsIneqLemma!0 (_1!3345 lt!120127) (_2!3352 lt!120599) lt!120595 lt!120606))))

(assert (=> b!74995 (validate_offset_bits!1 ((_ sign_extend 32) (size!1428 (buf!1809 (_2!3352 lt!120599)))) ((_ sign_extend 32) (currentByte!3562 (_2!3352 lt!120599))) ((_ sign_extend 32) (currentBit!3557 (_2!3352 lt!120599))) (bvsub lt!120595 lt!120606))))

(declare-fun lt!120607 () Unit!4936)

(assert (=> b!74995 (= lt!120607 lt!120612)))

(assert (=> b!74995 (= lt!120613 (readBitsLoop!0 (_2!3352 lt!120599) (bvsub to!314 i!635) lt!120602 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 i!635)))))

(declare-fun res!61988 () Bool)

(assert (=> b!74995 (= res!61988 (= (bvsub (bvadd (bitIndex!0 (size!1428 (buf!1809 (_1!3345 lt!120127))) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_1!3345 lt!120127))) (bvsub to!314 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1428 (buf!1809 (_2!3350 lt!120613))) (currentByte!3562 (_2!3350 lt!120613)) (currentBit!3557 (_2!3350 lt!120613)))))))

(assert (=> b!74995 (=> (not res!61988) (not e!49052))))

(assert (=> b!74995 e!49052))

(declare-fun lt!120592 () Unit!4936)

(declare-fun Unit!4943 () Unit!4936)

(assert (=> b!74995 (= lt!120592 Unit!4943)))

(assert (=> b!74995 (= lt!120608 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74995 (= lt!120588 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!120610 () Unit!4936)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!3057 (_ BitVec 64) Bool) Unit!4936)

(assert (=> b!74995 (= lt!120610 (arrayBitRangesUpdatedAtLemma!0 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3352 lt!120599)))))

(assert (=> b!74995 call!954))

(declare-fun lt!120591 () Unit!4936)

(assert (=> b!74995 (= lt!120591 lt!120610)))

(declare-fun lt!120604 () (_ BitVec 64))

(assert (=> b!74995 (= lt!120604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120622 () Unit!4936)

(declare-fun arrayBitRangesEqTransitive!0 (array!3057 array!3057 array!3057 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4936)

(assert (=> b!74995 (= lt!120622 (arrayBitRangesEqTransitive!0 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!120602 (_3!119 lt!120613) lt!120604 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!74995 (arrayBitRangesEq!0 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!119 lt!120613) lt!120604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120589 () Unit!4936)

(assert (=> b!74995 (= lt!120589 lt!120622)))

(assert (=> b!74995 call!955))

(declare-fun lt!120614 () Unit!4936)

(declare-fun Unit!4944 () Unit!4936)

(assert (=> b!74995 (= lt!120614 Unit!4944)))

(declare-fun lt!120587 () Unit!4936)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!3057 array!3057 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4936)

(assert (=> b!74995 (= lt!120587 (arrayBitRangesEqImpliesEq!0 lt!120602 (_3!119 lt!120613) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!74995 (= (bitAt!0 lt!120602 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!119 lt!120613) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!120609 () Unit!4936)

(assert (=> b!74995 (= lt!120609 lt!120587)))

(declare-fun lt!120618 () Unit!4936)

(declare-fun Unit!4945 () Unit!4936)

(assert (=> b!74995 (= lt!120618 Unit!4945)))

(declare-fun lt!120594 () Bool)

(assert (=> b!74995 (= lt!120594 (= (bitAt!0 (_3!119 lt!120613) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!3352 lt!120599)))))

(declare-fun Unit!4946 () Unit!4936)

(assert (=> b!74995 (= lt!120616 Unit!4946)))

(assert (=> b!74995 lt!120594))

(declare-fun b!74996 () Bool)

(declare-fun res!61987 () Bool)

(assert (=> b!74996 (=> (not res!61987) (not e!49053))))

(assert (=> b!74996 (= res!61987 (and (= (buf!1809 (_1!3345 lt!120127)) (buf!1809 (_2!3350 lt!120597))) (= (size!1428 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1428 (_3!119 lt!120597)))))))

(declare-fun bm!952 () Bool)

(assert (=> bm!952 (= call!955 (arrayBitRangesEq!0 (ite c!5499 (array!3058 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!120593) (ite c!5499 (_3!119 lt!120613) lt!120590) (ite c!5499 #b0000000000000000000000000000000000000000000000000000000000000000 lt!120601) (ite c!5499 #b0000000000000000000000000000000000000000000000000000000000000000 lt!120605)))))

(declare-fun b!74997 () Bool)

(declare-fun res!61991 () Bool)

(assert (=> b!74997 (=> (not res!61991) (not e!49053))))

(assert (=> b!74997 (= res!61991 (invariant!0 (currentBit!3557 (_2!3350 lt!120597)) (currentByte!3562 (_2!3350 lt!120597)) (size!1428 (buf!1809 (_2!3350 lt!120597)))))))

(assert (= (and d!23806 c!5499) b!74995))

(assert (= (and d!23806 (not c!5499)) b!74990))

(assert (= (and b!74995 res!61988) b!74989))

(assert (= (or b!74995 b!74990) bm!951))

(assert (= (or b!74995 b!74990) bm!952))

(assert (= (and d!23806 res!61990) b!74996))

(assert (= (and b!74996 res!61987) b!74992))

(assert (= (and b!74992 res!61986) b!74993))

(assert (= (and b!74993 (not res!61989)) b!74994))

(assert (= (and b!74993 res!61985) b!74997))

(assert (= (and b!74997 res!61991) b!74991))

(declare-fun m!119995 () Bool)

(assert (=> b!74997 m!119995))

(declare-fun m!119997 () Bool)

(assert (=> bm!951 m!119997))

(declare-fun m!119999 () Bool)

(assert (=> bm!951 m!119999))

(declare-fun m!120001 () Bool)

(assert (=> bm!951 m!120001))

(declare-fun m!120003 () Bool)

(assert (=> bm!951 m!120003))

(declare-fun m!120005 () Bool)

(assert (=> bm!952 m!120005))

(declare-fun m!120007 () Bool)

(assert (=> b!74992 m!120007))

(declare-fun m!120009 () Bool)

(assert (=> b!74991 m!120009))

(declare-fun m!120011 () Bool)

(assert (=> b!74991 m!120011))

(declare-fun m!120013 () Bool)

(assert (=> b!74990 m!120013))

(declare-fun m!120015 () Bool)

(assert (=> b!74990 m!120015))

(declare-fun m!120017 () Bool)

(assert (=> b!74995 m!120017))

(assert (=> b!74995 m!119871))

(declare-fun m!120019 () Bool)

(assert (=> b!74995 m!120019))

(declare-fun m!120021 () Bool)

(assert (=> b!74995 m!120021))

(assert (=> b!74995 m!119921))

(declare-fun m!120023 () Bool)

(assert (=> b!74995 m!120023))

(declare-fun m!120025 () Bool)

(assert (=> b!74995 m!120025))

(declare-fun m!120027 () Bool)

(assert (=> b!74995 m!120027))

(declare-fun m!120029 () Bool)

(assert (=> b!74995 m!120029))

(declare-fun m!120031 () Bool)

(assert (=> b!74995 m!120031))

(declare-fun m!120033 () Bool)

(assert (=> b!74995 m!120033))

(declare-fun m!120035 () Bool)

(assert (=> b!74995 m!120035))

(declare-fun m!120037 () Bool)

(assert (=> b!74995 m!120037))

(declare-fun m!120039 () Bool)

(assert (=> b!74995 m!120039))

(declare-fun m!120041 () Bool)

(assert (=> b!74995 m!120041))

(declare-fun m!120043 () Bool)

(assert (=> b!74994 m!120043))

(declare-fun m!120045 () Bool)

(assert (=> b!74994 m!120045))

(declare-fun m!120047 () Bool)

(assert (=> d!23806 m!120047))

(assert (=> d!23806 m!119871))

(assert (=> d!23760 d!23806))

(declare-fun d!23832 () Bool)

(declare-fun res!61994 () Bool)

(declare-fun e!49055 () Bool)

(assert (=> d!23832 (=> (not res!61994) (not e!49055))))

(assert (=> d!23832 (= res!61994 (= (size!1428 (buf!1809 (_1!3345 lt!120442))) (size!1428 (buf!1809 thiss!1379))))))

(assert (=> d!23832 (= (isPrefixOf!0 (_1!3345 lt!120442) thiss!1379) e!49055)))

(declare-fun b!74998 () Bool)

(declare-fun res!61992 () Bool)

(assert (=> b!74998 (=> (not res!61992) (not e!49055))))

(assert (=> b!74998 (= res!61992 (bvsle (bitIndex!0 (size!1428 (buf!1809 (_1!3345 lt!120442))) (currentByte!3562 (_1!3345 lt!120442)) (currentBit!3557 (_1!3345 lt!120442))) (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379))))))

(declare-fun b!74999 () Bool)

(declare-fun e!49054 () Bool)

(assert (=> b!74999 (= e!49055 e!49054)))

(declare-fun res!61993 () Bool)

(assert (=> b!74999 (=> res!61993 e!49054)))

(assert (=> b!74999 (= res!61993 (= (size!1428 (buf!1809 (_1!3345 lt!120442))) #b00000000000000000000000000000000))))

(declare-fun b!75000 () Bool)

(assert (=> b!75000 (= e!49054 (arrayBitRangesEq!0 (buf!1809 (_1!3345 lt!120442)) (buf!1809 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1428 (buf!1809 (_1!3345 lt!120442))) (currentByte!3562 (_1!3345 lt!120442)) (currentBit!3557 (_1!3345 lt!120442)))))))

(assert (= (and d!23832 res!61994) b!74998))

(assert (= (and b!74998 res!61992) b!74999))

(assert (= (and b!74999 (not res!61993)) b!75000))

(declare-fun m!120049 () Bool)

(assert (=> b!74998 m!120049))

(assert (=> b!74998 m!119721))

(assert (=> b!75000 m!120049))

(assert (=> b!75000 m!120049))

(declare-fun m!120051 () Bool)

(assert (=> b!75000 m!120051))

(assert (=> b!74868 d!23832))

(declare-fun d!23834 () Bool)

(assert (=> d!23834 (= (remainingBits!0 ((_ sign_extend 32) (size!1428 (buf!1809 thiss!1379))) ((_ sign_extend 32) (currentByte!3562 thiss!1379)) ((_ sign_extend 32) (currentBit!3557 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1428 (buf!1809 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3562 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3557 thiss!1379)))))))

(assert (=> d!23784 d!23834))

(declare-fun d!23836 () Bool)

(declare-fun res!61997 () Bool)

(declare-fun e!49057 () Bool)

(assert (=> d!23836 (=> (not res!61997) (not e!49057))))

(assert (=> d!23836 (= res!61997 (= (size!1428 (buf!1809 (_2!3345 lt!120442))) (size!1428 (buf!1809 thiss!1379))))))

(assert (=> d!23836 (= (isPrefixOf!0 (_2!3345 lt!120442) thiss!1379) e!49057)))

(declare-fun b!75001 () Bool)

(declare-fun res!61995 () Bool)

(assert (=> b!75001 (=> (not res!61995) (not e!49057))))

(assert (=> b!75001 (= res!61995 (bvsle (bitIndex!0 (size!1428 (buf!1809 (_2!3345 lt!120442))) (currentByte!3562 (_2!3345 lt!120442)) (currentBit!3557 (_2!3345 lt!120442))) (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379))))))

(declare-fun b!75002 () Bool)

(declare-fun e!49056 () Bool)

(assert (=> b!75002 (= e!49057 e!49056)))

(declare-fun res!61996 () Bool)

(assert (=> b!75002 (=> res!61996 e!49056)))

(assert (=> b!75002 (= res!61996 (= (size!1428 (buf!1809 (_2!3345 lt!120442))) #b00000000000000000000000000000000))))

(declare-fun b!75003 () Bool)

(assert (=> b!75003 (= e!49056 (arrayBitRangesEq!0 (buf!1809 (_2!3345 lt!120442)) (buf!1809 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1428 (buf!1809 (_2!3345 lt!120442))) (currentByte!3562 (_2!3345 lt!120442)) (currentBit!3557 (_2!3345 lt!120442)))))))

(assert (= (and d!23836 res!61997) b!75001))

(assert (= (and b!75001 res!61995) b!75002))

(assert (= (and b!75002 (not res!61996)) b!75003))

(assert (=> b!75001 m!119925))

(assert (=> b!75001 m!119721))

(assert (=> b!75003 m!119925))

(assert (=> b!75003 m!119925))

(declare-fun m!120053 () Bool)

(assert (=> b!75003 m!120053))

(assert (=> b!74867 d!23836))

(assert (=> b!74869 d!23776))

(declare-fun d!23838 () Bool)

(assert (=> d!23838 (arrayBitRangesEq!0 (buf!1809 thiss!1379) (buf!1809 thiss!1379) lt!120423 lt!120430)))

(declare-fun lt!120625 () Unit!4936)

(declare-fun choose!8 (array!3057 array!3057 (_ BitVec 64) (_ BitVec 64)) Unit!4936)

(assert (=> d!23838 (= lt!120625 (choose!8 (buf!1809 thiss!1379) (buf!1809 thiss!1379) lt!120423 lt!120430))))

(assert (=> d!23838 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120423) (bvsle lt!120423 lt!120430))))

(assert (=> d!23838 (= (arrayBitRangesEqSymmetric!0 (buf!1809 thiss!1379) (buf!1809 thiss!1379) lt!120423 lt!120430) lt!120625)))

(declare-fun bs!5729 () Bool)

(assert (= bs!5729 d!23838))

(assert (=> bs!5729 m!119891))

(declare-fun m!120055 () Bool)

(assert (=> bs!5729 m!120055))

(assert (=> b!74869 d!23838))

(declare-fun d!23840 () Bool)

(declare-fun res!61999 () Bool)

(declare-fun e!49062 () Bool)

(assert (=> d!23840 (=> res!61999 e!49062)))

(assert (=> d!23840 (= res!61999 (bvsge lt!120423 lt!120430))))

(assert (=> d!23840 (= (arrayBitRangesEq!0 (buf!1809 thiss!1379) (buf!1809 thiss!1379) lt!120423 lt!120430) e!49062)))

(declare-fun b!75004 () Bool)

(declare-fun e!49059 () Bool)

(declare-fun call!956 () Bool)

(assert (=> b!75004 (= e!49059 call!956)))

(declare-fun c!5500 () Bool)

(declare-fun lt!120627 () (_ BitVec 32))

(declare-fun lt!120628 () (_ BitVec 32))

(declare-fun bm!953 () Bool)

(declare-fun lt!120626 () tuple4!38)

(assert (=> bm!953 (= call!956 (byteRangesEq!0 (ite c!5500 (select (arr!2022 (buf!1809 thiss!1379)) (_3!120 lt!120626)) (select (arr!2022 (buf!1809 thiss!1379)) (_4!19 lt!120626))) (ite c!5500 (select (arr!2022 (buf!1809 thiss!1379)) (_3!120 lt!120626)) (select (arr!2022 (buf!1809 thiss!1379)) (_4!19 lt!120626))) (ite c!5500 lt!120627 #b00000000000000000000000000000000) lt!120628))))

(declare-fun b!75005 () Bool)

(declare-fun e!49060 () Bool)

(assert (=> b!75005 (= e!49060 (arrayRangesEq!20 (buf!1809 thiss!1379) (buf!1809 thiss!1379) (_1!3354 lt!120626) (_2!3354 lt!120626)))))

(declare-fun b!75006 () Bool)

(declare-fun e!49061 () Bool)

(assert (=> b!75006 (= e!49061 call!956)))

(declare-fun b!75007 () Bool)

(declare-fun e!49063 () Bool)

(assert (=> b!75007 (= e!49063 e!49061)))

(assert (=> b!75007 (= c!5500 (= (_3!120 lt!120626) (_4!19 lt!120626)))))

(declare-fun b!75008 () Bool)

(declare-fun e!49058 () Bool)

(assert (=> b!75008 (= e!49061 e!49058)))

(declare-fun res!61998 () Bool)

(assert (=> b!75008 (= res!61998 (byteRangesEq!0 (select (arr!2022 (buf!1809 thiss!1379)) (_3!120 lt!120626)) (select (arr!2022 (buf!1809 thiss!1379)) (_3!120 lt!120626)) lt!120627 #b00000000000000000000000000001000))))

(assert (=> b!75008 (=> (not res!61998) (not e!49058))))

(declare-fun b!75009 () Bool)

(assert (=> b!75009 (= e!49062 e!49063)))

(declare-fun res!62002 () Bool)

(assert (=> b!75009 (=> (not res!62002) (not e!49063))))

(assert (=> b!75009 (= res!62002 e!49060)))

(declare-fun res!62001 () Bool)

(assert (=> b!75009 (=> res!62001 e!49060)))

(assert (=> b!75009 (= res!62001 (bvsge (_1!3354 lt!120626) (_2!3354 lt!120626)))))

(assert (=> b!75009 (= lt!120628 ((_ extract 31 0) (bvsrem lt!120430 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75009 (= lt!120627 ((_ extract 31 0) (bvsrem lt!120423 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75009 (= lt!120626 (arrayBitIndices!0 lt!120423 lt!120430))))

(declare-fun b!75010 () Bool)

(declare-fun res!62000 () Bool)

(assert (=> b!75010 (= res!62000 (= lt!120628 #b00000000000000000000000000000000))))

(assert (=> b!75010 (=> res!62000 e!49059)))

(assert (=> b!75010 (= e!49058 e!49059)))

(assert (= (and d!23840 (not res!61999)) b!75009))

(assert (= (and b!75009 (not res!62001)) b!75005))

(assert (= (and b!75009 res!62002) b!75007))

(assert (= (and b!75007 c!5500) b!75006))

(assert (= (and b!75007 (not c!5500)) b!75008))

(assert (= (and b!75008 res!61998) b!75010))

(assert (= (and b!75010 (not res!62000)) b!75004))

(assert (= (or b!75006 b!75004) bm!953))

(declare-fun m!120057 () Bool)

(assert (=> bm!953 m!120057))

(declare-fun m!120059 () Bool)

(assert (=> bm!953 m!120059))

(assert (=> bm!953 m!120059))

(declare-fun m!120061 () Bool)

(assert (=> bm!953 m!120061))

(assert (=> bm!953 m!120057))

(declare-fun m!120063 () Bool)

(assert (=> b!75005 m!120063))

(assert (=> b!75008 m!120057))

(assert (=> b!75008 m!120057))

(assert (=> b!75008 m!120057))

(assert (=> b!75008 m!120057))

(declare-fun m!120065 () Bool)

(assert (=> b!75008 m!120065))

(declare-fun m!120067 () Bool)

(assert (=> b!75009 m!120067))

(assert (=> b!74869 d!23840))

(assert (=> d!23770 d!23772))

(declare-fun d!23842 () Bool)

(declare-fun res!62005 () Bool)

(declare-fun e!49065 () Bool)

(assert (=> d!23842 (=> (not res!62005) (not e!49065))))

(assert (=> d!23842 (= res!62005 (= (size!1428 (buf!1809 lt!120439)) (size!1428 (buf!1809 thiss!1379))))))

(assert (=> d!23842 (= (isPrefixOf!0 lt!120439 thiss!1379) e!49065)))

(declare-fun b!75011 () Bool)

(declare-fun res!62003 () Bool)

(assert (=> b!75011 (=> (not res!62003) (not e!49065))))

(assert (=> b!75011 (= res!62003 (bvsle (bitIndex!0 (size!1428 (buf!1809 lt!120439)) (currentByte!3562 lt!120439) (currentBit!3557 lt!120439)) (bitIndex!0 (size!1428 (buf!1809 thiss!1379)) (currentByte!3562 thiss!1379) (currentBit!3557 thiss!1379))))))

(declare-fun b!75012 () Bool)

(declare-fun e!49064 () Bool)

(assert (=> b!75012 (= e!49065 e!49064)))

(declare-fun res!62004 () Bool)

(assert (=> b!75012 (=> res!62004 e!49064)))

(assert (=> b!75012 (= res!62004 (= (size!1428 (buf!1809 lt!120439)) #b00000000000000000000000000000000))))

(declare-fun b!75013 () Bool)

(assert (=> b!75013 (= e!49064 (arrayBitRangesEq!0 (buf!1809 lt!120439) (buf!1809 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1428 (buf!1809 lt!120439)) (currentByte!3562 lt!120439) (currentBit!3557 lt!120439))))))

(assert (= (and d!23842 res!62005) b!75011))

(assert (= (and b!75011 res!62003) b!75012))

(assert (= (and b!75012 (not res!62004)) b!75013))

(declare-fun m!120069 () Bool)

(assert (=> b!75011 m!120069))

(assert (=> b!75011 m!119721))

(assert (=> b!75013 m!120069))

(assert (=> b!75013 m!120069))

(declare-fun m!120071 () Bool)

(assert (=> b!75013 m!120071))

(assert (=> d!23770 d!23842))

(declare-fun d!23844 () Bool)

(assert (=> d!23844 (isPrefixOf!0 lt!120439 thiss!1379)))

(declare-fun lt!120631 () Unit!4936)

(declare-fun choose!30 (BitStream!2430 BitStream!2430 BitStream!2430) Unit!4936)

(assert (=> d!23844 (= lt!120631 (choose!30 lt!120439 thiss!1379 thiss!1379))))

(assert (=> d!23844 (isPrefixOf!0 lt!120439 thiss!1379)))

(assert (=> d!23844 (= (lemmaIsPrefixTransitive!0 lt!120439 thiss!1379 thiss!1379) lt!120631)))

(declare-fun bs!5730 () Bool)

(assert (= bs!5730 d!23844))

(assert (=> bs!5730 m!119875))

(declare-fun m!120073 () Bool)

(assert (=> bs!5730 m!120073))

(assert (=> bs!5730 m!119875))

(assert (=> d!23770 d!23844))

(assert (=> d!23770 d!23774))

(declare-fun d!23846 () Bool)

(assert (=> d!23846 (isPrefixOf!0 lt!120439 lt!120439)))

(declare-fun lt!120632 () Unit!4936)

(assert (=> d!23846 (= lt!120632 (choose!11 lt!120439))))

(assert (=> d!23846 (= (lemmaIsPrefixRefl!0 lt!120439) lt!120632)))

(declare-fun bs!5731 () Bool)

(assert (= bs!5731 d!23846))

(assert (=> bs!5731 m!119873))

(declare-fun m!120075 () Bool)

(assert (=> bs!5731 m!120075))

(assert (=> d!23770 d!23846))

(declare-fun d!23848 () Bool)

(declare-fun res!62008 () Bool)

(declare-fun e!49067 () Bool)

(assert (=> d!23848 (=> (not res!62008) (not e!49067))))

(assert (=> d!23848 (= res!62008 (= (size!1428 (buf!1809 lt!120439)) (size!1428 (buf!1809 lt!120439))))))

(assert (=> d!23848 (= (isPrefixOf!0 lt!120439 lt!120439) e!49067)))

(declare-fun b!75014 () Bool)

(declare-fun res!62006 () Bool)

(assert (=> b!75014 (=> (not res!62006) (not e!49067))))

(assert (=> b!75014 (= res!62006 (bvsle (bitIndex!0 (size!1428 (buf!1809 lt!120439)) (currentByte!3562 lt!120439) (currentBit!3557 lt!120439)) (bitIndex!0 (size!1428 (buf!1809 lt!120439)) (currentByte!3562 lt!120439) (currentBit!3557 lt!120439))))))

(declare-fun b!75015 () Bool)

(declare-fun e!49066 () Bool)

(assert (=> b!75015 (= e!49067 e!49066)))

(declare-fun res!62007 () Bool)

(assert (=> b!75015 (=> res!62007 e!49066)))

(assert (=> b!75015 (= res!62007 (= (size!1428 (buf!1809 lt!120439)) #b00000000000000000000000000000000))))

(declare-fun b!75016 () Bool)

(assert (=> b!75016 (= e!49066 (arrayBitRangesEq!0 (buf!1809 lt!120439) (buf!1809 lt!120439) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1428 (buf!1809 lt!120439)) (currentByte!3562 lt!120439) (currentBit!3557 lt!120439))))))

(assert (= (and d!23848 res!62008) b!75014))

(assert (= (and b!75014 res!62006) b!75015))

(assert (= (and b!75015 (not res!62007)) b!75016))

(assert (=> b!75014 m!120069))

(assert (=> b!75014 m!120069))

(assert (=> b!75016 m!120069))

(assert (=> b!75016 m!120069))

(declare-fun m!120077 () Bool)

(assert (=> b!75016 m!120077))

(assert (=> d!23770 d!23848))

(declare-fun d!23850 () Bool)

(declare-fun res!62011 () Bool)

(declare-fun e!49069 () Bool)

(assert (=> d!23850 (=> (not res!62011) (not e!49069))))

(assert (=> d!23850 (= res!62011 (= (size!1428 (buf!1809 (_1!3345 lt!120442))) (size!1428 (buf!1809 (_2!3345 lt!120442)))))))

(assert (=> d!23850 (= (isPrefixOf!0 (_1!3345 lt!120442) (_2!3345 lt!120442)) e!49069)))

(declare-fun b!75017 () Bool)

(declare-fun res!62009 () Bool)

(assert (=> b!75017 (=> (not res!62009) (not e!49069))))

(assert (=> b!75017 (= res!62009 (bvsle (bitIndex!0 (size!1428 (buf!1809 (_1!3345 lt!120442))) (currentByte!3562 (_1!3345 lt!120442)) (currentBit!3557 (_1!3345 lt!120442))) (bitIndex!0 (size!1428 (buf!1809 (_2!3345 lt!120442))) (currentByte!3562 (_2!3345 lt!120442)) (currentBit!3557 (_2!3345 lt!120442)))))))

(declare-fun b!75018 () Bool)

(declare-fun e!49068 () Bool)

(assert (=> b!75018 (= e!49069 e!49068)))

(declare-fun res!62010 () Bool)

(assert (=> b!75018 (=> res!62010 e!49068)))

(assert (=> b!75018 (= res!62010 (= (size!1428 (buf!1809 (_1!3345 lt!120442))) #b00000000000000000000000000000000))))

(declare-fun b!75019 () Bool)

(assert (=> b!75019 (= e!49068 (arrayBitRangesEq!0 (buf!1809 (_1!3345 lt!120442)) (buf!1809 (_2!3345 lt!120442)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1428 (buf!1809 (_1!3345 lt!120442))) (currentByte!3562 (_1!3345 lt!120442)) (currentBit!3557 (_1!3345 lt!120442)))))))

(assert (= (and d!23850 res!62011) b!75017))

(assert (= (and b!75017 res!62009) b!75018))

(assert (= (and b!75018 (not res!62010)) b!75019))

(assert (=> b!75017 m!120049))

(assert (=> b!75017 m!119925))

(assert (=> b!75019 m!120049))

(assert (=> b!75019 m!120049))

(declare-fun m!120079 () Bool)

(assert (=> b!75019 m!120079))

(assert (=> d!23770 d!23850))

(assert (=> d!23774 d!23772))

(declare-fun d!23852 () Bool)

(assert (=> d!23852 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23852 true))

(declare-fun _$14!259 () Unit!4936)

(assert (=> d!23852 (= (choose!11 thiss!1379) _$14!259)))

(declare-fun bs!5733 () Bool)

(assert (= bs!5733 d!23852))

(assert (=> bs!5733 m!119717))

(assert (=> d!23774 d!23852))

(assert (=> d!23782 d!23778))

(assert (=> d!23776 d!23834))

(assert (=> d!23776 d!23778))

(declare-fun d!23854 () Bool)

(declare-fun e!49070 () Bool)

(assert (=> d!23854 e!49070))

(declare-fun res!62013 () Bool)

(assert (=> d!23854 (=> (not res!62013) (not e!49070))))

(declare-fun lt!120637 () (_ BitVec 64))

(declare-fun lt!120634 () (_ BitVec 64))

(declare-fun lt!120633 () (_ BitVec 64))

(assert (=> d!23854 (= res!62013 (= lt!120637 (bvsub lt!120633 lt!120634)))))

(assert (=> d!23854 (or (= (bvand lt!120633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120633 lt!120634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23854 (= lt!120634 (remainingBits!0 ((_ sign_extend 32) (size!1428 (buf!1809 (_2!3344 lt!120374)))) ((_ sign_extend 32) (currentByte!3562 (_2!3344 lt!120374))) ((_ sign_extend 32) (currentBit!3557 (_2!3344 lt!120374)))))))

(declare-fun lt!120636 () (_ BitVec 64))

(declare-fun lt!120635 () (_ BitVec 64))

(assert (=> d!23854 (= lt!120633 (bvmul lt!120636 lt!120635))))

(assert (=> d!23854 (or (= lt!120636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!120635 (bvsdiv (bvmul lt!120636 lt!120635) lt!120636)))))

(assert (=> d!23854 (= lt!120635 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23854 (= lt!120636 ((_ sign_extend 32) (size!1428 (buf!1809 (_2!3344 lt!120374)))))))

(assert (=> d!23854 (= lt!120637 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3562 (_2!3344 lt!120374))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3557 (_2!3344 lt!120374)))))))

(assert (=> d!23854 (invariant!0 (currentBit!3557 (_2!3344 lt!120374)) (currentByte!3562 (_2!3344 lt!120374)) (size!1428 (buf!1809 (_2!3344 lt!120374))))))

(assert (=> d!23854 (= (bitIndex!0 (size!1428 (buf!1809 (_2!3344 lt!120374))) (currentByte!3562 (_2!3344 lt!120374)) (currentBit!3557 (_2!3344 lt!120374))) lt!120637)))

(declare-fun b!75020 () Bool)

(declare-fun res!62012 () Bool)

(assert (=> b!75020 (=> (not res!62012) (not e!49070))))

(assert (=> b!75020 (= res!62012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120637))))

(declare-fun b!75021 () Bool)

(declare-fun lt!120638 () (_ BitVec 64))

(assert (=> b!75021 (= e!49070 (bvsle lt!120637 (bvmul lt!120638 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75021 (or (= lt!120638 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!120638 #b0000000000000000000000000000000000000000000000000000000000001000) lt!120638)))))

(assert (=> b!75021 (= lt!120638 ((_ sign_extend 32) (size!1428 (buf!1809 (_2!3344 lt!120374)))))))

(assert (= (and d!23854 res!62013) b!75020))

(assert (= (and b!75020 res!62012) b!75021))

(declare-fun m!120081 () Bool)

(assert (=> d!23854 m!120081))

(assert (=> d!23854 m!119861))

(assert (=> b!74852 d!23854))

(declare-fun d!23856 () Bool)

(declare-fun e!49071 () Bool)

(assert (=> d!23856 e!49071))

(declare-fun res!62015 () Bool)

(assert (=> d!23856 (=> (not res!62015) (not e!49071))))

(declare-fun lt!120639 () (_ BitVec 64))

(declare-fun lt!120640 () (_ BitVec 64))

(declare-fun lt!120643 () (_ BitVec 64))

(assert (=> d!23856 (= res!62015 (= lt!120643 (bvsub lt!120639 lt!120640)))))

(assert (=> d!23856 (or (= (bvand lt!120639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120640 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120639 lt!120640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23856 (= lt!120640 (remainingBits!0 ((_ sign_extend 32) (size!1428 (buf!1809 (_1!3345 lt!120127)))) ((_ sign_extend 32) (currentByte!3562 (_1!3345 lt!120127))) ((_ sign_extend 32) (currentBit!3557 (_1!3345 lt!120127)))))))

(declare-fun lt!120642 () (_ BitVec 64))

(declare-fun lt!120641 () (_ BitVec 64))

(assert (=> d!23856 (= lt!120639 (bvmul lt!120642 lt!120641))))

(assert (=> d!23856 (or (= lt!120642 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!120641 (bvsdiv (bvmul lt!120642 lt!120641) lt!120642)))))

(assert (=> d!23856 (= lt!120641 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23856 (= lt!120642 ((_ sign_extend 32) (size!1428 (buf!1809 (_1!3345 lt!120127)))))))

(assert (=> d!23856 (= lt!120643 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3562 (_1!3345 lt!120127))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3557 (_1!3345 lt!120127)))))))

(assert (=> d!23856 (invariant!0 (currentBit!3557 (_1!3345 lt!120127)) (currentByte!3562 (_1!3345 lt!120127)) (size!1428 (buf!1809 (_1!3345 lt!120127))))))

(assert (=> d!23856 (= (bitIndex!0 (size!1428 (buf!1809 (_1!3345 lt!120127))) (currentByte!3562 (_1!3345 lt!120127)) (currentBit!3557 (_1!3345 lt!120127))) lt!120643)))

(declare-fun b!75022 () Bool)

(declare-fun res!62014 () Bool)

(assert (=> b!75022 (=> (not res!62014) (not e!49071))))

(assert (=> b!75022 (= res!62014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!120643))))

(declare-fun b!75023 () Bool)

(declare-fun lt!120644 () (_ BitVec 64))

(assert (=> b!75023 (= e!49071 (bvsle lt!120643 (bvmul lt!120644 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75023 (or (= lt!120644 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!120644 #b0000000000000000000000000000000000000000000000000000000000001000) lt!120644)))))

(assert (=> b!75023 (= lt!120644 ((_ sign_extend 32) (size!1428 (buf!1809 (_1!3345 lt!120127)))))))

(assert (= (and d!23856 res!62015) b!75022))

(assert (= (and b!75022 res!62014) b!75023))

(declare-fun m!120083 () Bool)

(assert (=> d!23856 m!120083))

(declare-fun m!120085 () Bool)

(assert (=> d!23856 m!120085))

(assert (=> b!74852 d!23856))

(check-sat (not bm!953) (not b!74995) (not b!74931) (not d!23856) (not b!75005) (not bm!951) (not b!75009) (not b!74934) (not d!23852) (not b!75016) (not d!23838) (not b!74908) (not b!75017) (not bm!943) (not b!74992) (not b!74994) (not b!74997) (not b!74990) (not d!23806) (not bm!952) (not b!75011) (not b!74991) (not b!74998) (not b!75001) (not b!75000) (not b!75019) (not b!75003) (not b!74896) (not d!23798) (not d!23844) (not b!74927) (not b!75008) (not b!74930) (not d!23846) (not d!23854) (not b!75013) (not b!75014) (not b!74906) (not b!74907))
(check-sat)
