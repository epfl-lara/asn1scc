; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32212 () Bool)

(assert start!32212)

(declare-fun res!133015 () Bool)

(declare-fun e!108790 () Bool)

(assert (=> start!32212 (=> (not res!133015) (not e!108790))))

(declare-datatypes ((array!7578 0))(
  ( (array!7579 (arr!4354 (Array (_ BitVec 32) (_ BitVec 8))) (size!3433 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6034 0))(
  ( (BitStream!6035 (buf!3891 array!7578) (currentByte!7119 (_ BitVec 32)) (currentBit!7114 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6034)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32212 (= res!133015 (validate_offset_byte!0 ((_ sign_extend 32) (size!3433 (buf!3891 thiss!1602))) ((_ sign_extend 32) (currentByte!7119 thiss!1602)) ((_ sign_extend 32) (currentBit!7114 thiss!1602))))))

(assert (=> start!32212 e!108790))

(declare-fun e!108791 () Bool)

(declare-fun inv!12 (BitStream!6034) Bool)

(assert (=> start!32212 (and (inv!12 thiss!1602) e!108791)))

(assert (=> start!32212 true))

(declare-fun b!159356 () Bool)

(declare-fun e!108792 () Bool)

(declare-fun lt!251539 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159356 (= e!108792 (byteRangesEq!0 (select (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602)) lt!251539 #b00000000000000000000000000000000 (currentBit!7114 thiss!1602)))))

(declare-fun b!159357 () Bool)

(declare-fun e!108788 () Bool)

(assert (=> b!159357 (= e!108790 (not e!108788))))

(declare-fun res!133016 () Bool)

(assert (=> b!159357 (=> res!133016 e!108788)))

(declare-datatypes ((Unit!10823 0))(
  ( (Unit!10824) )
))
(declare-datatypes ((tuple3!768 0))(
  ( (tuple3!769 (_1!7732 Unit!10823) (_2!7732 (_ BitVec 8)) (_3!501 BitStream!6034)) )
))
(declare-fun lt!251541 () tuple3!768)

(declare-fun lt!251545 () array!7578)

(declare-fun arrayRangesEq!484 (array!7578 array!7578 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159357 (= res!133016 (not (arrayRangesEq!484 (buf!3891 thiss!1602) lt!251545 #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001))))))

(declare-fun lt!251542 () (_ BitVec 8))

(assert (=> b!159357 (arrayRangesEq!484 (buf!3891 thiss!1602) (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) lt!251542) (size!3433 (buf!3891 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001))))

(declare-fun lt!251550 () Unit!10823)

(declare-fun arrayUpdatedAtPrefixLemma!92 (array!7578 (_ BitVec 32) (_ BitVec 8)) Unit!10823)

(assert (=> b!159357 (= lt!251550 (arrayUpdatedAtPrefixLemma!92 (buf!3891 thiss!1602) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) lt!251542))))

(assert (=> b!159357 (= lt!251542 (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)))))

(declare-fun lt!251540 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251543 () (_ BitVec 8))

(declare-fun lt!251544 () (_ BitVec 32))

(declare-fun lt!251548 () (_ BitVec 32))

(declare-fun lt!251538 () (_ BitVec 32))

(declare-fun Unit!10825 () Unit!10823)

(declare-fun Unit!10826 () Unit!10823)

(assert (=> b!159357 (= lt!251541 (ite (bvsgt lt!251544 #b00000000000000000000000000000000) (let ((bdg!9365 ((_ extract 7 0) (bvnot lt!251548)))) (let ((bdg!9366 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602) lt!251543) (currentByte!7119 thiss!1602) lt!251539) (bvadd #b00000000000000000000000000000001 (currentByte!7119 thiss!1602)))) ((_ sign_extend 24) bdg!9365))))) (tuple3!769 Unit!10825 bdg!9365 (BitStream!6035 (array!7579 (store (arr!4354 (array!7579 (store (arr!4354 lt!251545) (bvadd #b00000000000000000000000000000001 (currentByte!7119 thiss!1602)) bdg!9366) (size!3433 lt!251545))) (bvadd #b00000000000000000000000000000001 (currentByte!7119 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9366) (bvshl ((_ sign_extend 24) v!222) lt!251538)))) (size!3433 (array!7579 (store (arr!4354 lt!251545) (bvadd #b00000000000000000000000000000001 (currentByte!7119 thiss!1602)) bdg!9366) (size!3433 lt!251545)))) (bvadd #b00000000000000000000000000000001 (currentByte!7119 thiss!1602)) (currentBit!7114 thiss!1602))))) (tuple3!769 Unit!10826 lt!251540 (BitStream!6035 lt!251545 (bvadd #b00000000000000000000000000000001 (currentByte!7119 thiss!1602)) (currentBit!7114 thiss!1602)))))))

(assert (=> b!159357 e!108792))

(declare-fun res!133014 () Bool)

(assert (=> b!159357 (=> res!133014 e!108792)))

(assert (=> b!159357 (= res!133014 (bvsge (currentByte!7119 thiss!1602) (size!3433 (buf!3891 thiss!1602))))))

(assert (=> b!159357 (= lt!251545 (array!7579 (store (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602) lt!251543) (currentByte!7119 thiss!1602) lt!251539) (size!3433 (buf!3891 thiss!1602))))))

(assert (=> b!159357 (= lt!251539 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251543) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251544))))))

(assert (=> b!159357 (= lt!251543 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602))) lt!251548)))))

(assert (=> b!159357 (= lt!251548 ((_ sign_extend 24) lt!251540))))

(assert (=> b!159357 (= lt!251540 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251538)))))))

(assert (=> b!159357 (= lt!251538 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251544))))))

