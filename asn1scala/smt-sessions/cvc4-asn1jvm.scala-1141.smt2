; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32264 () Bool)

(assert start!32264)

(declare-fun b!159481 () Bool)

(declare-fun e!108924 () Bool)

(declare-datatypes ((array!7591 0))(
  ( (array!7592 (arr!4359 (Array (_ BitVec 32) (_ BitVec 8))) (size!3438 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6044 0))(
  ( (BitStream!6045 (buf!3896 array!7591) (currentByte!7127 (_ BitVec 32)) (currentBit!7122 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6044)

(declare-fun lt!251751 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159481 (= e!108924 (byteRangesEq!0 (select (arr!4359 (buf!3896 thiss!1602)) (currentByte!7127 thiss!1602)) lt!251751 #b00000000000000000000000000000000 (currentBit!7122 thiss!1602)))))

(declare-fun b!159480 () Bool)

(declare-fun e!108922 () Bool)

(declare-fun e!108921 () Bool)

(assert (=> b!159480 (= e!108922 (not e!108921))))

(declare-fun res!133123 () Bool)

(assert (=> b!159480 (=> res!133123 e!108921)))

(declare-fun lt!251749 () array!7591)

(declare-datatypes ((Unit!10843 0))(
  ( (Unit!10844) )
))
(declare-datatypes ((tuple3!778 0))(
  ( (tuple3!779 (_1!7737 Unit!10843) (_2!7737 (_ BitVec 8)) (_3!506 BitStream!6044)) )
))
(declare-fun lt!251750 () tuple3!778)

(declare-fun arrayRangesEq!489 (array!7591 array!7591 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159480 (= res!133123 (not (arrayRangesEq!489 (buf!3896 thiss!1602) lt!251749 #b00000000000000000000000000000000 (bvsub (currentByte!7127 (_3!506 lt!251750)) #b00000000000000000000000000000001))))))

(declare-fun lt!251745 () (_ BitVec 8))

(assert (=> b!159480 (arrayRangesEq!489 (buf!3896 thiss!1602) (array!7592 (store (arr!4359 (buf!3896 thiss!1602)) (bvsub (currentByte!7127 (_3!506 lt!251750)) #b00000000000000000000000000000001) lt!251745) (size!3438 (buf!3896 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7127 (_3!506 lt!251750)) #b00000000000000000000000000000001))))

(declare-fun lt!251748 () Unit!10843)

(declare-fun arrayUpdatedAtPrefixLemma!97 (array!7591 (_ BitVec 32) (_ BitVec 8)) Unit!10843)

(assert (=> b!159480 (= lt!251748 (arrayUpdatedAtPrefixLemma!97 (buf!3896 thiss!1602) (bvsub (currentByte!7127 (_3!506 lt!251750)) #b00000000000000000000000000000001) lt!251745))))

(assert (=> b!159480 (= lt!251745 (select (arr!4359 (buf!3896 (_3!506 lt!251750))) (bvsub (currentByte!7127 (_3!506 lt!251750)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251743 () (_ BitVec 8))

(declare-fun lt!251741 () Bool)

(declare-fun lt!251742 () (_ BitVec 32))

(declare-fun lt!251747 () (_ BitVec 8))

(declare-fun lt!251746 () (_ BitVec 32))

(declare-fun Unit!10845 () Unit!10843)

(declare-fun Unit!10846 () Unit!10843)

(assert (=> b!159480 (= lt!251750 (ite lt!251741 (let ((bdg!9381 ((_ extract 7 0) (bvnot lt!251742)))) (let ((bdg!9382 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4359 (buf!3896 thiss!1602)) (currentByte!7127 thiss!1602) lt!251743) (currentByte!7127 thiss!1602) lt!251751) (bvadd #b00000000000000000000000000000001 (currentByte!7127 thiss!1602)))) ((_ sign_extend 24) bdg!9381))))) (tuple3!779 Unit!10845 bdg!9381 (BitStream!6045 (array!7592 (store (arr!4359 (array!7592 (store (arr!4359 lt!251749) (bvadd #b00000000000000000000000000000001 (currentByte!7127 thiss!1602)) bdg!9382) (size!3438 lt!251749))) (bvadd #b00000000000000000000000000000001 (currentByte!7127 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9382) (bvshl ((_ sign_extend 24) v!222) lt!251746)))) (size!3438 (array!7592 (store (arr!4359 lt!251749) (bvadd #b00000000000000000000000000000001 (currentByte!7127 thiss!1602)) bdg!9382) (size!3438 lt!251749)))) (bvadd #b00000000000000000000000000000001 (currentByte!7127 thiss!1602)) (currentBit!7122 thiss!1602))))) (tuple3!779 Unit!10846 lt!251747 (BitStream!6045 lt!251749 (bvadd #b00000000000000000000000000000001 (currentByte!7127 thiss!1602)) (currentBit!7122 thiss!1602)))))))

(declare-fun lt!251744 () (_ BitVec 32))

(assert (=> b!159480 (= lt!251741 (bvsgt lt!251744 #b00000000000000000000000000000000))))

(assert (=> b!159480 e!108924))

(declare-fun res!133124 () Bool)

(assert (=> b!159480 (=> res!133124 e!108924)))

(assert (=> b!159480 (= res!133124 (bvsge (currentByte!7127 thiss!1602) (size!3438 (buf!3896 thiss!1602))))))

(assert (=> b!159480 (= lt!251749 (array!7592 (store (store (arr!4359 (buf!3896 thiss!1602)) (currentByte!7127 thiss!1602) lt!251743) (currentByte!7127 thiss!1602) lt!251751) (size!3438 (buf!3896 thiss!1602))))))

(assert (=> b!159480 (= lt!251751 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251743) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251744))))))

(assert (=> b!159480 (= lt!251743 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4359 (buf!3896 thiss!1602)) (currentByte!7127 thiss!1602))) lt!251742)))))

(assert (=> b!159480 (= lt!251742 ((_ sign_extend 24) lt!251747))))

(assert (=> b!159480 (= lt!251747 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251746)))))))

(assert (=> b!159480 (= lt!251746 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251744))))))

(assert (=> b!159480 (= lt!251744 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7122 thiss!1602))))))

(declare-fun b!159482 () Bool)

(assert (=> b!159482 (= e!108921 (or lt!251741 (bvsle #b00000000000000000000000000000000 (currentByte!7127 thiss!1602))))))

(declare-fun res!133122 () Bool)

(assert (=> start!32264 (=> (not res!133122) (not e!108922))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32264 (= res!133122 (validate_offset_byte!0 ((_ sign_extend 32) (size!3438 (buf!3896 thiss!1602))) ((_ sign_extend 32) (currentByte!7127 thiss!1602)) ((_ sign_extend 32) (currentBit!7122 thiss!1602))))))

(assert (=> start!32264 e!108922))

(declare-fun e!108920 () Bool)

(declare-fun inv!12 (BitStream!6044) Bool)

(assert (=> start!32264 (and (inv!12 thiss!1602) e!108920)))

(assert (=> start!32264 true))

(declare-fun b!159483 () Bool)

(declare-fun array_inv!3185 (array!7591) Bool)

(assert (=> b!159483 (= e!108920 (array_inv!3185 (buf!3896 thiss!1602)))))

(assert (= (and start!32264 res!133122) b!159480))

(assert (= (and b!159480 (not res!133124)) b!159481))

(assert (= (and b!159480 (not res!133123)) b!159482))

(assert (= start!32264 b!159483))

(declare-fun m!251363 () Bool)

(assert (=> b!159481 m!251363))

(assert (=> b!159481 m!251363))

(declare-fun m!251365 () Bool)

(assert (=> b!159481 m!251365))

(declare-fun m!251367 () Bool)

(assert (=> b!159480 m!251367))

(declare-fun m!251369 () Bool)

(assert (=> b!159480 m!251369))

(declare-fun m!251371 () Bool)

(assert (=> b!159480 m!251371))

(declare-fun m!251373 () Bool)

(assert (=> b!159480 m!251373))

(declare-fun m!251375 () Bool)

(assert (=> b!159480 m!251375))

(declare-fun m!251377 () Bool)

(assert (=> b!159480 m!251377))

(declare-fun m!251379 () Bool)

(assert (=> b!159480 m!251379))

(declare-fun m!251381 () Bool)

(assert (=> b!159480 m!251381))

(assert (=> b!159480 m!251363))

(declare-fun m!251383 () Bool)

(assert (=> b!159480 m!251383))

(declare-fun m!251385 () Bool)

(assert (=> b!159480 m!251385))

(declare-fun m!251387 () Bool)

(assert (=> b!159480 m!251387))

(declare-fun m!251389 () Bool)

(assert (=> start!32264 m!251389))

(declare-fun m!251391 () Bool)

(assert (=> start!32264 m!251391))

(declare-fun m!251393 () Bool)

(assert (=> b!159483 m!251393))

(push 1)

(assert (not b!159481))

(assert (not b!159480))

(assert (not b!159483))

(assert (not start!32264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53631 () Bool)

(assert (=> d!53631 (= (byteRangesEq!0 (select (arr!4359 (buf!3896 thiss!1602)) (currentByte!7127 thiss!1602)) lt!251751 #b00000000000000000000000000000000 (currentBit!7122 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7122 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4359 (buf!3896 thiss!1602)) (currentByte!7127 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7122 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251751) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7122 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13294 () Bool)

(assert (= bs!13294 d!53631))

(declare-fun m!251413 () Bool)

(assert (=> bs!13294 m!251413))

(declare-fun m!251415 () Bool)

(assert (=> bs!13294 m!251415))

(assert (=> b!159481 d!53631))

(declare-fun d!53639 () Bool)

(declare-fun res!133144 () Bool)

(declare-fun e!108944 () Bool)

(assert (=> d!53639 (=> res!133144 e!108944)))

(assert (=> d!53639 (= res!133144 (= #b00000000000000000000000000000000 (bvsub (currentByte!7127 (_3!506 lt!251750)) #b00000000000000000000000000000001)))))

(assert (=> d!53639 (= (arrayRangesEq!489 (buf!3896 thiss!1602) lt!251749 #b00000000000000000000000000000000 (bvsub (currentByte!7127 (_3!506 lt!251750)) #b00000000000000000000000000000001)) e!108944)))

(declare-fun b!159503 () Bool)

(declare-fun e!108945 () Bool)

(assert (=> b!159503 (= e!108944 e!108945)))

(declare-fun res!133145 () Bool)

(assert (=> b!159503 (=> (not res!133145) (not e!108945))))

(assert (=> b!159503 (= res!133145 (= (select (arr!4359 (buf!3896 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4359 lt!251749) #b00000000000000000000000000000000)))))

(declare-fun b!159504 () Bool)

(assert (=> b!159504 (= e!108945 (arrayRangesEq!489 (buf!3896 thiss!1602) lt!251749 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7127 (_3!506 lt!251750)) #b00000000000000000000000000000001)))))

(assert (= (and d!53639 (not res!133144)) b!159503))

(assert (= (and b!159503 res!133145) b!159504))

(declare-fun m!251419 () Bool)

(assert (=> b!159503 m!251419))

(declare-fun m!251421 () Bool)

