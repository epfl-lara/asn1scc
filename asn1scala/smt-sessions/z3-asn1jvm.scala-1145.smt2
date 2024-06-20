; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32418 () Bool)

(assert start!32418)

(declare-fun b!159827 () Bool)

(declare-datatypes ((Unit!10895 0))(
  ( (Unit!10896) )
))
(declare-fun e!109287 () Unit!10895)

(declare-fun Unit!10897 () Unit!10895)

(assert (=> b!159827 (= e!109287 Unit!10897)))

(declare-fun lt!252203 () Unit!10895)

(declare-datatypes ((array!7622 0))(
  ( (array!7623 (arr!4370 (Array (_ BitVec 32) (_ BitVec 8))) (size!3449 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6066 0))(
  ( (BitStream!6067 (buf!3907 array!7622) (currentByte!7152 (_ BitVec 32)) (currentBit!7147 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6066)

(declare-datatypes ((tuple3!800 0))(
  ( (tuple3!801 (_1!7748 Unit!10895) (_2!7748 (_ BitVec 8)) (_3!517 BitStream!6066)) )
))
(declare-fun lt!252204 () tuple3!800)

(declare-fun arrayUpdatedAtPrefixLemma!108 (array!7622 (_ BitVec 32) (_ BitVec 8)) Unit!10895)

(assert (=> b!159827 (= lt!252203 (arrayUpdatedAtPrefixLemma!108 (buf!3907 thiss!1602) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))))))

(declare-fun call!2702 () Bool)

(assert (=> b!159827 call!2702))

(declare-fun lt!252216 () Unit!10895)

(declare-fun lt!252206 () array!7622)

(assert (=> b!159827 (= lt!252216 (arrayUpdatedAtPrefixLemma!108 lt!252206 (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))))))

(declare-fun lt!252215 () (_ BitVec 8))

(declare-fun lt!252205 () (_ BitVec 8))

(declare-fun arrayRangesEq!500 (array!7622 array!7622 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159827 (arrayRangesEq!500 lt!252206 (array!7623 (store (store (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602) lt!252215) (currentByte!7152 thiss!1602) lt!252205) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 (buf!3907 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7152 (_3!517 lt!252204)))))

(declare-fun lt!252213 () Unit!10895)

(declare-fun arrayRangesEqTransitive!134 (array!7622 array!7622 array!7622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10895)

(assert (=> b!159827 (= lt!252213 (arrayRangesEqTransitive!134 (buf!3907 thiss!1602) lt!252206 (buf!3907 (_3!517 lt!252204)) #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) (currentByte!7152 (_3!517 lt!252204))))))

(declare-fun res!133412 () Bool)

(assert (=> b!159827 (= res!133412 (arrayRangesEq!500 (buf!3907 thiss!1602) (buf!3907 (_3!517 lt!252204)) #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)))))

(declare-fun e!109290 () Bool)

(assert (=> b!159827 (=> (not res!133412) (not e!109290))))

(assert (=> b!159827 e!109290))

(declare-fun res!133409 () Bool)

(declare-fun e!109293 () Bool)

(assert (=> start!32418 (=> (not res!133409) (not e!109293))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32418 (= res!133409 (validate_offset_byte!0 ((_ sign_extend 32) (size!3449 (buf!3907 thiss!1602))) ((_ sign_extend 32) (currentByte!7152 thiss!1602)) ((_ sign_extend 32) (currentBit!7147 thiss!1602))))))

(assert (=> start!32418 e!109293))

(declare-fun e!109286 () Bool)

(declare-fun inv!12 (BitStream!6066) Bool)

(assert (=> start!32418 (and (inv!12 thiss!1602) e!109286)))

(assert (=> start!32418 true))

(declare-fun b!159828 () Bool)

(declare-fun e!109289 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159828 (= e!109289 (byteRangesEq!0 (select (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602)) lt!252205 #b00000000000000000000000000000000 (currentBit!7147 thiss!1602)))))

(declare-fun b!159829 () Bool)

(declare-fun e!109292 () Bool)

(assert (=> b!159829 (= e!109293 (not e!109292))))

(declare-fun res!133410 () Bool)

(assert (=> b!159829 (=> res!133410 e!109292)))

(assert (=> b!159829 (= res!133410 (not (arrayRangesEq!500 (buf!3907 thiss!1602) lt!252206 #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001))))))

(declare-fun lt!252208 () (_ BitVec 8))

(assert (=> b!159829 (arrayRangesEq!500 (buf!3907 thiss!1602) (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) lt!252208) (size!3449 (buf!3907 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001))))

(declare-fun lt!252214 () Unit!10895)

(assert (=> b!159829 (= lt!252214 (arrayUpdatedAtPrefixLemma!108 (buf!3907 thiss!1602) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) lt!252208))))

(assert (=> b!159829 (= lt!252208 (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)))))

(declare-fun lt!252202 () (_ BitVec 32))

(declare-fun lt!252209 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252212 () (_ BitVec 32))

(declare-fun lt!252207 () Bool)

(declare-fun Unit!10898 () Unit!10895)

(declare-fun Unit!10899 () Unit!10895)

(assert (=> b!159829 (= lt!252204 (ite lt!252207 (let ((bdg!9437 ((_ extract 7 0) (bvnot lt!252202)))) (let ((bdg!9438 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602) lt!252215) (currentByte!7152 thiss!1602) lt!252205) (bvadd #b00000000000000000000000000000001 (currentByte!7152 thiss!1602)))) ((_ sign_extend 24) bdg!9437))))) (tuple3!801 Unit!10898 bdg!9437 (BitStream!6067 (array!7623 (store (arr!4370 (array!7623 (store (arr!4370 lt!252206) (bvadd #b00000000000000000000000000000001 (currentByte!7152 thiss!1602)) bdg!9438) (size!3449 lt!252206))) (bvadd #b00000000000000000000000000000001 (currentByte!7152 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9438) (bvshl ((_ sign_extend 24) v!222) lt!252212)))) (size!3449 (array!7623 (store (arr!4370 lt!252206) (bvadd #b00000000000000000000000000000001 (currentByte!7152 thiss!1602)) bdg!9438) (size!3449 lt!252206)))) (bvadd #b00000000000000000000000000000001 (currentByte!7152 thiss!1602)) (currentBit!7147 thiss!1602))))) (tuple3!801 Unit!10899 lt!252209 (BitStream!6067 lt!252206 (bvadd #b00000000000000000000000000000001 (currentByte!7152 thiss!1602)) (currentBit!7147 thiss!1602)))))))

(declare-fun lt!252211 () (_ BitVec 32))

(assert (=> b!159829 (= lt!252207 (bvsgt lt!252211 #b00000000000000000000000000000000))))

(assert (=> b!159829 e!109289))

(declare-fun res!133408 () Bool)

(assert (=> b!159829 (=> res!133408 e!109289)))

(assert (=> b!159829 (= res!133408 (bvsge (currentByte!7152 thiss!1602) (size!3449 (buf!3907 thiss!1602))))))

(assert (=> b!159829 (= lt!252206 (array!7623 (store (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602) lt!252215) (currentByte!7152 thiss!1602) lt!252205) (size!3449 (buf!3907 thiss!1602))))))

(assert (=> b!159829 (= lt!252205 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252215) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252211))))))

(assert (=> b!159829 (= lt!252215 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602))) lt!252202)))))

(assert (=> b!159829 (= lt!252202 ((_ sign_extend 24) lt!252209))))

(assert (=> b!159829 (= lt!252209 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252212)))))))

(assert (=> b!159829 (= lt!252212 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252211))))))

(assert (=> b!159829 (= lt!252211 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7147 thiss!1602))))))

(declare-fun b!159830 () Bool)

(declare-fun Unit!10900 () Unit!10895)

(assert (=> b!159830 (= e!109287 Unit!10900)))

(assert (=> b!159830 call!2702))

(declare-fun c!8432 () Bool)

(declare-fun bm!2699 () Bool)

(assert (=> bm!2699 (= call!2702 (arrayRangesEq!500 (buf!3907 thiss!1602) (ite c!8432 (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 (buf!3907 thiss!1602))) (buf!3907 (_3!517 lt!252204))) #b00000000000000000000000000000000 (ite c!8432 (currentByte!7152 (_3!517 lt!252204)) (currentByte!7152 thiss!1602))))))

(declare-fun b!159831 () Bool)

(declare-fun e!109291 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159831 (= e!109291 (invariant!0 (currentBit!7147 thiss!1602) (currentByte!7152 thiss!1602) (size!3449 (buf!3907 thiss!1602))))))

(declare-fun b!159832 () Bool)

(declare-fun array_inv!3196 (array!7622) Bool)

(assert (=> b!159832 (= e!109286 (array_inv!3196 (buf!3907 thiss!1602)))))

(declare-fun b!159833 () Bool)

(assert (=> b!159833 (= e!109292 e!109291)))

(declare-fun res!133411 () Bool)

(assert (=> b!159833 (=> res!133411 e!109291)))

(assert (=> b!159833 (= res!133411 (not (= (size!3449 (buf!3907 thiss!1602)) (size!3449 (buf!3907 (_3!517 lt!252204))))))))

(declare-fun lt!252210 () Unit!10895)

(assert (=> b!159833 (= lt!252210 e!109287)))

(assert (=> b!159833 (= c!8432 lt!252207)))

(declare-fun b!159834 () Bool)

(assert (=> b!159834 (= e!109290 (arrayRangesEq!500 (buf!3907 thiss!1602) (buf!3907 (_3!517 lt!252204)) #b00000000000000000000000000000000 (currentByte!7152 thiss!1602)))))

(assert (= (and start!32418 res!133409) b!159829))

(assert (= (and b!159829 (not res!133408)) b!159828))

(assert (= (and b!159829 (not res!133410)) b!159833))

(assert (= (and b!159833 c!8432) b!159827))

(assert (= (and b!159833 (not c!8432)) b!159830))

(assert (= (and b!159827 res!133412) b!159834))

(assert (= (or b!159827 b!159830) bm!2699))

(assert (= (and b!159833 (not res!133411)) b!159831))

(assert (= start!32418 b!159832))

(declare-fun m!252117 () Bool)

(assert (=> start!32418 m!252117))

(declare-fun m!252119 () Bool)

(assert (=> start!32418 m!252119))

(declare-fun m!252121 () Bool)

(assert (=> b!159834 m!252121))

(declare-fun m!252123 () Bool)

(assert (=> b!159832 m!252123))

(declare-fun m!252125 () Bool)

(assert (=> b!159828 m!252125))

(assert (=> b!159828 m!252125))

(declare-fun m!252127 () Bool)

(assert (=> b!159828 m!252127))

(declare-fun m!252129 () Bool)

(assert (=> bm!2699 m!252129))

(declare-fun m!252131 () Bool)

(assert (=> bm!2699 m!252131))

(declare-fun m!252133 () Bool)

(assert (=> bm!2699 m!252133))

(declare-fun m!252135 () Bool)

(assert (=> b!159829 m!252135))

(declare-fun m!252137 () Bool)

(assert (=> b!159829 m!252137))

(declare-fun m!252139 () Bool)

(assert (=> b!159829 m!252139))

(assert (=> b!159829 m!252125))

(declare-fun m!252141 () Bool)

(assert (=> b!159829 m!252141))

(declare-fun m!252143 () Bool)

(assert (=> b!159829 m!252143))

(declare-fun m!252145 () Bool)

(assert (=> b!159829 m!252145))

(declare-fun m!252147 () Bool)

(assert (=> b!159829 m!252147))

(declare-fun m!252149 () Bool)

(assert (=> b!159829 m!252149))

(declare-fun m!252151 () Bool)

(assert (=> b!159829 m!252151))

(declare-fun m!252153 () Bool)

(assert (=> b!159829 m!252153))

(declare-fun m!252155 () Bool)

(assert (=> b!159829 m!252155))

(declare-fun m!252157 () Bool)

(assert (=> b!159827 m!252157))

(assert (=> b!159827 m!252135))

(declare-fun m!252159 () Bool)

(assert (=> b!159827 m!252159))

(declare-fun m!252161 () Bool)

(assert (=> b!159827 m!252161))

(declare-fun m!252163 () Bool)

(assert (=> b!159827 m!252163))

(assert (=> b!159827 m!252129))

(declare-fun m!252165 () Bool)

(assert (=> b!159827 m!252165))

(assert (=> b!159827 m!252129))

(assert (=> b!159827 m!252143))

(assert (=> b!159827 m!252129))

(declare-fun m!252167 () Bool)

(assert (=> b!159827 m!252167))

(declare-fun m!252169 () Bool)

(assert (=> b!159831 m!252169))

(check-sat (not b!159832) (not b!159828) (not start!32418) (not b!159834) (not b!159827) (not b!159829) (not bm!2699) (not b!159831))
(check-sat)
(get-model)

(declare-fun d!53859 () Bool)

(assert (=> d!53859 (= (byteRangesEq!0 (select (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602)) lt!252205 #b00000000000000000000000000000000 (currentBit!7147 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7147 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7147 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!252205) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7147 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13341 () Bool)

(assert (= bs!13341 d!53859))

(declare-fun m!252225 () Bool)

(assert (=> bs!13341 m!252225))

(declare-fun m!252227 () Bool)

(assert (=> bs!13341 m!252227))

(assert (=> b!159828 d!53859))

(declare-fun d!53861 () Bool)

(assert (=> d!53861 (= (array_inv!3196 (buf!3907 thiss!1602)) (bvsge (size!3449 (buf!3907 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159832 d!53861))

(declare-fun d!53863 () Bool)

(declare-fun res!133432 () Bool)

(declare-fun e!109322 () Bool)

(assert (=> d!53863 (=> res!133432 e!109322)))

(assert (=> d!53863 (= res!133432 (= #b00000000000000000000000000000000 (currentByte!7152 thiss!1602)))))

(assert (=> d!53863 (= (arrayRangesEq!500 (buf!3907 thiss!1602) (buf!3907 (_3!517 lt!252204)) #b00000000000000000000000000000000 (currentByte!7152 thiss!1602)) e!109322)))

(declare-fun b!159863 () Bool)

(declare-fun e!109323 () Bool)

(assert (=> b!159863 (= e!109322 e!109323)))

(declare-fun res!133433 () Bool)

(assert (=> b!159863 (=> (not res!133433) (not e!109323))))

(assert (=> b!159863 (= res!133433 (= (select (arr!4370 (buf!3907 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) #b00000000000000000000000000000000)))))

(declare-fun b!159864 () Bool)

(assert (=> b!159864 (= e!109323 (arrayRangesEq!500 (buf!3907 thiss!1602) (buf!3907 (_3!517 lt!252204)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7152 thiss!1602)))))

(assert (= (and d!53863 (not res!133432)) b!159863))

(assert (= (and b!159863 res!133433) b!159864))

(declare-fun m!252229 () Bool)

(assert (=> b!159863 m!252229))

(declare-fun m!252231 () Bool)

(assert (=> b!159863 m!252231))

(declare-fun m!252233 () Bool)

(assert (=> b!159864 m!252233))

(assert (=> b!159834 d!53863))

(declare-fun d!53865 () Bool)

(declare-fun res!133434 () Bool)

(declare-fun e!109324 () Bool)

(assert (=> d!53865 (=> res!133434 e!109324)))

(assert (=> d!53865 (= res!133434 (= #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)))))

(assert (=> d!53865 (= (arrayRangesEq!500 (buf!3907 thiss!1602) lt!252206 #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)) e!109324)))

(declare-fun b!159865 () Bool)

(declare-fun e!109325 () Bool)

(assert (=> b!159865 (= e!109324 e!109325)))

(declare-fun res!133435 () Bool)

(assert (=> b!159865 (=> (not res!133435) (not e!109325))))

(assert (=> b!159865 (= res!133435 (= (select (arr!4370 (buf!3907 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4370 lt!252206) #b00000000000000000000000000000000)))))

(declare-fun b!159866 () Bool)

(assert (=> b!159866 (= e!109325 (arrayRangesEq!500 (buf!3907 thiss!1602) lt!252206 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)))))

(assert (= (and d!53865 (not res!133434)) b!159865))

(assert (= (and b!159865 res!133435) b!159866))

(assert (=> b!159865 m!252229))

(declare-fun m!252235 () Bool)

(assert (=> b!159865 m!252235))

(declare-fun m!252237 () Bool)

(assert (=> b!159866 m!252237))

(assert (=> b!159829 d!53865))

(declare-fun d!53867 () Bool)

(declare-fun res!133436 () Bool)

(declare-fun e!109326 () Bool)

(assert (=> d!53867 (=> res!133436 e!109326)))

(assert (=> d!53867 (= res!133436 (= #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)))))

(assert (=> d!53867 (= (arrayRangesEq!500 (buf!3907 thiss!1602) (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) lt!252208) (size!3449 (buf!3907 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)) e!109326)))

(declare-fun b!159867 () Bool)

(declare-fun e!109327 () Bool)

(assert (=> b!159867 (= e!109326 e!109327)))

(declare-fun res!133437 () Bool)

(assert (=> b!159867 (=> (not res!133437) (not e!109327))))

(assert (=> b!159867 (= res!133437 (= (select (arr!4370 (buf!3907 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4370 (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) lt!252208) (size!3449 (buf!3907 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159868 () Bool)

(assert (=> b!159868 (= e!109327 (arrayRangesEq!500 (buf!3907 thiss!1602) (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) lt!252208) (size!3449 (buf!3907 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)))))

(assert (= (and d!53867 (not res!133436)) b!159867))

(assert (= (and b!159867 res!133437) b!159868))

(assert (=> b!159867 m!252229))

(declare-fun m!252239 () Bool)

(assert (=> b!159867 m!252239))

(declare-fun m!252241 () Bool)

(assert (=> b!159868 m!252241))

(assert (=> b!159829 d!53867))

(declare-fun d!53869 () Bool)

(declare-fun e!109330 () Bool)

(assert (=> d!53869 e!109330))

(declare-fun res!133440 () Bool)

(assert (=> d!53869 (=> (not res!133440) (not e!109330))))

(assert (=> d!53869 (= res!133440 (and (bvsge (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) (size!3449 (buf!3907 thiss!1602)))))))

(declare-fun lt!252264 () Unit!10895)

(declare-fun choose!143 (array!7622 (_ BitVec 32) (_ BitVec 8)) Unit!10895)

(assert (=> d!53869 (= lt!252264 (choose!143 (buf!3907 thiss!1602) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) lt!252208))))

(assert (=> d!53869 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) (size!3449 (buf!3907 thiss!1602))))))

(assert (=> d!53869 (= (arrayUpdatedAtPrefixLemma!108 (buf!3907 thiss!1602) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) lt!252208) lt!252264)))

(declare-fun b!159871 () Bool)

(assert (=> b!159871 (= e!109330 (arrayRangesEq!500 (buf!3907 thiss!1602) (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) lt!252208) (size!3449 (buf!3907 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)))))

(assert (= (and d!53869 res!133440) b!159871))

(declare-fun m!252243 () Bool)

(assert (=> d!53869 m!252243))

(assert (=> b!159871 m!252155))

(assert (=> b!159871 m!252151))

(assert (=> b!159829 d!53869))

(declare-fun d!53871 () Bool)

(declare-fun res!133441 () Bool)

(declare-fun e!109331 () Bool)

(assert (=> d!53871 (=> res!133441 e!109331)))

(assert (=> d!53871 (= res!133441 (= #b00000000000000000000000000000000 (ite c!8432 (currentByte!7152 (_3!517 lt!252204)) (currentByte!7152 thiss!1602))))))

(assert (=> d!53871 (= (arrayRangesEq!500 (buf!3907 thiss!1602) (ite c!8432 (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 (buf!3907 thiss!1602))) (buf!3907 (_3!517 lt!252204))) #b00000000000000000000000000000000 (ite c!8432 (currentByte!7152 (_3!517 lt!252204)) (currentByte!7152 thiss!1602))) e!109331)))

(declare-fun b!159872 () Bool)

(declare-fun e!109332 () Bool)

(assert (=> b!159872 (= e!109331 e!109332)))

(declare-fun res!133442 () Bool)

(assert (=> b!159872 (=> (not res!133442) (not e!109332))))

(assert (=> b!159872 (= res!133442 (= (select (arr!4370 (buf!3907 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4370 (ite c!8432 (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 (buf!3907 thiss!1602))) (buf!3907 (_3!517 lt!252204)))) #b00000000000000000000000000000000)))))

(declare-fun b!159873 () Bool)

(assert (=> b!159873 (= e!109332 (arrayRangesEq!500 (buf!3907 thiss!1602) (ite c!8432 (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 (buf!3907 thiss!1602))) (buf!3907 (_3!517 lt!252204))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8432 (currentByte!7152 (_3!517 lt!252204)) (currentByte!7152 thiss!1602))))))

(assert (= (and d!53871 (not res!133441)) b!159872))

(assert (= (and b!159872 res!133442) b!159873))

(assert (=> b!159872 m!252229))

(declare-fun m!252245 () Bool)

(assert (=> b!159872 m!252245))

(declare-fun m!252247 () Bool)

(assert (=> b!159873 m!252247))

(assert (=> bm!2699 d!53871))

(declare-fun d!53873 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53873 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3449 (buf!3907 thiss!1602))) ((_ sign_extend 32) (currentByte!7152 thiss!1602)) ((_ sign_extend 32) (currentBit!7147 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3449 (buf!3907 thiss!1602))) ((_ sign_extend 32) (currentByte!7152 thiss!1602)) ((_ sign_extend 32) (currentBit!7147 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13342 () Bool)

(assert (= bs!13342 d!53873))

(declare-fun m!252249 () Bool)

(assert (=> bs!13342 m!252249))

(assert (=> start!32418 d!53873))

(declare-fun d!53875 () Bool)

(assert (=> d!53875 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7147 thiss!1602) (currentByte!7152 thiss!1602) (size!3449 (buf!3907 thiss!1602))))))

(declare-fun bs!13343 () Bool)

(assert (= bs!13343 d!53875))

(assert (=> bs!13343 m!252169))

(assert (=> start!32418 d!53875))

(declare-fun d!53877 () Bool)

(declare-fun e!109333 () Bool)

(assert (=> d!53877 e!109333))

(declare-fun res!133443 () Bool)

(assert (=> d!53877 (=> (not res!133443) (not e!109333))))

(assert (=> d!53877 (= res!133443 (and (bvsge (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000000) (bvslt (currentByte!7152 (_3!517 lt!252204)) (size!3449 lt!252206))))))

(declare-fun lt!252265 () Unit!10895)

(assert (=> d!53877 (= lt!252265 (choose!143 lt!252206 (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))))))

(assert (=> d!53877 (and (bvsle #b00000000000000000000000000000000 (currentByte!7152 (_3!517 lt!252204))) (bvslt (currentByte!7152 (_3!517 lt!252204)) (size!3449 lt!252206)))))

(assert (=> d!53877 (= (arrayUpdatedAtPrefixLemma!108 lt!252206 (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) lt!252265)))

(declare-fun b!159874 () Bool)

(assert (=> b!159874 (= e!109333 (arrayRangesEq!500 lt!252206 (array!7623 (store (arr!4370 lt!252206) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 lt!252206)) #b00000000000000000000000000000000 (currentByte!7152 (_3!517 lt!252204))))))

(assert (= (and d!53877 res!133443) b!159874))

(assert (=> d!53877 m!252129))

(declare-fun m!252251 () Bool)

(assert (=> d!53877 m!252251))

(declare-fun m!252253 () Bool)

(assert (=> b!159874 m!252253))

(declare-fun m!252255 () Bool)

(assert (=> b!159874 m!252255))

(assert (=> b!159827 d!53877))

(declare-fun d!53879 () Bool)

(declare-fun res!133444 () Bool)

(declare-fun e!109334 () Bool)

(assert (=> d!53879 (=> res!133444 e!109334)))

(assert (=> d!53879 (= res!133444 (= #b00000000000000000000000000000000 (currentByte!7152 (_3!517 lt!252204))))))

(assert (=> d!53879 (= (arrayRangesEq!500 lt!252206 (array!7623 (store (store (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602) lt!252215) (currentByte!7152 thiss!1602) lt!252205) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 (buf!3907 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7152 (_3!517 lt!252204))) e!109334)))

(declare-fun b!159875 () Bool)

(declare-fun e!109335 () Bool)

(assert (=> b!159875 (= e!109334 e!109335)))

(declare-fun res!133445 () Bool)

(assert (=> b!159875 (=> (not res!133445) (not e!109335))))

(assert (=> b!159875 (= res!133445 (= (select (arr!4370 lt!252206) #b00000000000000000000000000000000) (select (arr!4370 (array!7623 (store (store (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602) lt!252215) (currentByte!7152 thiss!1602) lt!252205) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 (buf!3907 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159876 () Bool)

(assert (=> b!159876 (= e!109335 (arrayRangesEq!500 lt!252206 (array!7623 (store (store (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 thiss!1602) lt!252215) (currentByte!7152 thiss!1602) lt!252205) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 (buf!3907 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7152 (_3!517 lt!252204))))))

(assert (= (and d!53879 (not res!133444)) b!159875))

(assert (= (and b!159875 res!133445) b!159876))

(assert (=> b!159875 m!252235))

(declare-fun m!252257 () Bool)

(assert (=> b!159875 m!252257))

(declare-fun m!252259 () Bool)

(assert (=> b!159876 m!252259))

(assert (=> b!159827 d!53879))

(declare-fun d!53881 () Bool)

(declare-fun res!133446 () Bool)

(declare-fun e!109336 () Bool)

(assert (=> d!53881 (=> res!133446 e!109336)))

(assert (=> d!53881 (= res!133446 (= #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)))))

(assert (=> d!53881 (= (arrayRangesEq!500 (buf!3907 thiss!1602) (buf!3907 (_3!517 lt!252204)) #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)) e!109336)))

(declare-fun b!159877 () Bool)

(declare-fun e!109337 () Bool)

(assert (=> b!159877 (= e!109336 e!109337)))

(declare-fun res!133447 () Bool)

(assert (=> b!159877 (=> (not res!133447) (not e!109337))))

(assert (=> b!159877 (= res!133447 (= (select (arr!4370 (buf!3907 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) #b00000000000000000000000000000000)))))

(declare-fun b!159878 () Bool)

(assert (=> b!159878 (= e!109337 (arrayRangesEq!500 (buf!3907 thiss!1602) (buf!3907 (_3!517 lt!252204)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)))))

(assert (= (and d!53881 (not res!133446)) b!159877))

(assert (= (and b!159877 res!133447) b!159878))

(assert (=> b!159877 m!252229))

(assert (=> b!159877 m!252231))

(declare-fun m!252261 () Bool)

(assert (=> b!159878 m!252261))

(assert (=> b!159827 d!53881))

(declare-fun d!53883 () Bool)

(assert (=> d!53883 (arrayRangesEq!500 (buf!3907 thiss!1602) (buf!3907 (_3!517 lt!252204)) #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001))))

(declare-fun lt!252268 () Unit!10895)

(declare-fun choose!144 (array!7622 array!7622 array!7622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10895)

(assert (=> d!53883 (= lt!252268 (choose!144 (buf!3907 thiss!1602) lt!252206 (buf!3907 (_3!517 lt!252204)) #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) (currentByte!7152 (_3!517 lt!252204))))))

(assert (=> d!53883 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) (currentByte!7152 (_3!517 lt!252204))))))

(assert (=> d!53883 (= (arrayRangesEqTransitive!134 (buf!3907 thiss!1602) lt!252206 (buf!3907 (_3!517 lt!252204)) #b00000000000000000000000000000000 (bvsub (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000001) (currentByte!7152 (_3!517 lt!252204))) lt!252268)))

(declare-fun bs!13344 () Bool)

(assert (= bs!13344 d!53883))

(assert (=> bs!13344 m!252157))

(declare-fun m!252263 () Bool)

(assert (=> bs!13344 m!252263))

(assert (=> b!159827 d!53883))

(declare-fun d!53885 () Bool)

(declare-fun e!109338 () Bool)

(assert (=> d!53885 e!109338))

(declare-fun res!133448 () Bool)

(assert (=> d!53885 (=> (not res!133448) (not e!109338))))

(assert (=> d!53885 (= res!133448 (and (bvsge (currentByte!7152 (_3!517 lt!252204)) #b00000000000000000000000000000000) (bvslt (currentByte!7152 (_3!517 lt!252204)) (size!3449 (buf!3907 thiss!1602)))))))

(declare-fun lt!252269 () Unit!10895)

(assert (=> d!53885 (= lt!252269 (choose!143 (buf!3907 thiss!1602) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))))))

(assert (=> d!53885 (and (bvsle #b00000000000000000000000000000000 (currentByte!7152 (_3!517 lt!252204))) (bvslt (currentByte!7152 (_3!517 lt!252204)) (size!3449 (buf!3907 thiss!1602))))))

(assert (=> d!53885 (= (arrayUpdatedAtPrefixLemma!108 (buf!3907 thiss!1602) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) lt!252269)))

(declare-fun b!159879 () Bool)

(assert (=> b!159879 (= e!109338 (arrayRangesEq!500 (buf!3907 thiss!1602) (array!7623 (store (arr!4370 (buf!3907 thiss!1602)) (currentByte!7152 (_3!517 lt!252204)) (select (arr!4370 (buf!3907 (_3!517 lt!252204))) (currentByte!7152 (_3!517 lt!252204)))) (size!3449 (buf!3907 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7152 (_3!517 lt!252204))))))

(assert (= (and d!53885 res!133448) b!159879))

(assert (=> d!53885 m!252129))

(declare-fun m!252265 () Bool)

(assert (=> d!53885 m!252265))

(assert (=> b!159879 m!252131))

(declare-fun m!252267 () Bool)

(assert (=> b!159879 m!252267))

(assert (=> b!159827 d!53885))

(declare-fun d!53887 () Bool)

(assert (=> d!53887 (= (invariant!0 (currentBit!7147 thiss!1602) (currentByte!7152 thiss!1602) (size!3449 (buf!3907 thiss!1602))) (and (bvsge (currentBit!7147 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7147 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7152 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7152 thiss!1602) (size!3449 (buf!3907 thiss!1602))) (and (= (currentBit!7147 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7152 thiss!1602) (size!3449 (buf!3907 thiss!1602)))))))))

(assert (=> b!159831 d!53887))

(check-sat (not d!53885) (not b!159874) (not d!53877) (not d!53875) (not b!159868) (not b!159876) (not b!159866) (not d!53883) (not b!159879) (not b!159864) (not d!53869) (not d!53873) (not b!159871) (not b!159873) (not b!159878))
(check-sat)
