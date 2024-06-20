; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35320 () Bool)

(assert start!35320)

(declare-fun b!165340 () Bool)

(declare-fun res!137705 () Bool)

(declare-fun e!114427 () Bool)

(assert (=> b!165340 (=> (not res!137705) (not e!114427))))

(declare-datatypes ((array!8415 0))(
  ( (array!8416 (arr!4678 (Array (_ BitVec 32) (_ BitVec 8))) (size!3757 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6670 0))(
  ( (BitStream!6671 (buf!4209 array!8415) (currentByte!7885 (_ BitVec 32)) (currentBit!7880 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6670)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!165340 (= res!137705 (bvsle (bvadd (currentBit!7880 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!165341 () Bool)

(declare-fun e!114426 () Bool)

(declare-fun array_inv!3498 (array!8415) Bool)

(assert (=> b!165341 (= e!114426 (array_inv!3498 (buf!4209 thiss!1577)))))

(declare-fun b!165342 () Bool)

(declare-fun res!137702 () Bool)

(assert (=> b!165342 (=> (not res!137702) (not e!114427))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165342 (= res!137702 (validate_offset_bits!1 ((_ sign_extend 32) (size!3757 (buf!4209 thiss!1577))) ((_ sign_extend 32) (currentByte!7885 thiss!1577)) ((_ sign_extend 32) (currentBit!7880 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165343 () Bool)

(declare-fun e!114428 () Bool)

(assert (=> b!165343 (= e!114427 (not e!114428))))

(declare-fun res!137701 () Bool)

(assert (=> b!165343 (=> res!137701 e!114428)))

(declare-fun lt!258612 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165343 (= res!137701 (not (byteRangesEq!0 (select (arr!4678 (buf!4209 thiss!1577)) (currentByte!7885 thiss!1577)) lt!258612 #b00000000000000000000000000000000 (currentBit!7880 thiss!1577))))))

(declare-fun lt!258611 () array!8415)

(declare-fun arrayRangesEq!637 (array!8415 array!8415 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165343 (arrayRangesEq!637 (buf!4209 thiss!1577) lt!258611 #b00000000000000000000000000000000 (currentByte!7885 thiss!1577))))

(declare-datatypes ((Unit!11486 0))(
  ( (Unit!11487) )
))
(declare-fun lt!258608 () Unit!11486)

(declare-fun arrayUpdatedAtPrefixLemma!245 (array!8415 (_ BitVec 32) (_ BitVec 8)) Unit!11486)

(assert (=> b!165343 (= lt!258608 (arrayUpdatedAtPrefixLemma!245 (buf!4209 thiss!1577) (currentByte!7885 thiss!1577) lt!258612))))

(assert (=> b!165343 (= lt!258611 (array!8416 (store (arr!4678 (buf!4209 thiss!1577)) (currentByte!7885 thiss!1577) lt!258612) (size!3757 (buf!4209 thiss!1577))))))

(declare-fun lt!258610 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165343 (= lt!258612 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4678 (buf!4209 thiss!1577)) (currentByte!7885 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7880 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258610)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258610))))))

(assert (=> b!165343 (= lt!258610 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7880 thiss!1577) nBits!511)))))

(declare-fun b!165344 () Bool)

(declare-fun res!137703 () Bool)

(assert (=> b!165344 (=> res!137703 e!114428)))

(declare-datatypes ((tuple2!14552 0))(
  ( (tuple2!14553 (_1!7867 Unit!11486) (_2!7867 BitStream!6670)) )
))
(declare-fun moveBitIndex!0 (BitStream!6670 (_ BitVec 64)) tuple2!14552)

(assert (=> b!165344 (= res!137703 (not (= (size!3757 (buf!4209 thiss!1577)) (size!3757 (buf!4209 (_2!7867 (moveBitIndex!0 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)) ((_ sign_extend 32) nBits!511))))))))))

(declare-fun lt!258609 () (_ BitVec 64))

(declare-fun lt!258607 () (_ BitVec 64))

(declare-fun b!165345 () Bool)

(assert (=> b!165345 (= e!114428 (or (not (= lt!258609 (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!258609 (bvand (bvadd lt!258607 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!165345 (= lt!258609 (bvand lt!258607 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!165345 (= lt!258607 (bitIndex!0 (size!3757 (buf!4209 thiss!1577)) (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)))))

(declare-fun res!137704 () Bool)

(assert (=> start!35320 (=> (not res!137704) (not e!114427))))

(assert (=> start!35320 (= res!137704 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35320 e!114427))

(assert (=> start!35320 true))

(declare-fun inv!12 (BitStream!6670) Bool)

(assert (=> start!35320 (and (inv!12 thiss!1577) e!114426)))

(assert (= (and start!35320 res!137704) b!165342))

(assert (= (and b!165342 res!137702) b!165340))

(assert (= (and b!165340 res!137705) b!165343))

(assert (= (and b!165343 (not res!137701)) b!165344))

(assert (= (and b!165344 (not res!137703)) b!165345))

(assert (= start!35320 b!165341))

(declare-fun m!262783 () Bool)

(assert (=> b!165341 m!262783))

(declare-fun m!262785 () Bool)

(assert (=> b!165342 m!262785))

(declare-fun m!262787 () Bool)

(assert (=> b!165344 m!262787))

(declare-fun m!262789 () Bool)

(assert (=> b!165345 m!262789))

(declare-fun m!262791 () Bool)

(assert (=> b!165343 m!262791))

(declare-fun m!262793 () Bool)

(assert (=> b!165343 m!262793))

(declare-fun m!262795 () Bool)

(assert (=> b!165343 m!262795))

(assert (=> b!165343 m!262795))

(declare-fun m!262797 () Bool)

(assert (=> b!165343 m!262797))

(declare-fun m!262799 () Bool)

(assert (=> b!165343 m!262799))

(declare-fun m!262801 () Bool)

(assert (=> b!165343 m!262801))

(declare-fun m!262803 () Bool)

(assert (=> b!165343 m!262803))

(declare-fun m!262805 () Bool)

(assert (=> b!165343 m!262805))

(declare-fun m!262807 () Bool)

(assert (=> start!35320 m!262807))

(push 1)

(assert (not b!165343))

(assert (not b!165341))

(assert (not start!35320))

(assert (not b!165344))

(assert (not b!165345))

(assert (not b!165342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57289 () Bool)

(declare-fun lt!258705 () (_ BitVec 32))

(assert (=> d!57289 (= lt!258705 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!258703 () (_ BitVec 32))

(assert (=> d!57289 (= lt!258703 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114486 () Bool)

(assert (=> d!57289 e!114486))

(declare-fun res!137770 () Bool)

(assert (=> d!57289 (=> (not res!137770) (not e!114486))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6670 (_ BitVec 64)) Bool)

(assert (=> d!57289 (= res!137770 (moveBitIndexPrecond!0 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11498 () Unit!11486)

(declare-fun Unit!11499 () Unit!11486)

(declare-fun Unit!11500 () Unit!11486)

(assert (=> d!57289 (= (moveBitIndex!0 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258705) #b00000000000000000000000000000000) (tuple2!14553 Unit!11498 (BitStream!6671 (buf!4209 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) (bvsub (bvadd (currentByte!7885 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258703) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!258705 (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258705) #b00000000000000000000000000001000) (tuple2!14553 Unit!11499 (BitStream!6671 (buf!4209 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) (bvadd (currentByte!7885 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258703 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258705) #b00000000000000000000000000001000))) (tuple2!14553 Unit!11500 (BitStream!6671 (buf!4209 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) (bvadd (currentByte!7885 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258703) (bvadd (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258705))))))))

(declare-fun b!165416 () Bool)

(declare-fun e!114485 () Bool)

(assert (=> b!165416 (= e!114486 e!114485)))

(declare-fun res!137771 () Bool)

(assert (=> b!165416 (=> (not res!137771) (not e!114485))))

(declare-fun lt!258707 () (_ BitVec 64))

(declare-fun lt!258704 () tuple2!14552)

(assert (=> b!165416 (= res!137771 (= (bvadd lt!258707 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3757 (buf!4209 (_2!7867 lt!258704))) (currentByte!7885 (_2!7867 lt!258704)) (currentBit!7880 (_2!7867 lt!258704)))))))

(assert (=> b!165416 (or (not (= (bvand lt!258707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!258707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!258707 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165416 (= lt!258707 (bitIndex!0 (size!3757 (buf!4209 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)))) (currentByte!7885 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)))))))

(declare-fun lt!258708 () (_ BitVec 32))

(declare-fun lt!258706 () (_ BitVec 32))

(declare-fun Unit!11501 () Unit!11486)

(declare-fun Unit!11502 () Unit!11486)

(declare-fun Unit!11503 () Unit!11486)

(assert (=> b!165416 (= lt!258704 (ite (bvslt (bvadd (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258706) #b00000000000000000000000000000000) (tuple2!14553 Unit!11501 (BitStream!6671 (buf!4209 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) (bvsub (bvadd (currentByte!7885 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258708) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!258706 (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258706) #b00000000000000000000000000001000) (tuple2!14553 Unit!11502 (BitStream!6671 (buf!4209 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) (bvadd (currentByte!7885 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258708 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258706) #b00000000000000000000000000001000))) (tuple2!14553 Unit!11503 (BitStream!6671 (buf!4209 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) (bvadd (currentByte!7885 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258708) (bvadd (currentBit!7880 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) lt!258706))))))))

(assert (=> b!165416 (= lt!258706 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165416 (= lt!258708 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!165417 () Bool)

(assert (=> b!165417 (= e!114485 (and (= (size!3757 (buf!4209 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)))) (size!3757 (buf!4209 (_2!7867 lt!258704)))) (= (buf!4209 (BitStream!6671 lt!258611 (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577))) (buf!4209 (_2!7867 lt!258704)))))))

(assert (= (and d!57289 res!137770) b!165416))

(assert (= (and b!165416 res!137771) b!165417))

(declare-fun m!262903 () Bool)

(assert (=> d!57289 m!262903))

(declare-fun m!262905 () Bool)

(assert (=> b!165416 m!262905))

(declare-fun m!262907 () Bool)

(assert (=> b!165416 m!262907))

(assert (=> b!165344 d!57289))

(declare-fun d!57313 () Bool)

(declare-fun e!114492 () Bool)

(assert (=> d!57313 e!114492))

(declare-fun res!137783 () Bool)

(assert (=> d!57313 (=> (not res!137783) (not e!114492))))

(declare-fun lt!258740 () (_ BitVec 64))

(declare-fun lt!258742 () (_ BitVec 64))

(declare-fun lt!258739 () (_ BitVec 64))

(assert (=> d!57313 (= res!137783 (= lt!258739 (bvsub lt!258742 lt!258740)))))

(assert (=> d!57313 (or (= (bvand lt!258742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258740 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258742 lt!258740) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57313 (= lt!258740 (remainingBits!0 ((_ sign_extend 32) (size!3757 (buf!4209 thiss!1577))) ((_ sign_extend 32) (currentByte!7885 thiss!1577)) ((_ sign_extend 32) (currentBit!7880 thiss!1577))))))

(declare-fun lt!258744 () (_ BitVec 64))

(declare-fun lt!258743 () (_ BitVec 64))

(assert (=> d!57313 (= lt!258742 (bvmul lt!258744 lt!258743))))

(assert (=> d!57313 (or (= lt!258744 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!258743 (bvsdiv (bvmul lt!258744 lt!258743) lt!258744)))))

(assert (=> d!57313 (= lt!258743 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57313 (= lt!258744 ((_ sign_extend 32) (size!3757 (buf!4209 thiss!1577))))))

(assert (=> d!57313 (= lt!258739 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7885 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7880 thiss!1577))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57313 (invariant!0 (currentBit!7880 thiss!1577) (currentByte!7885 thiss!1577) (size!3757 (buf!4209 thiss!1577)))))

(assert (=> d!57313 (= (bitIndex!0 (size!3757 (buf!4209 thiss!1577)) (currentByte!7885 thiss!1577) (currentBit!7880 thiss!1577)) lt!258739)))

(declare-fun b!165428 () Bool)

(declare-fun res!137782 () Bool)

(assert (=> b!165428 (=> (not res!137782) (not e!114492))))

(assert (=> b!165428 (= res!137782 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258739))))

(declare-fun b!165429 () Bool)

(declare-fun lt!258741 () (_ BitVec 64))

(assert (=> b!165429 (= e!114492 (bvsle lt!258739 (bvmul lt!258741 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165429 (or (= lt!258741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!258741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!258741)))))

(assert (=> b!165429 (= lt!258741 ((_ sign_extend 32) (size!3757 (buf!4209 thiss!1577))))))

(assert (= (and d!57313 res!137783) b!165428))

(assert (= (and b!165428 res!137782) b!165429))

(declare-fun m!262909 () Bool)

(assert (=> d!57313 m!262909))

(declare-fun m!262911 () Bool)

(assert (=> d!57313 m!262911))

(assert (=> b!165345 d!57313))

(declare-fun d!57319 () Bool)

(assert (=> d!57319 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7880 thiss!1577) (currentByte!7885 thiss!1577) (size!3757 (buf!4209 thiss!1577))))))

(declare-fun bs!14239 () Bool)

(assert (= bs!14239 d!57319))

(assert (=> bs!14239 m!262911))

(assert (=> start!35320 d!57319))

(declare-fun d!57321 () Bool)

(assert (=> d!57321 (= (array_inv!3498 (buf!4209 thiss!1577)) (bvsge (size!3757 (buf!4209 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165341 d!57321))

(declare-fun d!57323 () Bool)

(assert (=> d!57323 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3757 (buf!4209 thiss!1577))) ((_ sign_extend 32) (currentByte!7885 thiss!1577)) ((_ sign_extend 32) (currentBit!7880 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3757 (buf!4209 thiss!1577))) ((_ sign_extend 32) (currentByte!7885 thiss!1577)) ((_ sign_extend 32) (currentBit!7880 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14240 () Bool)

(assert (= bs!14240 d!57323))

(assert (=> bs!14240 m!262909))

(assert (=> b!165342 d!57323))

(declare-fun d!57325 () Bool)

(assert (=> d!57325 (= (byteRangesEq!0 (select (arr!4678 (buf!4209 thiss!1577)) (currentByte!7885 thiss!1577)) lt!258612 #b00000000000000000000000000000000 (currentBit!7880 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7880 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4678 (buf!4209 thiss!1577)) (currentByte!7885 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7880 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258612) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7880 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14241 () Bool)

(assert (= bs!14241 d!57325))

(declare-fun m!262913 () Bool)

(assert (=> bs!14241 m!262913))

(declare-fun m!262915 () Bool)

(assert (=> bs!14241 m!262915))

(assert (=> b!165343 d!57325))

(declare-fun d!57327 () Bool)

(declare-fun res!137788 () Bool)

(declare-fun e!114497 () Bool)

(assert (=> d!57327 (=> res!137788 e!114497)))

(assert (=> d!57327 (= res!137788 (= #b00000000000000000000000000000000 (currentByte!7885 thiss!1577)))))

(assert (=> d!57327 (= (arrayRangesEq!637 (buf!4209 thiss!1577) lt!258611 #b00000000000000000000000000000000 (currentByte!7885 thiss!1577)) e!114497)))

(declare-fun b!165434 () Bool)

(declare-fun e!114498 () Bool)

(assert (=> b!165434 (= e!114497 e!114498)))

(declare-fun res!137789 () Bool)

(assert (=> b!165434 (=> (not res!137789) (not e!114498))))

(assert (=> b!165434 (= res!137789 (= (select (arr!4678 (buf!4209 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4678 lt!258611) #b00000000000000000000000000000000)))))

(declare-fun b!165435 () Bool)

(assert (=> b!165435 (= e!114498 (arrayRangesEq!637 (buf!4209 thiss!1577) lt!258611 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7885 thiss!1577)))))

(assert (= (and d!57327 (not res!137788)) b!165434))

(assert (= (and b!165434 res!137789) b!165435))

(declare-fun m!262917 () Bool)

(assert (=> b!165434 m!262917))

(declare-fun m!262919 () Bool)

(assert (=> b!165434 m!262919))

(declare-fun m!262921 () Bool)

(assert (=> b!165435 m!262921))

(assert (=> b!165343 d!57327))

(declare-fun d!57329 () Bool)

(declare-fun e!114501 () Bool)

(assert (=> d!57329 e!114501))

(declare-fun res!137792 () Bool)

(assert (=> d!57329 (=> (not res!137792) (not e!114501))))

(assert (=> d!57329 (= res!137792 (and (bvsge (currentByte!7885 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7885 thiss!1577) (size!3757 (buf!4209 thiss!1577)))))))

(declare-fun lt!258747 () Unit!11486)

(declare-fun choose!221 (array!8415 (_ BitVec 32) (_ BitVec 8)) Unit!11486)

(assert (=> d!57329 (= lt!258747 (choose!221 (buf!4209 thiss!1577) (currentByte!7885 thiss!1577) lt!258612))))

(assert (=> d!57329 (and (bvsle #b00000000000000000000000000000000 (currentByte!7885 thiss!1577)) (bvslt (currentByte!7885 thiss!1577) (size!3757 (buf!4209 thiss!1577))))))

(assert (=> d!57329 (= (arrayUpdatedAtPrefixLemma!245 (buf!4209 thiss!1577) (currentByte!7885 thiss!1577) lt!258612) lt!258747)))

(declare-fun b!165438 () Bool)

(assert (=> b!165438 (= e!114501 (arrayRangesEq!637 (buf!4209 thiss!1577) (array!8416 (store (arr!4678 (buf!4209 thiss!1577)) (currentByte!7885 thiss!1577) lt!258612) (size!3757 (buf!4209 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7885 thiss!1577)))))

(assert (= (and d!57329 res!137792) b!165438))

(declare-fun m!262923 () Bool)

(assert (=> d!57329 m!262923))

(assert (=> b!165438 m!262805))

(declare-fun m!262925 () Bool)

(assert (=> b!165438 m!262925))

(assert (=> b!165343 d!57329))

(push 1)

(assert (not b!165438))

(assert (not d!57319))

(assert (not b!165435))

(assert (not d!57313))

(assert (not b!165416))

(assert (not d!57289))

(assert (not d!57323))

(assert (not d!57329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