(assert (=> b!159357 (= lt!251544 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7114 thiss!1602))))))

(declare-fun b!159358 () Bool)

(declare-fun array_inv!3180 (array!7578) Bool)

(assert (=> b!159358 (= e!108791 (array_inv!3180 (buf!3891 thiss!1602)))))

(declare-fun b!159359 () Bool)

(assert (=> b!159359 (= e!108788 (or (bvsgt #b00000000000000000000000000000000 (currentByte!7119 thiss!1602)) (bvsgt (size!3433 (buf!3891 thiss!1602)) (size!3433 (buf!3891 (_3!501 lt!251541)))) (bvsle (currentByte!7119 thiss!1602) (size!3433 (buf!3891 thiss!1602)))))))

(assert (=> b!159359 (arrayRangesEq!484 (buf!3891 thiss!1602) (buf!3891 (_3!501 lt!251541)) #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001))))

(declare-fun lt!251549 () Unit!10823)

(declare-fun arrayRangesEqTransitive!127 (array!7578 array!7578 array!7578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10823)

(assert (=> b!159359 (= lt!251549 (arrayRangesEqTransitive!127 (buf!3891 thiss!1602) lt!251545 (buf!3891 (_3!501 lt!251541)) #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) (currentByte!7119 (_3!501 lt!251541))))))

(assert (=> b!159359 (arrayRangesEq!484 lt!251545 (array!7579 (store (store (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602) lt!251543) (currentByte!7119 thiss!1602) lt!251539) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 (buf!3891 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541)))))

(declare-fun lt!251547 () Unit!10823)

(assert (=> b!159359 (= lt!251547 (arrayUpdatedAtPrefixLemma!92 lt!251545 (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))))))

(assert (=> b!159359 (arrayRangesEq!484 (buf!3891 thiss!1602) (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 (buf!3891 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541)))))

(declare-fun lt!251546 () Unit!10823)

(assert (=> b!159359 (= lt!251546 (arrayUpdatedAtPrefixLemma!92 (buf!3891 thiss!1602) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))))))

(declare-fun b!159360 () Bool)

(declare-fun res!133013 () Bool)

(assert (=> b!159360 (=> res!133013 e!108788)))

(assert (=> b!159360 (= res!133013 (bvsle lt!251544 #b00000000000000000000000000000000))))

(assert (= (and start!32212 res!133015) b!159357))

(assert (= (and b!159357 (not res!133014)) b!159356))

(assert (= (and b!159357 (not res!133016)) b!159360))

(assert (= (and b!159360 (not res!133013)) b!159359))

(assert (= start!32212 b!159358))

(declare-fun m!251023 () Bool)

(assert (=> b!159356 m!251023))

(assert (=> b!159356 m!251023))

(declare-fun m!251025 () Bool)

(assert (=> b!159356 m!251025))

(declare-fun m!251027 () Bool)

(assert (=> start!32212 m!251027))

(declare-fun m!251029 () Bool)

(assert (=> start!32212 m!251029))

(declare-fun m!251031 () Bool)

(assert (=> b!159358 m!251031))

(declare-fun m!251033 () Bool)

(assert (=> b!159357 m!251033))

(declare-fun m!251035 () Bool)

(assert (=> b!159357 m!251035))

(declare-fun m!251037 () Bool)

(assert (=> b!159357 m!251037))

(declare-fun m!251039 () Bool)

(assert (=> b!159357 m!251039))

(declare-fun m!251041 () Bool)

(assert (=> b!159357 m!251041))

(assert (=> b!159357 m!251023))

(declare-fun m!251043 () Bool)

(assert (=> b!159357 m!251043))

(declare-fun m!251045 () Bool)

(assert (=> b!159357 m!251045))

(declare-fun m!251047 () Bool)

(assert (=> b!159357 m!251047))

(declare-fun m!251049 () Bool)

(assert (=> b!159357 m!251049))

(declare-fun m!251051 () Bool)

(assert (=> b!159357 m!251051))

(declare-fun m!251053 () Bool)

(assert (=> b!159357 m!251053))

(declare-fun m!251055 () Bool)

(assert (=> b!159359 m!251055))

(declare-fun m!251057 () Bool)

(assert (=> b!159359 m!251057))

(declare-fun m!251059 () Bool)

(assert (=> b!159359 m!251059))

(assert (=> b!159359 m!251039))

(declare-fun m!251061 () Bool)

(assert (=> b!159359 m!251061))

(declare-fun m!251063 () Bool)

(assert (=> b!159359 m!251063))

(declare-fun m!251065 () Bool)

(assert (=> b!159359 m!251065))

(assert (=> b!159359 m!251057))

(declare-fun m!251067 () Bool)

(assert (=> b!159359 m!251067))

(declare-fun m!251069 () Bool)

(assert (=> b!159359 m!251069))

(assert (=> b!159359 m!251033))

(assert (=> b!159359 m!251057))

(declare-fun m!251071 () Bool)

(assert (=> b!159359 m!251071))

(push 1)

(assert (not b!159356))

(assert (not b!159357))

(assert (not b!159359))

(assert (not b!159358))

(assert (not start!32212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53543 () Bool)

(assert (=> d!53543 (= (byteRangesEq!0 (select (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602)) lt!251539 #b00000000000000000000000000000000 (currentBit!7114 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7114 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7114 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251539) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7114 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13276 () Bool)

(assert (= bs!13276 d!53543))

(declare-fun m!251173 () Bool)

(assert (=> bs!13276 m!251173))

(declare-fun m!251175 () Bool)

(assert (=> bs!13276 m!251175))

(assert (=> b!159356 d!53543))

(declare-fun d!53545 () Bool)

(declare-fun res!133045 () Bool)

(declare-fun e!108827 () Bool)

(assert (=> d!53545 (=> res!133045 e!108827)))

(assert (=> d!53545 (= res!133045 (= #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)))))

(assert (=> d!53545 (= (arrayRangesEq!484 (buf!3891 thiss!1602) lt!251545 #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)) e!108827)))

(declare-fun b!159395 () Bool)

(declare-fun e!108828 () Bool)

(assert (=> b!159395 (= e!108827 e!108828)))

(declare-fun res!133046 () Bool)

(assert (=> b!159395 (=> (not res!133046) (not e!108828))))

(assert (=> b!159395 (= res!133046 (= (select (arr!4354 (buf!3891 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4354 lt!251545) #b00000000000000000000000000000000)))))

(declare-fun b!159396 () Bool)

(assert (=> b!159396 (= e!108828 (arrayRangesEq!484 (buf!3891 thiss!1602) lt!251545 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)))))

(assert (= (and d!53545 (not res!133045)) b!159395))

(assert (= (and b!159395 res!133046) b!159396))

(declare-fun m!251177 () Bool)

(assert (=> b!159395 m!251177))

(declare-fun m!251179 () Bool)

(assert (=> b!159395 m!251179))

(declare-fun m!251181 () Bool)

(assert (=> b!159396 m!251181))

(assert (=> b!159357 d!53545))

(declare-fun d!53547 () Bool)

(declare-fun res!133047 () Bool)

(declare-fun e!108829 () Bool)

(assert (=> d!53547 (=> res!133047 e!108829)))

(assert (=> d!53547 (= res!133047 (= #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)))))

(assert (=> d!53547 (= (arrayRangesEq!484 (buf!3891 thiss!1602) (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) lt!251542) (size!3433 (buf!3891 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)) e!108829)))

(declare-fun b!159397 () Bool)

(declare-fun e!108830 () Bool)

(assert (=> b!159397 (= e!108829 e!108830)))

(declare-fun res!133048 () Bool)

(assert (=> b!159397 (=> (not res!133048) (not e!108830))))

(assert (=> b!159397 (= res!133048 (= (select (arr!4354 (buf!3891 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4354 (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) lt!251542) (size!3433 (buf!3891 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159398 () Bool)

(assert (=> b!159398 (= e!108830 (arrayRangesEq!484 (buf!3891 thiss!1602) (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) lt!251542) (size!3433 (buf!3891 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)))))

(assert (= (and d!53547 (not res!133047)) b!159397))

(assert (= (and b!159397 res!133048) b!159398))

(assert (=> b!159397 m!251177))

(declare-fun m!251183 () Bool)

(assert (=> b!159397 m!251183))

(declare-fun m!251185 () Bool)

(assert (=> b!159398 m!251185))

(assert (=> b!159357 d!53547))

(declare-fun d!53549 () Bool)

(declare-fun e!108833 () Bool)

(assert (=> d!53549 e!108833))

(declare-fun res!133051 () Bool)

(assert (=> d!53549 (=> (not res!133051) (not e!108833))))

(assert (=> d!53549 (= res!133051 (and (bvsge (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) (size!3433 (buf!3891 thiss!1602)))))))

(declare-fun lt!251631 () Unit!10823)

(declare-fun choose!127 (array!7578 (_ BitVec 32) (_ BitVec 8)) Unit!10823)

(assert (=> d!53549 (= lt!251631 (choose!127 (buf!3891 thiss!1602) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) lt!251542))))

(assert (=> d!53549 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) (size!3433 (buf!3891 thiss!1602))))))

(assert (=> d!53549 (= (arrayUpdatedAtPrefixLemma!92 (buf!3891 thiss!1602) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) lt!251542) lt!251631)))

(declare-fun b!159401 () Bool)

(assert (=> b!159401 (= e!108833 (arrayRangesEq!484 (buf!3891 thiss!1602) (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) lt!251542) (size!3433 (buf!3891 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)))))

(assert (= (and d!53549 res!133051) b!159401))

(declare-fun m!251187 () Bool)

(assert (=> d!53549 m!251187))

(assert (=> b!159401 m!251049))

(assert (=> b!159401 m!251051))

(assert (=> b!159357 d!53549))

(declare-fun d!53551 () Bool)

(assert (=> d!53551 (= (array_inv!3180 (buf!3891 thiss!1602)) (bvsge (size!3433 (buf!3891 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159358 d!53551))

(declare-fun d!53553 () Bool)

(declare-fun res!133052 () Bool)

(declare-fun e!108834 () Bool)

(assert (=> d!53553 (=> res!133052 e!108834)))

(assert (=> d!53553 (= res!133052 (= #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541))))))

(assert (=> d!53553 (= (arrayRangesEq!484 (buf!3891 thiss!1602) (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 (buf!3891 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541))) e!108834)))

(declare-fun b!159402 () Bool)

(declare-fun e!108835 () Bool)

(assert (=> b!159402 (= e!108834 e!108835)))

(declare-fun res!133053 () Bool)

(assert (=> b!159402 (=> (not res!133053) (not e!108835))))

(assert (=> b!159402 (= res!133053 (= (select (arr!4354 (buf!3891 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4354 (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 (buf!3891 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159403 () Bool)

(assert (=> b!159403 (= e!108835 (arrayRangesEq!484 (buf!3891 thiss!1602) (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 (buf!3891 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7119 (_3!501 lt!251541))))))

(assert (= (and d!53553 (not res!133052)) b!159402))

(assert (= (and b!159402 res!133053) b!159403))

(assert (=> b!159402 m!251177))

(declare-fun m!251189 () Bool)

(assert (=> b!159402 m!251189))

(declare-fun m!251191 () Bool)

(assert (=> b!159403 m!251191))

(assert (=> b!159359 d!53553))

(declare-fun d!53555 () Bool)

(declare-fun res!133054 () Bool)

(declare-fun e!108836 () Bool)

(assert (=> d!53555 (=> res!133054 e!108836)))

(assert (=> d!53555 (= res!133054 (= #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)))))

(assert (=> d!53555 (= (arrayRangesEq!484 (buf!3891 thiss!1602) (buf!3891 (_3!501 lt!251541)) #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)) e!108836)))

(declare-fun b!159404 () Bool)

(declare-fun e!108837 () Bool)

(assert (=> b!159404 (= e!108836 e!108837)))

(declare-fun res!133055 () Bool)

(assert (=> b!159404 (=> (not res!133055) (not e!108837))))

(assert (=> b!159404 (= res!133055 (= (select (arr!4354 (buf!3891 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) #b00000000000000000000000000000000)))))

(declare-fun b!159405 () Bool)

(assert (=> b!159405 (= e!108837 (arrayRangesEq!484 (buf!3891 thiss!1602) (buf!3891 (_3!501 lt!251541)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)))))

(assert (= (and d!53555 (not res!133054)) b!159404))

(assert (= (and b!159404 res!133055) b!159405))

(assert (=> b!159404 m!251177))

(declare-fun m!251193 () Bool)

(assert (=> b!159404 m!251193))

(declare-fun m!251195 () Bool)

(assert (=> b!159405 m!251195))

(assert (=> b!159359 d!53555))

(declare-fun d!53557 () Bool)

(declare-fun e!108838 () Bool)

(assert (=> d!53557 e!108838))

(declare-fun res!133056 () Bool)

(assert (=> d!53557 (=> (not res!133056) (not e!108838))))

(assert (=> d!53557 (= res!133056 (and (bvsge (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000000) (bvslt (currentByte!7119 (_3!501 lt!251541)) (size!3433 (buf!3891 thiss!1602)))))))

(declare-fun lt!251632 () Unit!10823)

(assert (=> d!53557 (= lt!251632 (choose!127 (buf!3891 thiss!1602) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))))))

(assert (=> d!53557 (and (bvsle #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541))) (bvslt (currentByte!7119 (_3!501 lt!251541)) (size!3433 (buf!3891 thiss!1602))))))

(assert (=> d!53557 (= (arrayUpdatedAtPrefixLemma!92 (buf!3891 thiss!1602) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) lt!251632)))

(declare-fun b!159406 () Bool)

(assert (=> b!159406 (= e!108838 (arrayRangesEq!484 (buf!3891 thiss!1602) (array!7579 (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 (buf!3891 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541))))))

(assert (= (and d!53557 res!133056) b!159406))

(assert (=> d!53557 m!251057))

(declare-fun m!251197 () Bool)

(assert (=> d!53557 m!251197))

(assert (=> b!159406 m!251069))

(assert (=> b!159406 m!251065))

(assert (=> b!159359 d!53557))

(declare-fun d!53559 () Bool)

(declare-fun res!133057 () Bool)

(declare-fun e!108839 () Bool)

(assert (=> d!53559 (=> res!133057 e!108839)))

(assert (=> d!53559 (= res!133057 (= #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541))))))

(assert (=> d!53559 (= (arrayRangesEq!484 lt!251545 (array!7579 (store (store (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602) lt!251543) (currentByte!7119 thiss!1602) lt!251539) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 (buf!3891 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541))) e!108839)))

(declare-fun b!159407 () Bool)

(declare-fun e!108840 () Bool)

(assert (=> b!159407 (= e!108839 e!108840)))

(declare-fun res!133058 () Bool)

(assert (=> b!159407 (=> (not res!133058) (not e!108840))))

(assert (=> b!159407 (= res!133058 (= (select (arr!4354 lt!251545) #b00000000000000000000000000000000) (select (arr!4354 (array!7579 (store (store (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602) lt!251543) (currentByte!7119 thiss!1602) lt!251539) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 (buf!3891 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159408 () Bool)

(assert (=> b!159408 (= e!108840 (arrayRangesEq!484 lt!251545 (array!7579 (store (store (store (arr!4354 (buf!3891 thiss!1602)) (currentByte!7119 thiss!1602) lt!251543) (currentByte!7119 thiss!1602) lt!251539) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 (buf!3891 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7119 (_3!501 lt!251541))))))

(assert (= (and d!53559 (not res!133057)) b!159407))

(assert (= (and b!159407 res!133058) b!159408))

(assert (=> b!159407 m!251179))

(declare-fun m!251199 () Bool)

(assert (=> b!159407 m!251199))

(declare-fun m!251201 () Bool)

(assert (=> b!159408 m!251201))

(assert (=> b!159359 d!53559))

(declare-fun d!53561 () Bool)

(assert (=> d!53561 (arrayRangesEq!484 (buf!3891 thiss!1602) (buf!3891 (_3!501 lt!251541)) #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001))))

(declare-fun lt!251635 () Unit!10823)

(declare-fun choose!128 (array!7578 array!7578 array!7578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10823)

(assert (=> d!53561 (= lt!251635 (choose!128 (buf!3891 thiss!1602) lt!251545 (buf!3891 (_3!501 lt!251541)) #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) (currentByte!7119 (_3!501 lt!251541))))))

(assert (=> d!53561 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) (currentByte!7119 (_3!501 lt!251541))))))

(assert (=> d!53561 (= (arrayRangesEqTransitive!127 (buf!3891 thiss!1602) lt!251545 (buf!3891 (_3!501 lt!251541)) #b00000000000000000000000000000000 (bvsub (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000001) (currentByte!7119 (_3!501 lt!251541))) lt!251635)))

(declare-fun bs!13278 () Bool)

(assert (= bs!13278 d!53561))

(assert (=> bs!13278 m!251063))

(declare-fun m!251205 () Bool)

(assert (=> bs!13278 m!251205))

(assert (=> b!159359 d!53561))

(declare-fun d!53567 () Bool)

(declare-fun e!108841 () Bool)

(assert (=> d!53567 e!108841))

(declare-fun res!133059 () Bool)

(assert (=> d!53567 (=> (not res!133059) (not e!108841))))

(assert (=> d!53567 (= res!133059 (and (bvsge (currentByte!7119 (_3!501 lt!251541)) #b00000000000000000000000000000000) (bvslt (currentByte!7119 (_3!501 lt!251541)) (size!3433 lt!251545))))))

(declare-fun lt!251636 () Unit!10823)

(assert (=> d!53567 (= lt!251636 (choose!127 lt!251545 (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))))))

(assert (=> d!53567 (and (bvsle #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541))) (bvslt (currentByte!7119 (_3!501 lt!251541)) (size!3433 lt!251545)))))

(assert (=> d!53567 (= (arrayUpdatedAtPrefixLemma!92 lt!251545 (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) lt!251636)))

(declare-fun b!159409 () Bool)

(assert (=> b!159409 (= e!108841 (arrayRangesEq!484 lt!251545 (array!7579 (store (arr!4354 lt!251545) (currentByte!7119 (_3!501 lt!251541)) (select (arr!4354 (buf!3891 (_3!501 lt!251541))) (currentByte!7119 (_3!501 lt!251541)))) (size!3433 lt!251545)) #b00000000000000000000000000000000 (currentByte!7119 (_3!501 lt!251541))))))

(assert (= (and d!53567 res!133059) b!159409))

(assert (=> d!53567 m!251057))

(declare-fun m!251207 () Bool)

(assert (=> d!53567 m!251207))

(declare-fun m!251209 () Bool)

(assert (=> b!159409 m!251209))

(declare-fun m!251211 () Bool)

(assert (=> b!159409 m!251211))

(assert (=> b!159359 d!53567))

(declare-fun d!53569 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53569 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3433 (buf!3891 thiss!1602))) ((_ sign_extend 32) (currentByte!7119 thiss!1602)) ((_ sign_extend 32) (currentBit!7114 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3433 (buf!3891 thiss!1602))) ((_ sign_extend 32) (currentByte!7119 thiss!1602)) ((_ sign_extend 32) (currentBit!7114 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13280 () Bool)

(assert (= bs!13280 d!53569))

(declare-fun m!251215 () Bool)

(assert (=> bs!13280 m!251215))

(assert (=> start!32212 d!53569))

(declare-fun d!53573 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53573 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7114 thiss!1602) (currentByte!7119 thiss!1602) (size!3433 (buf!3891 thiss!1602))))))

(declare-fun bs!13281 () Bool)

(assert (= bs!13281 d!53573))

(declare-fun m!251217 () Bool)

(assert (=> bs!13281 m!251217))

(assert (=> start!32212 d!53573))

(push 1)

(assert (not d!53573))

(assert (not d!53569))

(assert (not b!159408))

(assert (not b!159405))

(assert (not b!159409))

(assert (not b!159401))

(assert (not b!159403))

(assert (not d!53561))

(assert (not b!159396))

(assert (not d!53557))

(assert (not b!159406))

(assert (not d!53549))

(assert (not d!53567))

(assert (not b!159398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

