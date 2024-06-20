; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36418 () Bool)

(assert start!36418)

(declare-datatypes ((array!8688 0))(
  ( (array!8689 (arr!4779 (Array (_ BitVec 32) (_ BitVec 8))) (size!3858 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6872 0))(
  ( (BitStream!6873 (buf!4310 array!8688) (currentByte!8155 (_ BitVec 32)) (currentBit!8150 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14620 0))(
  ( (tuple2!14621 (_1!7907 BitStream!6872) (_2!7907 BitStream!6872)) )
))
(declare-fun lt!260878 () tuple2!14620)

(declare-fun b!167553 () Bool)

(declare-datatypes ((tuple2!14622 0))(
  ( (tuple2!14623 (_1!7908 BitStream!6872) (_2!7908 (_ BitVec 8))) )
))
(declare-fun lt!260882 () tuple2!14622)

(declare-fun e!116260 () Bool)

(declare-fun lt!260881 () (_ BitVec 8))

(assert (=> b!167553 (= e!116260 (and (= ((_ sign_extend 24) (_2!7908 lt!260882)) ((_ sign_extend 24) lt!260881)) (= (_1!7908 lt!260882) (_2!7907 lt!260878))))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun readPartialBytePure!0 (BitStream!6872 (_ BitVec 32)) tuple2!14622)

(assert (=> b!167553 (= lt!260882 (readPartialBytePure!0 (_1!7907 lt!260878) nBits!511))))

(declare-fun thiss!1577 () BitStream!6872)

(declare-fun lt!260871 () BitStream!6872)

(declare-fun reader!0 (BitStream!6872 BitStream!6872) tuple2!14620)

(assert (=> b!167553 (= lt!260878 (reader!0 thiss!1577 lt!260871))))

(declare-fun b!167554 () Bool)

(declare-fun e!116263 () Bool)

(declare-fun e!116262 () Bool)

(assert (=> b!167554 (= e!116263 e!116262)))

(declare-fun res!139509 () Bool)

(assert (=> b!167554 (=> (not res!139509) (not e!116262))))

(assert (=> b!167554 (= res!139509 (bvsgt (bvadd (currentBit!8150 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167554 (= lt!260881 ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))))))

(declare-fun b!167555 () Bool)

(declare-fun e!116261 () Bool)

(declare-fun array_inv!3599 (array!8688) Bool)

(assert (=> b!167555 (= e!116261 (array_inv!3599 (buf!4310 thiss!1577)))))

(declare-fun res!139511 () Bool)

(assert (=> start!36418 (=> (not res!139511) (not e!116263))))

(assert (=> start!36418 (= res!139511 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36418 e!116263))

(assert (=> start!36418 true))

(declare-fun inv!12 (BitStream!6872) Bool)

(assert (=> start!36418 (and (inv!12 thiss!1577) e!116261)))

(declare-fun b!167556 () Bool)

(declare-fun e!116264 () Bool)

(assert (=> b!167556 (= e!116262 (not e!116264))))

(declare-fun res!139506 () Bool)

(assert (=> b!167556 (=> res!139506 e!116264)))

(declare-fun lt!260875 () (_ BitVec 8))

(declare-fun lt!260880 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167556 (= res!139506 (not (byteRangesEq!0 (select (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577)) lt!260875 #b00000000000000000000000000000000 lt!260880)))))

(declare-fun lt!260877 () array!8688)

(declare-fun arrayRangesEq!687 (array!8688 array!8688 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167556 (arrayRangesEq!687 (buf!4310 thiss!1577) lt!260877 #b00000000000000000000000000000000 (currentByte!8155 thiss!1577))))

(declare-fun lt!260872 () array!8688)

(declare-datatypes ((Unit!11664 0))(
  ( (Unit!11665) )
))
(declare-fun lt!260876 () Unit!11664)

(declare-fun arrayRangesEqTransitive!189 (array!8688 array!8688 array!8688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11664)

(assert (=> b!167556 (= lt!260876 (arrayRangesEqTransitive!189 (buf!4310 thiss!1577) lt!260872 lt!260877 #b00000000000000000000000000000000 (currentByte!8155 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (=> b!167556 (arrayRangesEq!687 lt!260872 lt!260877 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)))))

(declare-fun lt!260873 () (_ BitVec 8))

(declare-fun lt!260884 () Unit!11664)

(declare-fun arrayUpdatedAtPrefixLemma!295 (array!8688 (_ BitVec 32) (_ BitVec 8)) Unit!11664)

(assert (=> b!167556 (= lt!260884 (arrayUpdatedAtPrefixLemma!295 lt!260872 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873))))

(assert (=> b!167556 (arrayRangesEq!687 (buf!4310 thiss!1577) (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8155 thiss!1577))))

(declare-fun lt!260874 () Unit!11664)

(assert (=> b!167556 (= lt!260874 (arrayUpdatedAtPrefixLemma!295 (buf!4310 thiss!1577) (currentByte!8155 thiss!1577) lt!260875))))

(declare-fun lt!260883 () (_ BitVec 32))

(assert (=> b!167556 (= lt!260875 (select (store (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8150 thiss!1577)))))))) (bvlshr (bvand lt!260883 #b00000000000000000000000011111111) lt!260880)))) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (currentByte!8155 thiss!1577)))))

(assert (=> b!167556 (= lt!260877 (array!8689 (store (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8150 thiss!1577)))))))) (bvlshr (bvand lt!260883 #b00000000000000000000000011111111) lt!260880)))) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (size!3858 (buf!4310 thiss!1577))))))

(declare-fun lt!260879 () (_ BitVec 32))

(assert (=> b!167556 (= lt!260873 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8150 thiss!1577)))))))) (bvlshr (bvand lt!260883 #b00000000000000000000000011111111) lt!260880)))) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260879))) (bvshl lt!260883 lt!260879))))))

(assert (=> b!167556 (= lt!260879 (bvsub #b00000000000000000000000000001000 lt!260880))))

(assert (=> b!167556 (= lt!260872 (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8150 thiss!1577)))))))) (bvlshr (bvand lt!260883 #b00000000000000000000000011111111) lt!260880)))) (size!3858 (buf!4310 thiss!1577))))))

(assert (=> b!167556 (= lt!260883 ((_ sign_extend 24) lt!260881))))

(assert (=> b!167556 (= lt!260880 (bvsub (bvadd (currentBit!8150 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167557 () Bool)

(declare-fun res!139507 () Bool)

(assert (=> b!167557 (=> (not res!139507) (not e!116260))))

(declare-fun isPrefixOf!0 (BitStream!6872 BitStream!6872) Bool)

(assert (=> b!167557 (= res!139507 (isPrefixOf!0 thiss!1577 lt!260871))))

(declare-fun b!167558 () Bool)

(declare-fun res!139510 () Bool)

(assert (=> b!167558 (=> (not res!139510) (not e!116263))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167558 (= res!139510 (validate_offset_bits!1 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))) ((_ sign_extend 32) (currentByte!8155 thiss!1577)) ((_ sign_extend 32) (currentBit!8150 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167559 () Bool)

(assert (=> b!167559 (= e!116264 e!116260)))

(declare-fun res!139508 () Bool)

(assert (=> b!167559 (=> (not res!139508) (not e!116260))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!167559 (= res!139508 (= (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260880) (bvadd (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)) ((_ sign_extend 32) nBits!511))))))

(assert (=> b!167559 (= lt!260871 (BitStream!6873 lt!260877 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260880))))

(assert (= (and start!36418 res!139511) b!167558))

(assert (= (and b!167558 res!139510) b!167554))

(assert (= (and b!167554 res!139509) b!167556))

(assert (= (and b!167556 (not res!139506)) b!167559))

(assert (= (and b!167559 res!139508) b!167557))

(assert (= (and b!167557 res!139507) b!167553))

(assert (= start!36418 b!167555))

(declare-fun m!266727 () Bool)

(assert (=> b!167554 m!266727))

(declare-fun m!266729 () Bool)

(assert (=> b!167553 m!266729))

(declare-fun m!266731 () Bool)

(assert (=> b!167553 m!266731))

(declare-fun m!266733 () Bool)

(assert (=> b!167559 m!266733))

(declare-fun m!266735 () Bool)

(assert (=> b!167559 m!266735))

(declare-fun m!266737 () Bool)

(assert (=> b!167556 m!266737))

(declare-fun m!266739 () Bool)

(assert (=> b!167556 m!266739))

(declare-fun m!266741 () Bool)

(assert (=> b!167556 m!266741))

(declare-fun m!266743 () Bool)

(assert (=> b!167556 m!266743))

(declare-fun m!266745 () Bool)

(assert (=> b!167556 m!266745))

(declare-fun m!266747 () Bool)

(assert (=> b!167556 m!266747))

(declare-fun m!266749 () Bool)

(assert (=> b!167556 m!266749))

(declare-fun m!266751 () Bool)

(assert (=> b!167556 m!266751))

(declare-fun m!266753 () Bool)

(assert (=> b!167556 m!266753))

(declare-fun m!266755 () Bool)

(assert (=> b!167556 m!266755))

(declare-fun m!266757 () Bool)

(assert (=> b!167556 m!266757))

(declare-fun m!266759 () Bool)

(assert (=> b!167556 m!266759))

(declare-fun m!266761 () Bool)

(assert (=> b!167556 m!266761))

(assert (=> b!167556 m!266741))

(declare-fun m!266763 () Bool)

(assert (=> b!167556 m!266763))

(declare-fun m!266765 () Bool)

(assert (=> b!167556 m!266765))

(declare-fun m!266767 () Bool)

(assert (=> start!36418 m!266767))

(declare-fun m!266769 () Bool)

(assert (=> b!167555 m!266769))

(declare-fun m!266771 () Bool)

(assert (=> b!167557 m!266771))

(declare-fun m!266773 () Bool)

(assert (=> b!167558 m!266773))

(push 1)

(assert (not b!167556))

(assert (not b!167559))

(assert (not b!167557))

(assert (not start!36418))

(assert (not b!167553))

(assert (not b!167555))

(assert (not b!167558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58743 () Bool)

(declare-fun e!116306 () Bool)

(assert (=> d!58743 e!116306))

(declare-fun res!139559 () Bool)

(assert (=> d!58743 (=> (not res!139559) (not e!116306))))

(assert (=> d!58743 (= res!139559 (and (bvsge (currentByte!8155 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8155 thiss!1577) (size!3858 (buf!4310 thiss!1577)))))))

(declare-fun lt!260931 () Unit!11664)

(declare-fun choose!259 (array!8688 (_ BitVec 32) (_ BitVec 8)) Unit!11664)

(assert (=> d!58743 (= lt!260931 (choose!259 (buf!4310 thiss!1577) (currentByte!8155 thiss!1577) lt!260875))))

(assert (=> d!58743 (and (bvsle #b00000000000000000000000000000000 (currentByte!8155 thiss!1577)) (bvslt (currentByte!8155 thiss!1577) (size!3858 (buf!4310 thiss!1577))))))

(assert (=> d!58743 (= (arrayUpdatedAtPrefixLemma!295 (buf!4310 thiss!1577) (currentByte!8155 thiss!1577) lt!260875) lt!260931)))

(declare-fun b!167607 () Bool)

(assert (=> b!167607 (= e!116306 (arrayRangesEq!687 (buf!4310 thiss!1577) (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8155 thiss!1577)))))

(assert (= (and d!58743 res!139559) b!167607))

(declare-fun m!266847 () Bool)

(assert (=> d!58743 m!266847))

(assert (=> b!167607 m!266743))

(assert (=> b!167607 m!266751))

(assert (=> b!167556 d!58743))

(declare-fun d!58747 () Bool)

(assert (=> d!58747 (= (byteRangesEq!0 (select (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577)) lt!260875 #b00000000000000000000000000000000 lt!260880) (or (= #b00000000000000000000000000000000 lt!260880) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260880))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!260875) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260880))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14582 () Bool)

(assert (= bs!14582 d!58747))

(declare-fun m!266849 () Bool)

(assert (=> bs!14582 m!266849))

(declare-fun m!266851 () Bool)

(assert (=> bs!14582 m!266851))

(assert (=> b!167556 d!58747))

(declare-fun d!58749 () Bool)

(declare-fun res!139564 () Bool)

(declare-fun e!116311 () Bool)

(assert (=> d!58749 (=> res!139564 e!116311)))

(assert (=> d!58749 (= res!139564 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (=> d!58749 (= (arrayRangesEq!687 lt!260872 lt!260877 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) e!116311)))

(declare-fun b!167612 () Bool)

(declare-fun e!116312 () Bool)

(assert (=> b!167612 (= e!116311 e!116312)))

(declare-fun res!139565 () Bool)

(assert (=> b!167612 (=> (not res!139565) (not e!116312))))

(assert (=> b!167612 (= res!139565 (= (select (arr!4779 lt!260872) #b00000000000000000000000000000000) (select (arr!4779 lt!260877) #b00000000000000000000000000000000)))))

(declare-fun b!167613 () Bool)

(assert (=> b!167613 (= e!116312 (arrayRangesEq!687 lt!260872 lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (= (and d!58749 (not res!139564)) b!167612))

(assert (= (and b!167612 res!139565) b!167613))

(declare-fun m!266853 () Bool)

(assert (=> b!167612 m!266853))

(declare-fun m!266855 () Bool)

(assert (=> b!167612 m!266855))

(declare-fun m!266857 () Bool)

(assert (=> b!167613 m!266857))

(assert (=> b!167556 d!58749))

(declare-fun d!58751 () Bool)

(declare-fun e!116313 () Bool)

(assert (=> d!58751 e!116313))

(declare-fun res!139566 () Bool)

(assert (=> d!58751 (=> (not res!139566) (not e!116313))))

(assert (=> d!58751 (= res!139566 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) (size!3858 lt!260872))))))

(declare-fun lt!260932 () Unit!11664)

(assert (=> d!58751 (= lt!260932 (choose!259 lt!260872 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873))))

(assert (=> d!58751 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) (size!3858 lt!260872)))))

(assert (=> d!58751 (= (arrayUpdatedAtPrefixLemma!295 lt!260872 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) lt!260932)))

(declare-fun b!167614 () Bool)

(assert (=> b!167614 (= e!116313 (arrayRangesEq!687 lt!260872 (array!8689 (store (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (size!3858 lt!260872)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (= (and d!58751 res!139566) b!167614))

(declare-fun m!266859 () Bool)

(assert (=> d!58751 m!266859))

(declare-fun m!266861 () Bool)

(assert (=> b!167614 m!266861))

(declare-fun m!266863 () Bool)

(assert (=> b!167614 m!266863))

(assert (=> b!167556 d!58751))

(declare-fun d!58753 () Bool)

(declare-fun res!139567 () Bool)

(declare-fun e!116314 () Bool)

(assert (=> d!58753 (=> res!139567 e!116314)))

(assert (=> d!58753 (= res!139567 (= #b00000000000000000000000000000000 (currentByte!8155 thiss!1577)))))

(assert (=> d!58753 (= (arrayRangesEq!687 (buf!4310 thiss!1577) lt!260877 #b00000000000000000000000000000000 (currentByte!8155 thiss!1577)) e!116314)))

(declare-fun b!167615 () Bool)

(declare-fun e!116315 () Bool)

(assert (=> b!167615 (= e!116314 e!116315)))

(declare-fun res!139568 () Bool)

(assert (=> b!167615 (=> (not res!139568) (not e!116315))))

(assert (=> b!167615 (= res!139568 (= (select (arr!4779 (buf!4310 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4779 lt!260877) #b00000000000000000000000000000000)))))

(declare-fun b!167616 () Bool)

(assert (=> b!167616 (= e!116315 (arrayRangesEq!687 (buf!4310 thiss!1577) lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (= (and d!58753 (not res!139567)) b!167615))

(assert (= (and b!167615 res!139568) b!167616))

(declare-fun m!266865 () Bool)

(assert (=> b!167615 m!266865))

(assert (=> b!167615 m!266855))

(declare-fun m!266867 () Bool)

(assert (=> b!167616 m!266867))

(assert (=> b!167556 d!58753))

(declare-fun d!58755 () Bool)

(declare-fun res!139569 () Bool)

(declare-fun e!116316 () Bool)

(assert (=> d!58755 (=> res!139569 e!116316)))

(assert (=> d!58755 (= res!139569 (= #b00000000000000000000000000000000 (currentByte!8155 thiss!1577)))))

(assert (=> d!58755 (= (arrayRangesEq!687 (buf!4310 thiss!1577) (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8155 thiss!1577)) e!116316)))

(declare-fun b!167617 () Bool)

(declare-fun e!116317 () Bool)

(assert (=> b!167617 (= e!116316 e!116317)))

(declare-fun res!139570 () Bool)

(assert (=> b!167617 (=> (not res!139570) (not e!116317))))

(assert (=> b!167617 (= res!139570 (= (select (arr!4779 (buf!4310 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4779 (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167618 () Bool)

(assert (=> b!167618 (= e!116317 (arrayRangesEq!687 (buf!4310 thiss!1577) (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (= (and d!58755 (not res!139569)) b!167617))

(assert (= (and b!167617 res!139570) b!167618))

(assert (=> b!167617 m!266865))

(declare-fun m!266869 () Bool)

(assert (=> b!167617 m!266869))

(declare-fun m!266871 () Bool)

(assert (=> b!167618 m!266871))

(assert (=> b!167556 d!58755))

(declare-fun d!58757 () Bool)

(assert (=> d!58757 (arrayRangesEq!687 (buf!4310 thiss!1577) lt!260877 #b00000000000000000000000000000000 (currentByte!8155 thiss!1577))))

(declare-fun lt!260935 () Unit!11664)

(declare-fun choose!260 (array!8688 array!8688 array!8688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11664)

(assert (=> d!58757 (= lt!260935 (choose!260 (buf!4310 thiss!1577) lt!260872 lt!260877 #b00000000000000000000000000000000 (currentByte!8155 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (=> d!58757 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8155 thiss!1577)) (bvsle (currentByte!8155 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (=> d!58757 (= (arrayRangesEqTransitive!189 (buf!4310 thiss!1577) lt!260872 lt!260877 #b00000000000000000000000000000000 (currentByte!8155 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) lt!260935)))

(declare-fun bs!14583 () Bool)

(assert (= bs!14583 d!58757))

(assert (=> bs!14583 m!266745))

(declare-fun m!266873 () Bool)

(assert (=> bs!14583 m!266873))

(assert (=> b!167556 d!58757))

(declare-fun d!58759 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58759 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8150 thiss!1577) (currentByte!8155 thiss!1577) (size!3858 (buf!4310 thiss!1577))))))

(declare-fun bs!14584 () Bool)

(assert (= bs!14584 d!58759))

(declare-fun m!266875 () Bool)

(assert (=> bs!14584 m!266875))

(assert (=> start!36418 d!58759))

(declare-fun d!58761 () Bool)

(declare-fun res!139577 () Bool)

(declare-fun e!116322 () Bool)

(assert (=> d!58761 (=> (not res!139577) (not e!116322))))

(assert (=> d!58761 (= res!139577 (= (size!3858 (buf!4310 thiss!1577)) (size!3858 (buf!4310 lt!260871))))))

(assert (=> d!58761 (= (isPrefixOf!0 thiss!1577 lt!260871) e!116322)))

(declare-fun b!167625 () Bool)

(declare-fun res!139578 () Bool)

(assert (=> b!167625 (=> (not res!139578) (not e!116322))))

(assert (=> b!167625 (= res!139578 (bvsle (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)) (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871))))))

(declare-fun b!167626 () Bool)

(declare-fun e!116323 () Bool)

(assert (=> b!167626 (= e!116322 e!116323)))

(declare-fun res!139579 () Bool)

(assert (=> b!167626 (=> res!139579 e!116323)))

(assert (=> b!167626 (= res!139579 (= (size!3858 (buf!4310 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!167627 () Bool)

(declare-fun arrayBitRangesEq!0 (array!8688 array!8688 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167627 (= e!116323 (arrayBitRangesEq!0 (buf!4310 thiss!1577) (buf!4310 lt!260871) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))))))

(assert (= (and d!58761 res!139577) b!167625))

(assert (= (and b!167625 res!139578) b!167626))

(assert (= (and b!167626 (not res!139579)) b!167627))

(assert (=> b!167625 m!266735))

(declare-fun m!266877 () Bool)

(assert (=> b!167625 m!266877))

(assert (=> b!167627 m!266735))

(assert (=> b!167627 m!266735))

(declare-fun m!266879 () Bool)

(assert (=> b!167627 m!266879))

(assert (=> b!167557 d!58761))

(declare-fun d!58763 () Bool)

(assert (=> d!58763 (= (array_inv!3599 (buf!4310 thiss!1577)) (bvsge (size!3858 (buf!4310 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167555 d!58763))

(declare-fun d!58765 () Bool)

(declare-fun e!116334 () Bool)

(assert (=> d!58765 e!116334))

(declare-fun res!139597 () Bool)

(assert (=> d!58765 (=> (not res!139597) (not e!116334))))

(declare-fun lt!261031 () (_ BitVec 64))

(declare-fun lt!261029 () (_ BitVec 64))

(declare-fun lt!261033 () (_ BitVec 64))

(assert (=> d!58765 (= res!139597 (= lt!261029 (bvsub lt!261031 lt!261033)))))

(assert (=> d!58765 (or (= (bvand lt!261031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261031 lt!261033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58765 (= lt!261033 (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) ((_ sign_extend 32) lt!260880)))))

(declare-fun lt!261030 () (_ BitVec 64))

(declare-fun lt!261028 () (_ BitVec 64))

(assert (=> d!58765 (= lt!261031 (bvmul lt!261030 lt!261028))))

(assert (=> d!58765 (or (= lt!261030 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261028 (bvsdiv (bvmul lt!261030 lt!261028) lt!261030)))))

(assert (=> d!58765 (= lt!261028 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58765 (= lt!261030 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))))))

(assert (=> d!58765 (= lt!261029 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!260880)))))

(assert (=> d!58765 (invariant!0 lt!260880 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) (size!3858 (buf!4310 thiss!1577)))))

(assert (=> d!58765 (= (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260880) lt!261029)))

(declare-fun b!167652 () Bool)

(declare-fun res!139596 () Bool)

(assert (=> b!167652 (=> (not res!139596) (not e!116334))))

(assert (=> b!167652 (= res!139596 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261029))))

(declare-fun b!167653 () Bool)

(declare-fun lt!261032 () (_ BitVec 64))

(assert (=> b!167653 (= e!116334 (bvsle lt!261029 (bvmul lt!261032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167653 (or (= lt!261032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261032)))))

(assert (=> b!167653 (= lt!261032 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))))))

(assert (= (and d!58765 res!139597) b!167652))

(assert (= (and b!167652 res!139596) b!167653))

(declare-fun m!266881 () Bool)

(assert (=> d!58765 m!266881))

(declare-fun m!266883 () Bool)

(assert (=> d!58765 m!266883))

(assert (=> b!167559 d!58765))

(declare-fun d!58767 () Bool)

(declare-fun e!116337 () Bool)

(assert (=> d!58767 e!116337))

(declare-fun res!139602 () Bool)

(assert (=> d!58767 (=> (not res!139602) (not e!116337))))

(declare-fun lt!261057 () (_ BitVec 64))

(declare-fun lt!261055 () (_ BitVec 64))

(declare-fun lt!261059 () (_ BitVec 64))

(assert (=> d!58767 (= res!139602 (= lt!261055 (bvsub lt!261057 lt!261059)))))

(assert (=> d!58767 (or (= (bvand lt!261057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261059 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261057 lt!261059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58767 (= lt!261059 (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))) ((_ sign_extend 32) (currentByte!8155 thiss!1577)) ((_ sign_extend 32) (currentBit!8150 thiss!1577))))))

(declare-fun lt!261056 () (_ BitVec 64))

(declare-fun lt!261054 () (_ BitVec 64))

(assert (=> d!58767 (= lt!261057 (bvmul lt!261056 lt!261054))))

(assert (=> d!58767 (or (= lt!261056 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261054 (bvsdiv (bvmul lt!261056 lt!261054) lt!261056)))))

(assert (=> d!58767 (= lt!261054 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58767 (= lt!261056 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))))))

(assert (=> d!58767 (= lt!261055 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 thiss!1577))))))

(assert (=> d!58767 (invariant!0 (currentBit!8150 thiss!1577) (currentByte!8155 thiss!1577) (size!3858 (buf!4310 thiss!1577)))))

(assert (=> d!58767 (= (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)) lt!261055)))

(declare-fun b!167659 () Bool)

(declare-fun res!139601 () Bool)

(assert (=> b!167659 (=> (not res!139601) (not e!116337))))

(assert (=> b!167659 (= res!139601 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261055))))

(declare-fun b!167660 () Bool)

(declare-fun lt!261058 () (_ BitVec 64))

(assert (=> b!167660 (= e!116337 (bvsle lt!261055 (bvmul lt!261058 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167660 (or (= lt!261058 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261058 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261058)))))

(assert (=> b!167660 (= lt!261058 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))))))

(assert (= (and d!58767 res!139602) b!167659))

(assert (= (and b!167659 res!139601) b!167660))

(declare-fun m!266885 () Bool)

(assert (=> d!58767 m!266885))

(assert (=> d!58767 m!266875))

(assert (=> b!167559 d!58767))

(declare-fun d!58769 () Bool)

(assert (=> d!58769 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))) ((_ sign_extend 32) (currentByte!8155 thiss!1577)) ((_ sign_extend 32) (currentBit!8150 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))) ((_ sign_extend 32) (currentByte!8155 thiss!1577)) ((_ sign_extend 32) (currentBit!8150 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14585 () Bool)

(assert (= bs!14585 d!58769))

(assert (=> bs!14585 m!266885))

(assert (=> b!167558 d!58769))

(declare-fun d!58773 () Bool)

(declare-datatypes ((tuple2!14628 0))(
  ( (tuple2!14629 (_1!7911 (_ BitVec 8)) (_2!7911 BitStream!6872)) )
))
(declare-fun lt!261082 () tuple2!14628)

(declare-fun readPartialByte!0 (BitStream!6872 (_ BitVec 32)) tuple2!14628)

(assert (=> d!58773 (= lt!261082 (readPartialByte!0 (_1!7907 lt!260878) nBits!511))))

(assert (=> d!58773 (= (readPartialBytePure!0 (_1!7907 lt!260878) nBits!511) (tuple2!14623 (_2!7911 lt!261082) (_1!7911 lt!261082)))))

(declare-fun bs!14587 () Bool)

(assert (= bs!14587 d!58773))

(declare-fun m!266951 () Bool)

(assert (=> bs!14587 m!266951))

(assert (=> b!167553 d!58773))

(declare-fun b!167693 () Bool)

(declare-fun e!116355 () Unit!11664)

(declare-fun lt!261152 () Unit!11664)

(assert (=> b!167693 (= e!116355 lt!261152)))

(declare-fun lt!261160 () (_ BitVec 64))

(assert (=> b!167693 (= lt!261160 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!261156 () (_ BitVec 64))

(assert (=> b!167693 (= lt!261156 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8688 array!8688 (_ BitVec 64) (_ BitVec 64)) Unit!11664)

(assert (=> b!167693 (= lt!261152 (arrayBitRangesEqSymmetric!0 (buf!4310 thiss!1577) (buf!4310 lt!260871) lt!261160 lt!261156))))

(assert (=> b!167693 (arrayBitRangesEq!0 (buf!4310 lt!260871) (buf!4310 thiss!1577) lt!261160 lt!261156)))

(declare-fun b!167694 () Bool)

(declare-fun res!139631 () Bool)

(declare-fun e!116354 () Bool)

(assert (=> b!167694 (=> (not res!139631) (not e!116354))))

(declare-fun lt!261150 () tuple2!14620)

(assert (=> b!167694 (= res!139631 (isPrefixOf!0 (_2!7907 lt!261150) lt!260871))))

(declare-fun d!58779 () Bool)

(assert (=> d!58779 e!116354))

(declare-fun res!139630 () Bool)

(assert (=> d!58779 (=> (not res!139630) (not e!116354))))

(assert (=> d!58779 (= res!139630 (isPrefixOf!0 (_1!7907 lt!261150) (_2!7907 lt!261150)))))

(declare-fun lt!261162 () BitStream!6872)

(assert (=> d!58779 (= lt!261150 (tuple2!14621 lt!261162 lt!260871))))

(declare-fun lt!261154 () Unit!11664)

(declare-fun lt!261147 () Unit!11664)

(assert (=> d!58779 (= lt!261154 lt!261147)))

(assert (=> d!58779 (isPrefixOf!0 lt!261162 lt!260871)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6872 BitStream!6872 BitStream!6872) Unit!11664)

(assert (=> d!58779 (= lt!261147 (lemmaIsPrefixTransitive!0 lt!261162 lt!260871 lt!260871))))

(declare-fun lt!261163 () Unit!11664)

(declare-fun lt!261149 () Unit!11664)

(assert (=> d!58779 (= lt!261163 lt!261149)))

(assert (=> d!58779 (isPrefixOf!0 lt!261162 lt!260871)))

(assert (=> d!58779 (= lt!261149 (lemmaIsPrefixTransitive!0 lt!261162 thiss!1577 lt!260871))))

(declare-fun lt!261148 () Unit!11664)

(assert (=> d!58779 (= lt!261148 e!116355)))

(declare-fun c!8645 () Bool)

(assert (=> d!58779 (= c!8645 (not (= (size!3858 (buf!4310 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!261157 () Unit!11664)

(declare-fun lt!261153 () Unit!11664)

(assert (=> d!58779 (= lt!261157 lt!261153)))

(assert (=> d!58779 (isPrefixOf!0 lt!260871 lt!260871)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6872) Unit!11664)

(assert (=> d!58779 (= lt!261153 (lemmaIsPrefixRefl!0 lt!260871))))

(declare-fun lt!261164 () Unit!11664)

(declare-fun lt!261166 () Unit!11664)

(assert (=> d!58779 (= lt!261164 lt!261166)))

(assert (=> d!58779 (= lt!261166 (lemmaIsPrefixRefl!0 lt!260871))))

(declare-fun lt!261158 () Unit!11664)

(declare-fun lt!261159 () Unit!11664)

(assert (=> d!58779 (= lt!261158 lt!261159)))

(assert (=> d!58779 (isPrefixOf!0 lt!261162 lt!261162)))

(assert (=> d!58779 (= lt!261159 (lemmaIsPrefixRefl!0 lt!261162))))

(declare-fun lt!261151 () Unit!11664)

(declare-fun lt!261155 () Unit!11664)

(assert (=> d!58779 (= lt!261151 lt!261155)))

(assert (=> d!58779 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!58779 (= lt!261155 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!58779 (= lt!261162 (BitStream!6873 (buf!4310 lt!260871) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)))))

(assert (=> d!58779 (isPrefixOf!0 thiss!1577 lt!260871)))

(assert (=> d!58779 (= (reader!0 thiss!1577 lt!260871) lt!261150)))

(declare-fun b!167695 () Bool)

(declare-fun Unit!11668 () Unit!11664)

(assert (=> b!167695 (= e!116355 Unit!11668)))

(declare-fun b!167696 () Bool)

(declare-fun lt!261165 () (_ BitVec 64))

(declare-fun lt!261161 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6872 (_ BitVec 64)) BitStream!6872)

(assert (=> b!167696 (= e!116354 (= (_1!7907 lt!261150) (withMovedBitIndex!0 (_2!7907 lt!261150) (bvsub lt!261165 lt!261161))))))

(assert (=> b!167696 (or (= (bvand lt!261165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261161 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261165 lt!261161) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!167696 (= lt!261161 (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871)))))

(assert (=> b!167696 (= lt!261165 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)))))

(declare-fun b!167697 () Bool)

(declare-fun res!139629 () Bool)

(assert (=> b!167697 (=> (not res!139629) (not e!116354))))

(assert (=> b!167697 (= res!139629 (isPrefixOf!0 (_1!7907 lt!261150) thiss!1577))))

(assert (= (and d!58779 c!8645) b!167693))

(assert (= (and d!58779 (not c!8645)) b!167695))

(assert (= (and d!58779 res!139630) b!167697))

(assert (= (and b!167697 res!139629) b!167694))

(assert (= (and b!167694 res!139631) b!167696))

(declare-fun m!266961 () Bool)

(assert (=> b!167697 m!266961))

(declare-fun m!266963 () Bool)

(assert (=> d!58779 m!266963))

(declare-fun m!266965 () Bool)

(assert (=> d!58779 m!266965))

(declare-fun m!266967 () Bool)

(assert (=> d!58779 m!266967))

(assert (=> d!58779 m!266771))

(declare-fun m!266969 () Bool)

(assert (=> d!58779 m!266969))

(declare-fun m!266971 () Bool)

(assert (=> d!58779 m!266971))

(declare-fun m!266973 () Bool)

(assert (=> d!58779 m!266973))

(declare-fun m!266975 () Bool)

(assert (=> d!58779 m!266975))

(declare-fun m!266977 () Bool)

(assert (=> d!58779 m!266977))

(declare-fun m!266979 () Bool)

(assert (=> d!58779 m!266979))

(declare-fun m!266981 () Bool)

(assert (=> d!58779 m!266981))

(assert (=> b!167693 m!266735))

(declare-fun m!266983 () Bool)

(assert (=> b!167693 m!266983))

(declare-fun m!266985 () Bool)

(assert (=> b!167693 m!266985))

(declare-fun m!266987 () Bool)

(assert (=> b!167694 m!266987))

(declare-fun m!266989 () Bool)

(assert (=> b!167696 m!266989))

(assert (=> b!167696 m!266877))

(assert (=> b!167696 m!266735))

(assert (=> b!167553 d!58779))

(push 1)

(assert (not b!167627))

(assert (not b!167607))

(assert (not d!58769))

(assert (not d!58779))

(assert (not d!58757))

(assert (not d!58773))

(assert (not d!58767))

(assert (not b!167697))

(assert (not d!58765))

(assert (not b!167616))

(assert (not b!167625))

(assert (not b!167614))

(assert (not b!167696))

(assert (not b!167613))

(assert (not b!167618))

(assert (not d!58759))

(assert (not b!167694))

(assert (not b!167693))

(assert (not d!58751))

(assert (not d!58743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58981 () Bool)

(assert (=> d!58981 (isPrefixOf!0 lt!261162 lt!260871)))

(declare-fun lt!261367 () Unit!11664)

(declare-fun choose!30 (BitStream!6872 BitStream!6872 BitStream!6872) Unit!11664)

(assert (=> d!58981 (= lt!261367 (choose!30 lt!261162 lt!260871 lt!260871))))

(assert (=> d!58981 (isPrefixOf!0 lt!261162 lt!260871)))

(assert (=> d!58981 (= (lemmaIsPrefixTransitive!0 lt!261162 lt!260871 lt!260871) lt!261367)))

(declare-fun bs!14620 () Bool)

(assert (= bs!14620 d!58981))

(assert (=> bs!14620 m!266963))

(declare-fun m!267367 () Bool)

(assert (=> bs!14620 m!267367))

(assert (=> bs!14620 m!266963))

(assert (=> d!58779 d!58981))

(declare-fun d!58983 () Bool)

(declare-fun res!139819 () Bool)

(declare-fun e!116541 () Bool)

(assert (=> d!58983 (=> (not res!139819) (not e!116541))))

(assert (=> d!58983 (= res!139819 (= (size!3858 (buf!4310 lt!260871)) (size!3858 (buf!4310 lt!260871))))))

(assert (=> d!58983 (= (isPrefixOf!0 lt!260871 lt!260871) e!116541)))

(declare-fun b!167928 () Bool)

(declare-fun res!139820 () Bool)

(assert (=> b!167928 (=> (not res!139820) (not e!116541))))

(assert (=> b!167928 (= res!139820 (bvsle (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871)) (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871))))))

(declare-fun b!167929 () Bool)

(declare-fun e!116542 () Bool)

(assert (=> b!167929 (= e!116541 e!116542)))

(declare-fun res!139821 () Bool)

(assert (=> b!167929 (=> res!139821 e!116542)))

(assert (=> b!167929 (= res!139821 (= (size!3858 (buf!4310 lt!260871)) #b00000000000000000000000000000000))))

(declare-fun b!167930 () Bool)

(assert (=> b!167930 (= e!116542 (arrayBitRangesEq!0 (buf!4310 lt!260871) (buf!4310 lt!260871) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871))))))

(assert (= (and d!58983 res!139819) b!167928))

(assert (= (and b!167928 res!139820) b!167929))

(assert (= (and b!167929 (not res!139821)) b!167930))

(assert (=> b!167928 m!266877))

(assert (=> b!167928 m!266877))

(assert (=> b!167930 m!266877))

(assert (=> b!167930 m!266877))

(declare-fun m!267369 () Bool)

(assert (=> b!167930 m!267369))

(assert (=> d!58779 d!58983))

(declare-fun d!58985 () Bool)

(declare-fun res!139822 () Bool)

(declare-fun e!116543 () Bool)

(assert (=> d!58985 (=> (not res!139822) (not e!116543))))

(assert (=> d!58985 (= res!139822 (= (size!3858 (buf!4310 lt!261162)) (size!3858 (buf!4310 lt!260871))))))

(assert (=> d!58985 (= (isPrefixOf!0 lt!261162 lt!260871) e!116543)))

(declare-fun b!167931 () Bool)

(declare-fun res!139823 () Bool)

(assert (=> b!167931 (=> (not res!139823) (not e!116543))))

(assert (=> b!167931 (= res!139823 (bvsle (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162)) (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871))))))

(declare-fun b!167932 () Bool)

(declare-fun e!116544 () Bool)

(assert (=> b!167932 (= e!116543 e!116544)))

(declare-fun res!139824 () Bool)

(assert (=> b!167932 (=> res!139824 e!116544)))

(assert (=> b!167932 (= res!139824 (= (size!3858 (buf!4310 lt!261162)) #b00000000000000000000000000000000))))

(declare-fun b!167933 () Bool)

(assert (=> b!167933 (= e!116544 (arrayBitRangesEq!0 (buf!4310 lt!261162) (buf!4310 lt!260871) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))))))

(assert (= (and d!58985 res!139822) b!167931))

(assert (= (and b!167931 res!139823) b!167932))

(assert (= (and b!167932 (not res!139824)) b!167933))

(declare-fun m!267371 () Bool)

(assert (=> b!167931 m!267371))

(assert (=> b!167931 m!266877))

(assert (=> b!167933 m!267371))

(assert (=> b!167933 m!267371))

(declare-fun m!267373 () Bool)

(assert (=> b!167933 m!267373))

(assert (=> d!58779 d!58985))

(declare-fun d!58987 () Bool)

(assert (=> d!58987 (isPrefixOf!0 lt!260871 lt!260871)))

(declare-fun lt!261370 () Unit!11664)

(declare-fun choose!11 (BitStream!6872) Unit!11664)

(assert (=> d!58987 (= lt!261370 (choose!11 lt!260871))))

(assert (=> d!58987 (= (lemmaIsPrefixRefl!0 lt!260871) lt!261370)))

(declare-fun bs!14622 () Bool)

(assert (= bs!14622 d!58987))

(assert (=> bs!14622 m!266977))

(declare-fun m!267375 () Bool)

(assert (=> bs!14622 m!267375))

(assert (=> d!58779 d!58987))

(declare-fun d!58989 () Bool)

(assert (=> d!58989 (isPrefixOf!0 lt!261162 lt!261162)))

(declare-fun lt!261371 () Unit!11664)

(assert (=> d!58989 (= lt!261371 (choose!11 lt!261162))))

(assert (=> d!58989 (= (lemmaIsPrefixRefl!0 lt!261162) lt!261371)))

(declare-fun bs!14623 () Bool)

(assert (= bs!14623 d!58989))

(assert (=> bs!14623 m!266971))

(declare-fun m!267377 () Bool)

(assert (=> bs!14623 m!267377))

(assert (=> d!58779 d!58989))

(declare-fun d!58991 () Bool)

(declare-fun res!139825 () Bool)

(declare-fun e!116545 () Bool)

(assert (=> d!58991 (=> (not res!139825) (not e!116545))))

(assert (=> d!58991 (= res!139825 (= (size!3858 (buf!4310 thiss!1577)) (size!3858 (buf!4310 thiss!1577))))))

(assert (=> d!58991 (= (isPrefixOf!0 thiss!1577 thiss!1577) e!116545)))

(declare-fun b!167934 () Bool)

(declare-fun res!139826 () Bool)

(assert (=> b!167934 (=> (not res!139826) (not e!116545))))

(assert (=> b!167934 (= res!139826 (bvsle (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)) (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))))))

(declare-fun b!167935 () Bool)

(declare-fun e!116546 () Bool)

(assert (=> b!167935 (= e!116545 e!116546)))

(declare-fun res!139827 () Bool)

(assert (=> b!167935 (=> res!139827 e!116546)))

(assert (=> b!167935 (= res!139827 (= (size!3858 (buf!4310 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!167936 () Bool)

(assert (=> b!167936 (= e!116546 (arrayBitRangesEq!0 (buf!4310 thiss!1577) (buf!4310 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))))))

(assert (= (and d!58991 res!139825) b!167934))

(assert (= (and b!167934 res!139826) b!167935))

(assert (= (and b!167935 (not res!139827)) b!167936))

(assert (=> b!167934 m!266735))

(assert (=> b!167934 m!266735))

(assert (=> b!167936 m!266735))

(assert (=> b!167936 m!266735))

(declare-fun m!267379 () Bool)

(assert (=> b!167936 m!267379))

(assert (=> d!58779 d!58991))

(declare-fun d!58993 () Bool)

(assert (=> d!58993 (isPrefixOf!0 lt!261162 lt!260871)))

(declare-fun lt!261372 () Unit!11664)

(assert (=> d!58993 (= lt!261372 (choose!30 lt!261162 thiss!1577 lt!260871))))

(assert (=> d!58993 (isPrefixOf!0 lt!261162 thiss!1577)))

(assert (=> d!58993 (= (lemmaIsPrefixTransitive!0 lt!261162 thiss!1577 lt!260871) lt!261372)))

(declare-fun bs!14624 () Bool)

(assert (= bs!14624 d!58993))

(assert (=> bs!14624 m!266963))

(declare-fun m!267381 () Bool)

(assert (=> bs!14624 m!267381))

(declare-fun m!267383 () Bool)

(assert (=> bs!14624 m!267383))

(assert (=> d!58779 d!58993))

(declare-fun d!58995 () Bool)

(declare-fun res!139828 () Bool)

(declare-fun e!116547 () Bool)

(assert (=> d!58995 (=> (not res!139828) (not e!116547))))

(assert (=> d!58995 (= res!139828 (= (size!3858 (buf!4310 (_1!7907 lt!261150))) (size!3858 (buf!4310 (_2!7907 lt!261150)))))))

(assert (=> d!58995 (= (isPrefixOf!0 (_1!7907 lt!261150) (_2!7907 lt!261150)) e!116547)))

(declare-fun b!167937 () Bool)

(declare-fun res!139829 () Bool)

(assert (=> b!167937 (=> (not res!139829) (not e!116547))))

(assert (=> b!167937 (= res!139829 (bvsle (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150))) (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150)))))))

(declare-fun b!167938 () Bool)

(declare-fun e!116548 () Bool)

(assert (=> b!167938 (= e!116547 e!116548)))

(declare-fun res!139830 () Bool)

(assert (=> b!167938 (=> res!139830 e!116548)))

(assert (=> b!167938 (= res!139830 (= (size!3858 (buf!4310 (_1!7907 lt!261150))) #b00000000000000000000000000000000))))

(declare-fun b!167939 () Bool)

(assert (=> b!167939 (= e!116548 (arrayBitRangesEq!0 (buf!4310 (_1!7907 lt!261150)) (buf!4310 (_2!7907 lt!261150)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150)))))))

(assert (= (and d!58995 res!139828) b!167937))

(assert (= (and b!167937 res!139829) b!167938))

(assert (= (and b!167938 (not res!139830)) b!167939))

(declare-fun m!267385 () Bool)

(assert (=> b!167937 m!267385))

(declare-fun m!267387 () Bool)

(assert (=> b!167937 m!267387))

(assert (=> b!167939 m!267385))

(assert (=> b!167939 m!267385))

(declare-fun m!267389 () Bool)

(assert (=> b!167939 m!267389))

(assert (=> d!58779 d!58995))

(declare-fun d!58997 () Bool)

(declare-fun res!139831 () Bool)

(declare-fun e!116549 () Bool)

(assert (=> d!58997 (=> (not res!139831) (not e!116549))))

(assert (=> d!58997 (= res!139831 (= (size!3858 (buf!4310 lt!261162)) (size!3858 (buf!4310 lt!261162))))))

(assert (=> d!58997 (= (isPrefixOf!0 lt!261162 lt!261162) e!116549)))

(declare-fun b!167940 () Bool)

(declare-fun res!139832 () Bool)

(assert (=> b!167940 (=> (not res!139832) (not e!116549))))

(assert (=> b!167940 (= res!139832 (bvsle (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162)) (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))))))

(declare-fun b!167941 () Bool)

(declare-fun e!116550 () Bool)

(assert (=> b!167941 (= e!116549 e!116550)))

(declare-fun res!139833 () Bool)

(assert (=> b!167941 (=> res!139833 e!116550)))

(assert (=> b!167941 (= res!139833 (= (size!3858 (buf!4310 lt!261162)) #b00000000000000000000000000000000))))

(declare-fun b!167942 () Bool)

(assert (=> b!167942 (= e!116550 (arrayBitRangesEq!0 (buf!4310 lt!261162) (buf!4310 lt!261162) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))))))

(assert (= (and d!58997 res!139831) b!167940))

(assert (= (and b!167940 res!139832) b!167941))

(assert (= (and b!167941 (not res!139833)) b!167942))

(assert (=> b!167940 m!267371))

(assert (=> b!167940 m!267371))

(assert (=> b!167942 m!267371))

(assert (=> b!167942 m!267371))

(declare-fun m!267391 () Bool)

(assert (=> b!167942 m!267391))

(assert (=> d!58779 d!58997))

(declare-fun d!58999 () Bool)

(assert (=> d!58999 (isPrefixOf!0 thiss!1577 thiss!1577)))

(declare-fun lt!261373 () Unit!11664)

(assert (=> d!58999 (= lt!261373 (choose!11 thiss!1577))))

(assert (=> d!58999 (= (lemmaIsPrefixRefl!0 thiss!1577) lt!261373)))

(declare-fun bs!14625 () Bool)

(assert (= bs!14625 d!58999))

(assert (=> bs!14625 m!266965))

(declare-fun m!267393 () Bool)

(assert (=> bs!14625 m!267393))

(assert (=> d!58779 d!58999))

(assert (=> d!58779 d!58761))

(declare-fun d!59001 () Bool)

(declare-fun e!116553 () Bool)

(assert (=> d!59001 e!116553))

(declare-fun res!139836 () Bool)

(assert (=> d!59001 (=> (not res!139836) (not e!116553))))

(declare-fun lt!261378 () BitStream!6872)

(declare-fun lt!261379 () (_ BitVec 64))

(assert (=> d!59001 (= res!139836 (= (bvadd lt!261379 (bvsub lt!261165 lt!261161)) (bitIndex!0 (size!3858 (buf!4310 lt!261378)) (currentByte!8155 lt!261378) (currentBit!8150 lt!261378))))))

(assert (=> d!59001 (or (not (= (bvand lt!261379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261165 lt!261161) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261379 (bvsub lt!261165 lt!261161)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59001 (= lt!261379 (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150))))))

(declare-datatypes ((tuple2!14634 0))(
  ( (tuple2!14635 (_1!7918 Unit!11664) (_2!7918 BitStream!6872)) )
))
(declare-fun moveBitIndex!0 (BitStream!6872 (_ BitVec 64)) tuple2!14634)

(assert (=> d!59001 (= lt!261378 (_2!7918 (moveBitIndex!0 (_2!7907 lt!261150) (bvsub lt!261165 lt!261161))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6872 (_ BitVec 64)) Bool)

(assert (=> d!59001 (moveBitIndexPrecond!0 (_2!7907 lt!261150) (bvsub lt!261165 lt!261161))))

(assert (=> d!59001 (= (withMovedBitIndex!0 (_2!7907 lt!261150) (bvsub lt!261165 lt!261161)) lt!261378)))

(declare-fun b!167945 () Bool)

(assert (=> b!167945 (= e!116553 (= (size!3858 (buf!4310 (_2!7907 lt!261150))) (size!3858 (buf!4310 lt!261378))))))

(assert (= (and d!59001 res!139836) b!167945))

(declare-fun m!267395 () Bool)

(assert (=> d!59001 m!267395))

(assert (=> d!59001 m!267387))

(declare-fun m!267397 () Bool)

(assert (=> d!59001 m!267397))

(declare-fun m!267399 () Bool)

(assert (=> d!59001 m!267399))

(assert (=> b!167696 d!59001))

(declare-fun d!59003 () Bool)

(declare-fun e!116554 () Bool)

(assert (=> d!59003 e!116554))

(declare-fun res!139838 () Bool)

(assert (=> d!59003 (=> (not res!139838) (not e!116554))))

(declare-fun lt!261381 () (_ BitVec 64))

(declare-fun lt!261383 () (_ BitVec 64))

(declare-fun lt!261385 () (_ BitVec 64))

(assert (=> d!59003 (= res!139838 (= lt!261381 (bvsub lt!261383 lt!261385)))))

(assert (=> d!59003 (or (= (bvand lt!261383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261383 lt!261385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59003 (= lt!261385 (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 lt!260871))) ((_ sign_extend 32) (currentByte!8155 lt!260871)) ((_ sign_extend 32) (currentBit!8150 lt!260871))))))

(declare-fun lt!261382 () (_ BitVec 64))

(declare-fun lt!261380 () (_ BitVec 64))

(assert (=> d!59003 (= lt!261383 (bvmul lt!261382 lt!261380))))

(assert (=> d!59003 (or (= lt!261382 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261380 (bvsdiv (bvmul lt!261382 lt!261380) lt!261382)))))

(assert (=> d!59003 (= lt!261380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59003 (= lt!261382 ((_ sign_extend 32) (size!3858 (buf!4310 lt!260871))))))

(assert (=> d!59003 (= lt!261381 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 lt!260871)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 lt!260871))))))

(assert (=> d!59003 (invariant!0 (currentBit!8150 lt!260871) (currentByte!8155 lt!260871) (size!3858 (buf!4310 lt!260871)))))

(assert (=> d!59003 (= (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871)) lt!261381)))

(declare-fun b!167946 () Bool)

(declare-fun res!139837 () Bool)

(assert (=> b!167946 (=> (not res!139837) (not e!116554))))

(assert (=> b!167946 (= res!139837 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261381))))

(declare-fun b!167947 () Bool)

(declare-fun lt!261384 () (_ BitVec 64))

(assert (=> b!167947 (= e!116554 (bvsle lt!261381 (bvmul lt!261384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167947 (or (= lt!261384 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261384 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261384)))))

(assert (=> b!167947 (= lt!261384 ((_ sign_extend 32) (size!3858 (buf!4310 lt!260871))))))

(assert (= (and d!59003 res!139838) b!167946))

(assert (= (and b!167946 res!139837) b!167947))

(declare-fun m!267401 () Bool)

(assert (=> d!59003 m!267401))

(declare-fun m!267403 () Bool)

(assert (=> d!59003 m!267403))

(assert (=> b!167696 d!59003))

(assert (=> b!167696 d!58767))

(declare-fun d!59005 () Bool)

(assert (=> d!59005 (= (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))) ((_ sign_extend 32) (currentByte!8155 thiss!1577)) ((_ sign_extend 32) (currentBit!8150 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 thiss!1577)))))))

(assert (=> d!58769 d!59005))

(declare-fun d!59007 () Bool)

(assert (=> d!59007 (= (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) ((_ sign_extend 32) lt!260880)) (bvsub (bvmul ((_ sign_extend 32) (size!3858 (buf!4310 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!260880))))))

(assert (=> d!58765 d!59007))

(declare-fun d!59009 () Bool)

(assert (=> d!59009 (= (invariant!0 lt!260880 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) (size!3858 (buf!4310 thiss!1577))) (and (bvsge lt!260880 #b00000000000000000000000000000000) (bvslt lt!260880 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) (size!3858 (buf!4310 thiss!1577))) (and (= lt!260880 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) (size!3858 (buf!4310 thiss!1577)))))))))

(assert (=> d!58765 d!59009))

(declare-fun b!167962 () Bool)

(declare-fun e!116568 () Bool)

(declare-fun e!116571 () Bool)

(assert (=> b!167962 (= e!116568 e!116571)))

(declare-fun res!139853 () Bool)

(assert (=> b!167962 (=> (not res!139853) (not e!116571))))

(declare-fun e!116567 () Bool)

(assert (=> b!167962 (= res!139853 e!116567)))

(declare-fun res!139850 () Bool)

(assert (=> b!167962 (=> res!139850 e!116567)))

(declare-datatypes ((tuple4!250 0))(
  ( (tuple4!251 (_1!7919 (_ BitVec 32)) (_2!7919 (_ BitVec 32)) (_3!601 (_ BitVec 32)) (_4!125 (_ BitVec 32))) )
))
(declare-fun lt!261393 () tuple4!250)

(assert (=> b!167962 (= res!139850 (bvsge (_1!7919 lt!261393) (_2!7919 lt!261393)))))

(declare-fun lt!261392 () (_ BitVec 32))

(assert (=> b!167962 (= lt!261392 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261394 () (_ BitVec 32))

(assert (=> b!167962 (= lt!261394 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!250)

(assert (=> b!167962 (= lt!261393 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))))))

(declare-fun bm!2822 () Bool)

(declare-fun call!2825 () Bool)

(declare-fun c!8669 () Bool)

(assert (=> bm!2822 (= call!2825 (byteRangesEq!0 (select (arr!4779 (buf!4310 thiss!1577)) (_3!601 lt!261393)) (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261393)) lt!261394 (ite c!8669 lt!261392 #b00000000000000000000000000001000)))))

(declare-fun d!59011 () Bool)

(declare-fun res!139851 () Bool)

(assert (=> d!59011 (=> res!139851 e!116568)))

(assert (=> d!59011 (= res!139851 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))))))

(assert (=> d!59011 (= (arrayBitRangesEq!0 (buf!4310 thiss!1577) (buf!4310 lt!260871) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))) e!116568)))

(declare-fun b!167963 () Bool)

(declare-fun res!139849 () Bool)

(assert (=> b!167963 (= res!139849 (= lt!261392 #b00000000000000000000000000000000))))

(declare-fun e!116569 () Bool)

(assert (=> b!167963 (=> res!139849 e!116569)))

(declare-fun e!116572 () Bool)

(assert (=> b!167963 (= e!116572 e!116569)))

(declare-fun b!167964 () Bool)

(assert (=> b!167964 (= e!116567 (arrayRangesEq!687 (buf!4310 thiss!1577) (buf!4310 lt!260871) (_1!7919 lt!261393) (_2!7919 lt!261393)))))

(declare-fun b!167965 () Bool)

(declare-fun e!116570 () Bool)

(assert (=> b!167965 (= e!116570 call!2825)))

(declare-fun b!167966 () Bool)

(assert (=> b!167966 (= e!116570 e!116572)))

(declare-fun res!139852 () Bool)

(assert (=> b!167966 (= res!139852 call!2825)))

(assert (=> b!167966 (=> (not res!139852) (not e!116572))))

(declare-fun b!167967 () Bool)

(assert (=> b!167967 (= e!116571 e!116570)))

(assert (=> b!167967 (= c!8669 (= (_3!601 lt!261393) (_4!125 lt!261393)))))

(declare-fun b!167968 () Bool)

(assert (=> b!167968 (= e!116569 (byteRangesEq!0 (select (arr!4779 (buf!4310 thiss!1577)) (_4!125 lt!261393)) (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261393)) #b00000000000000000000000000000000 lt!261392))))

(assert (= (and d!59011 (not res!139851)) b!167962))

(assert (= (and b!167962 (not res!139850)) b!167964))

(assert (= (and b!167962 res!139853) b!167967))

(assert (= (and b!167967 c!8669) b!167965))

(assert (= (and b!167967 (not c!8669)) b!167966))

(assert (= (and b!167966 res!139852) b!167963))

(assert (= (and b!167963 (not res!139849)) b!167968))

(assert (= (or b!167965 b!167966) bm!2822))

(assert (=> b!167962 m!266735))

(declare-fun m!267405 () Bool)

(assert (=> b!167962 m!267405))

(declare-fun m!267407 () Bool)

(assert (=> bm!2822 m!267407))

(declare-fun m!267409 () Bool)

(assert (=> bm!2822 m!267409))

(assert (=> bm!2822 m!267407))

(assert (=> bm!2822 m!267409))

(declare-fun m!267411 () Bool)

(assert (=> bm!2822 m!267411))

(declare-fun m!267413 () Bool)

(assert (=> b!167964 m!267413))

(declare-fun m!267415 () Bool)

(assert (=> b!167968 m!267415))

(declare-fun m!267417 () Bool)

(assert (=> b!167968 m!267417))

(assert (=> b!167968 m!267415))

(assert (=> b!167968 m!267417))

(declare-fun m!267419 () Bool)

(assert (=> b!167968 m!267419))

(assert (=> b!167627 d!59011))

(assert (=> b!167627 d!58767))

(declare-fun d!59013 () Bool)

(declare-fun res!139854 () Bool)

(declare-fun e!116573 () Bool)

(assert (=> d!59013 (=> res!139854 e!116573)))

(assert (=> d!59013 (= res!139854 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (=> d!59013 (= (arrayRangesEq!687 lt!260872 lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) e!116573)))

(declare-fun b!167969 () Bool)

(declare-fun e!116574 () Bool)

(assert (=> b!167969 (= e!116573 e!116574)))

(declare-fun res!139855 () Bool)

(assert (=> b!167969 (=> (not res!139855) (not e!116574))))

(assert (=> b!167969 (= res!139855 (= (select (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4779 lt!260877) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167970 () Bool)

(assert (=> b!167970 (= e!116574 (arrayRangesEq!687 lt!260872 lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (= (and d!59013 (not res!139854)) b!167969))

(assert (= (and b!167969 res!139855) b!167970))

(declare-fun m!267421 () Bool)

(assert (=> b!167969 m!267421))

(declare-fun m!267423 () Bool)

(assert (=> b!167969 m!267423))

(declare-fun m!267425 () Bool)

(assert (=> b!167970 m!267425))

(assert (=> b!167613 d!59013))

(declare-fun d!59015 () Bool)

(declare-fun res!139856 () Bool)

(declare-fun e!116575 () Bool)

(assert (=> d!59015 (=> (not res!139856) (not e!116575))))

(assert (=> d!59015 (= res!139856 (= (size!3858 (buf!4310 (_1!7907 lt!261150))) (size!3858 (buf!4310 thiss!1577))))))

(assert (=> d!59015 (= (isPrefixOf!0 (_1!7907 lt!261150) thiss!1577) e!116575)))

(declare-fun b!167971 () Bool)

(declare-fun res!139857 () Bool)

(assert (=> b!167971 (=> (not res!139857) (not e!116575))))

(assert (=> b!167971 (= res!139857 (bvsle (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150))) (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))))))

(declare-fun b!167972 () Bool)

(declare-fun e!116576 () Bool)

(assert (=> b!167972 (= e!116575 e!116576)))

(declare-fun res!139858 () Bool)

(assert (=> b!167972 (=> res!139858 e!116576)))

(assert (=> b!167972 (= res!139858 (= (size!3858 (buf!4310 (_1!7907 lt!261150))) #b00000000000000000000000000000000))))

(declare-fun b!167973 () Bool)

(assert (=> b!167973 (= e!116576 (arrayBitRangesEq!0 (buf!4310 (_1!7907 lt!261150)) (buf!4310 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150)))))))

(assert (= (and d!59015 res!139856) b!167971))

(assert (= (and b!167971 res!139857) b!167972))

(assert (= (and b!167972 (not res!139858)) b!167973))

(assert (=> b!167971 m!267385))

(assert (=> b!167971 m!266735))

(assert (=> b!167973 m!267385))

(assert (=> b!167973 m!267385))

(declare-fun m!267427 () Bool)

(assert (=> b!167973 m!267427))

(assert (=> b!167697 d!59015))

(assert (=> d!58757 d!58753))

(declare-fun d!59017 () Bool)

(assert (=> d!59017 (arrayRangesEq!687 (buf!4310 thiss!1577) lt!260877 #b00000000000000000000000000000000 (currentByte!8155 thiss!1577))))

(assert (=> d!59017 true))

(declare-fun _$16!86 () Unit!11664)

(assert (=> d!59017 (= (choose!260 (buf!4310 thiss!1577) lt!260872 lt!260877 #b00000000000000000000000000000000 (currentByte!8155 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) _$16!86)))

(declare-fun bs!14626 () Bool)

(assert (= bs!14626 d!59017))

(assert (=> bs!14626 m!266745))

(assert (=> d!58757 d!59017))

(declare-fun d!59019 () Bool)

(declare-fun res!139859 () Bool)

(declare-fun e!116577 () Bool)

(assert (=> d!59019 (=> res!139859 e!116577)))

(assert (=> d!59019 (= res!139859 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (=> d!59019 (= (arrayRangesEq!687 lt!260872 (array!8689 (store (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (size!3858 lt!260872)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) e!116577)))

(declare-fun b!167974 () Bool)

(declare-fun e!116578 () Bool)

(assert (=> b!167974 (= e!116577 e!116578)))

(declare-fun res!139860 () Bool)

(assert (=> b!167974 (=> (not res!139860) (not e!116578))))

(assert (=> b!167974 (= res!139860 (= (select (arr!4779 lt!260872) #b00000000000000000000000000000000) (select (arr!4779 (array!8689 (store (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (size!3858 lt!260872))) #b00000000000000000000000000000000)))))

(declare-fun b!167975 () Bool)

(assert (=> b!167975 (= e!116578 (arrayRangesEq!687 lt!260872 (array!8689 (store (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (size!3858 lt!260872)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (= (and d!59019 (not res!139859)) b!167974))

(assert (= (and b!167974 res!139860) b!167975))

(assert (=> b!167974 m!266853))

(declare-fun m!267429 () Bool)

(assert (=> b!167974 m!267429))

(declare-fun m!267431 () Bool)

(assert (=> b!167975 m!267431))

(assert (=> b!167614 d!59019))

(declare-fun d!59021 () Bool)

(declare-fun e!116583 () Bool)

(assert (=> d!59021 e!116583))

(declare-fun res!139863 () Bool)

(assert (=> d!59021 (=> (not res!139863) (not e!116583))))

(declare-fun lt!261415 () tuple2!14628)

(assert (=> d!59021 (= res!139863 (= (buf!4310 (_2!7911 lt!261415)) (buf!4310 (_1!7907 lt!260878))))))

(declare-datatypes ((tuple3!952 0))(
  ( (tuple3!953 (_1!7920 Unit!11664) (_2!7920 (_ BitVec 8)) (_3!602 BitStream!6872)) )
))
(declare-fun lt!261412 () tuple3!952)

(assert (=> d!59021 (= lt!261415 (tuple2!14629 (_2!7920 lt!261412) (_3!602 lt!261412)))))

(declare-fun e!116584 () tuple3!952)

(assert (=> d!59021 (= lt!261412 e!116584)))

(declare-fun c!8672 () Bool)

(declare-fun lt!261410 () (_ BitVec 32))

(assert (=> d!59021 (= c!8672 (bvsle lt!261410 #b00000000000000000000000000001000))))

(assert (=> d!59021 (= lt!261410 (bvadd (currentBit!8150 (_1!7907 lt!260878)) nBits!511))))

(assert (=> d!59021 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000))))

(assert (=> d!59021 (= (readPartialByte!0 (_1!7907 lt!260878) nBits!511) lt!261415)))

(declare-fun b!167982 () Bool)

(declare-fun lt!261413 () tuple2!14634)

(assert (=> b!167982 (= e!116584 (tuple3!953 (_1!7918 lt!261413) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4779 (buf!4310 (_1!7907 lt!260878))) (currentByte!8155 (_1!7907 lt!260878)))) (bvsub #b00000000000000000000000000001000 lt!261410)) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (_2!7918 lt!261413)))))

(assert (=> b!167982 (= lt!261413 (moveBitIndex!0 (_1!7907 lt!260878) ((_ sign_extend 32) nBits!511)))))

(declare-fun lt!261414 () (_ BitVec 32))

(declare-fun b!167983 () Bool)

(declare-fun Unit!11683 () Unit!11664)

(assert (=> b!167983 (= e!116584 (tuple3!953 Unit!11683 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4779 (buf!4310 (_1!7907 lt!260878))) (currentByte!8155 (_1!7907 lt!260878)))) lt!261414))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 (_1!7907 lt!260878))) (bvadd (currentByte!8155 (_1!7907 lt!260878)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261414))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (BitStream!6873 (buf!4310 (_1!7907 lt!260878)) (bvadd (currentByte!8155 (_1!7907 lt!260878)) #b00000000000000000000000000000001) lt!261414)))))

(assert (=> b!167983 (= lt!261414 (bvsub lt!261410 #b00000000000000000000000000001000))))

(declare-fun lt!261411 () (_ BitVec 64))

(declare-fun b!167984 () Bool)

(declare-fun lt!261409 () (_ BitVec 64))

(assert (=> b!167984 (= e!116583 (= (bitIndex!0 (size!3858 (buf!4310 (_2!7911 lt!261415))) (currentByte!8155 (_2!7911 lt!261415)) (currentBit!8150 (_2!7911 lt!261415))) (bvadd lt!261411 lt!261409)))))

(assert (=> b!167984 (or (not (= (bvand lt!261411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261409 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261411 lt!261409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!167984 (= lt!261409 ((_ sign_extend 32) nBits!511))))

(assert (=> b!167984 (= lt!261411 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!260878))) (currentByte!8155 (_1!7907 lt!260878)) (currentBit!8150 (_1!7907 lt!260878))))))

(assert (= (and d!59021 c!8672) b!167982))

(assert (= (and d!59021 (not c!8672)) b!167983))

(assert (= (and d!59021 res!139863) b!167984))

(declare-fun m!267433 () Bool)

(assert (=> b!167982 m!267433))

(assert (=> b!167982 m!266727))

(declare-fun m!267435 () Bool)

(assert (=> b!167982 m!267435))

(assert (=> b!167983 m!267433))

(declare-fun m!267437 () Bool)

(assert (=> b!167983 m!267437))

(assert (=> b!167983 m!266727))

(declare-fun m!267439 () Bool)

(assert (=> b!167984 m!267439))

(declare-fun m!267441 () Bool)

(assert (=> b!167984 m!267441))

(assert (=> d!58773 d!59021))

(assert (=> d!58767 d!59005))

(declare-fun d!59023 () Bool)

(assert (=> d!59023 (= (invariant!0 (currentBit!8150 thiss!1577) (currentByte!8155 thiss!1577) (size!3858 (buf!4310 thiss!1577))) (and (bvsge (currentBit!8150 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8150 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8155 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8155 thiss!1577) (size!3858 (buf!4310 thiss!1577))) (and (= (currentBit!8150 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8155 thiss!1577) (size!3858 (buf!4310 thiss!1577)))))))))

(assert (=> d!58767 d!59023))

(declare-fun d!59025 () Bool)

(declare-fun res!139864 () Bool)

(declare-fun e!116585 () Bool)

(assert (=> d!59025 (=> res!139864 e!116585)))

(assert (=> d!59025 (= res!139864 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (=> d!59025 (= (arrayRangesEq!687 (buf!4310 thiss!1577) lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)) e!116585)))

(declare-fun b!167985 () Bool)

(declare-fun e!116586 () Bool)

(assert (=> b!167985 (= e!116585 e!116586)))

(declare-fun res!139865 () Bool)

(assert (=> b!167985 (=> (not res!139865) (not e!116586))))

(assert (=> b!167985 (= res!139865 (= (select (arr!4779 (buf!4310 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4779 lt!260877) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167986 () Bool)

(assert (=> b!167986 (= e!116586 (arrayRangesEq!687 (buf!4310 thiss!1577) lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (= (and d!59025 (not res!139864)) b!167985))

(assert (= (and b!167985 res!139865) b!167986))

(declare-fun m!267443 () Bool)

(assert (=> b!167985 m!267443))

(assert (=> b!167985 m!267423))

(declare-fun m!267445 () Bool)

(assert (=> b!167986 m!267445))

(assert (=> b!167616 d!59025))

(declare-fun d!59027 () Bool)

(declare-fun res!139866 () Bool)

(declare-fun e!116587 () Bool)

(assert (=> d!59027 (=> res!139866 e!116587)))

(assert (=> d!59027 (= res!139866 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (=> d!59027 (= (arrayRangesEq!687 (buf!4310 thiss!1577) (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)) e!116587)))

(declare-fun b!167987 () Bool)

(declare-fun e!116588 () Bool)

(assert (=> b!167987 (= e!116587 e!116588)))

(declare-fun res!139867 () Bool)

(assert (=> b!167987 (=> (not res!139867) (not e!116588))))

(assert (=> b!167987 (= res!139867 (= (select (arr!4779 (buf!4310 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4779 (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167988 () Bool)

(assert (=> b!167988 (= e!116588 (arrayRangesEq!687 (buf!4310 thiss!1577) (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (= (and d!59027 (not res!139866)) b!167987))

(assert (= (and b!167987 res!139867) b!167988))

(assert (=> b!167987 m!267443))

(declare-fun m!267447 () Bool)

(assert (=> b!167987 m!267447))

(declare-fun m!267449 () Bool)

(assert (=> b!167988 m!267449))

(assert (=> b!167618 d!59027))

(declare-fun d!59029 () Bool)

(assert (=> d!59029 (arrayRangesEq!687 (buf!4310 thiss!1577) (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8155 thiss!1577))))

(assert (=> d!59029 true))

(declare-fun _$8!216 () Unit!11664)

(assert (=> d!59029 (= (choose!259 (buf!4310 thiss!1577) (currentByte!8155 thiss!1577) lt!260875) _$8!216)))

(declare-fun bs!14627 () Bool)

(assert (= bs!14627 d!59029))

(assert (=> bs!14627 m!266743))

(assert (=> bs!14627 m!266751))

(assert (=> d!58743 d!59029))

(declare-fun d!59031 () Bool)

(declare-fun res!139868 () Bool)

(declare-fun e!116589 () Bool)

(assert (=> d!59031 (=> (not res!139868) (not e!116589))))

(assert (=> d!59031 (= res!139868 (= (size!3858 (buf!4310 (_2!7907 lt!261150))) (size!3858 (buf!4310 lt!260871))))))

(assert (=> d!59031 (= (isPrefixOf!0 (_2!7907 lt!261150) lt!260871) e!116589)))

(declare-fun b!167989 () Bool)

(declare-fun res!139869 () Bool)

(assert (=> b!167989 (=> (not res!139869) (not e!116589))))

(assert (=> b!167989 (= res!139869 (bvsle (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150))) (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871))))))

(declare-fun b!167990 () Bool)

(declare-fun e!116590 () Bool)

(assert (=> b!167990 (= e!116589 e!116590)))

(declare-fun res!139870 () Bool)

(assert (=> b!167990 (=> res!139870 e!116590)))

(assert (=> b!167990 (= res!139870 (= (size!3858 (buf!4310 (_2!7907 lt!261150))) #b00000000000000000000000000000000))))

(declare-fun b!167991 () Bool)

(assert (=> b!167991 (= e!116590 (arrayBitRangesEq!0 (buf!4310 (_2!7907 lt!261150)) (buf!4310 lt!260871) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150)))))))

(assert (= (and d!59031 res!139868) b!167989))

(assert (= (and b!167989 res!139869) b!167990))

(assert (= (and b!167990 (not res!139870)) b!167991))

(assert (=> b!167989 m!267387))

(assert (=> b!167989 m!266877))

(assert (=> b!167991 m!267387))

(assert (=> b!167991 m!267387))

(declare-fun m!267451 () Bool)

(assert (=> b!167991 m!267451))

(assert (=> b!167694 d!59031))

(assert (=> d!58759 d!59023))

(assert (=> b!167693 d!58767))

(declare-fun d!59033 () Bool)

(assert (=> d!59033 (arrayBitRangesEq!0 (buf!4310 lt!260871) (buf!4310 thiss!1577) lt!261160 lt!261156)))

(declare-fun lt!261418 () Unit!11664)

(declare-fun choose!8 (array!8688 array!8688 (_ BitVec 64) (_ BitVec 64)) Unit!11664)

(assert (=> d!59033 (= lt!261418 (choose!8 (buf!4310 thiss!1577) (buf!4310 lt!260871) lt!261160 lt!261156))))

(assert (=> d!59033 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261160) (bvsle lt!261160 lt!261156))))

(assert (=> d!59033 (= (arrayBitRangesEqSymmetric!0 (buf!4310 thiss!1577) (buf!4310 lt!260871) lt!261160 lt!261156) lt!261418)))

(declare-fun bs!14628 () Bool)

(assert (= bs!14628 d!59033))

(assert (=> bs!14628 m!266985))

(declare-fun m!267453 () Bool)

(assert (=> bs!14628 m!267453))

(assert (=> b!167693 d!59033))

(declare-fun b!167992 () Bool)

(declare-fun e!116592 () Bool)

(declare-fun e!116595 () Bool)

(assert (=> b!167992 (= e!116592 e!116595)))

(declare-fun res!139875 () Bool)

(assert (=> b!167992 (=> (not res!139875) (not e!116595))))

(declare-fun e!116591 () Bool)

(assert (=> b!167992 (= res!139875 e!116591)))

(declare-fun res!139872 () Bool)

(assert (=> b!167992 (=> res!139872 e!116591)))

(declare-fun lt!261420 () tuple4!250)

(assert (=> b!167992 (= res!139872 (bvsge (_1!7919 lt!261420) (_2!7919 lt!261420)))))

(declare-fun lt!261419 () (_ BitVec 32))

(assert (=> b!167992 (= lt!261419 ((_ extract 31 0) (bvsrem lt!261156 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261421 () (_ BitVec 32))

(assert (=> b!167992 (= lt!261421 ((_ extract 31 0) (bvsrem lt!261160 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167992 (= lt!261420 (arrayBitIndices!0 lt!261160 lt!261156))))

(declare-fun bm!2823 () Bool)

(declare-fun call!2826 () Bool)

(declare-fun c!8673 () Bool)

(assert (=> bm!2823 (= call!2826 (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261420)) (select (arr!4779 (buf!4310 thiss!1577)) (_3!601 lt!261420)) lt!261421 (ite c!8673 lt!261419 #b00000000000000000000000000001000)))))

(declare-fun d!59035 () Bool)

(declare-fun res!139873 () Bool)

(assert (=> d!59035 (=> res!139873 e!116592)))

(assert (=> d!59035 (= res!139873 (bvsge lt!261160 lt!261156))))

(assert (=> d!59035 (= (arrayBitRangesEq!0 (buf!4310 lt!260871) (buf!4310 thiss!1577) lt!261160 lt!261156) e!116592)))

(declare-fun b!167993 () Bool)

(declare-fun res!139871 () Bool)

(assert (=> b!167993 (= res!139871 (= lt!261419 #b00000000000000000000000000000000))))

(declare-fun e!116593 () Bool)

(assert (=> b!167993 (=> res!139871 e!116593)))

(declare-fun e!116596 () Bool)

(assert (=> b!167993 (= e!116596 e!116593)))

(declare-fun b!167994 () Bool)

(assert (=> b!167994 (= e!116591 (arrayRangesEq!687 (buf!4310 lt!260871) (buf!4310 thiss!1577) (_1!7919 lt!261420) (_2!7919 lt!261420)))))

(declare-fun b!167995 () Bool)

(declare-fun e!116594 () Bool)

(assert (=> b!167995 (= e!116594 call!2826)))

(declare-fun b!167996 () Bool)

(assert (=> b!167996 (= e!116594 e!116596)))

(declare-fun res!139874 () Bool)

(assert (=> b!167996 (= res!139874 call!2826)))

(assert (=> b!167996 (=> (not res!139874) (not e!116596))))

(declare-fun b!167997 () Bool)

(assert (=> b!167997 (= e!116595 e!116594)))

(assert (=> b!167997 (= c!8673 (= (_3!601 lt!261420) (_4!125 lt!261420)))))

(declare-fun b!167998 () Bool)

(assert (=> b!167998 (= e!116593 (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261420)) (select (arr!4779 (buf!4310 thiss!1577)) (_4!125 lt!261420)) #b00000000000000000000000000000000 lt!261419))))

(assert (= (and d!59035 (not res!139873)) b!167992))

(assert (= (and b!167992 (not res!139872)) b!167994))

(assert (= (and b!167992 res!139875) b!167997))

(assert (= (and b!167997 c!8673) b!167995))

(assert (= (and b!167997 (not c!8673)) b!167996))

(assert (= (and b!167996 res!139874) b!167993))

(assert (= (and b!167993 (not res!139871)) b!167998))

(assert (= (or b!167995 b!167996) bm!2823))

(declare-fun m!267455 () Bool)

(assert (=> b!167992 m!267455))

(declare-fun m!267457 () Bool)

(assert (=> bm!2823 m!267457))

(declare-fun m!267459 () Bool)

(assert (=> bm!2823 m!267459))

(assert (=> bm!2823 m!267457))

(assert (=> bm!2823 m!267459))

(declare-fun m!267461 () Bool)

(assert (=> bm!2823 m!267461))

(declare-fun m!267463 () Bool)

(assert (=> b!167994 m!267463))

(declare-fun m!267465 () Bool)

(assert (=> b!167998 m!267465))

(declare-fun m!267467 () Bool)

(assert (=> b!167998 m!267467))

(assert (=> b!167998 m!267465))

(assert (=> b!167998 m!267467))

(declare-fun m!267469 () Bool)

(assert (=> b!167998 m!267469))

(assert (=> b!167693 d!59035))

(assert (=> b!167625 d!58767))

(assert (=> b!167625 d!59003))

(assert (=> b!167607 d!58755))

(declare-fun d!59037 () Bool)

(assert (=> d!59037 (arrayRangesEq!687 lt!260872 (array!8689 (store (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (size!3858 lt!260872)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)))))

(assert (=> d!59037 true))

(declare-fun _$8!217 () Unit!11664)

(assert (=> d!59037 (= (choose!259 lt!260872 (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) _$8!217)))

(declare-fun bs!14629 () Bool)

(assert (= bs!14629 d!59037))

(assert (=> bs!14629 m!266861))

(assert (=> bs!14629 m!266863))

(assert (=> d!58751 d!59037))

(push 1)

(assert (not b!167992))

(assert (not b!167930))

(assert (not b!167971))

(assert (not d!58993))

(assert (not b!167940))

(assert (not b!167991))

(assert (not b!167933))

(assert (not d!59037))

(assert (not d!59001))

(assert (not b!167937))

(assert (not d!58989))

(assert (not b!167998))

(assert (not b!167986))

(assert (not d!59029))

(assert (not b!167962))

(assert (not b!167989))

(assert (not d!59003))

(assert (not d!59033))

(assert (not b!167942))

(assert (not d!58981))

(assert (not b!167968))

(assert (not b!167984))

(assert (not b!167939))

(assert (not d!58999))

(assert (not d!59017))

(assert (not b!167973))

(assert (not b!167994))

(assert (not bm!2823))

(assert (not b!167988))

(assert (not bm!2822))

(assert (not b!167931))

(assert (not b!167975))

(assert (not d!58987))

(assert (not b!167934))

(assert (not b!167982))

(assert (not b!167928))

(assert (not b!167936))

(assert (not b!167970))

(assert (not b!167964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59115 () Bool)

(assert (=> d!59115 (= (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261420)) (select (arr!4779 (buf!4310 thiss!1577)) (_3!601 lt!261420)) lt!261421 (ite c!8673 lt!261419 #b00000000000000000000000000001000)) (or (= lt!261421 (ite c!8673 lt!261419 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261420))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8673 lt!261419 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261421)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 thiss!1577)) (_3!601 lt!261420))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8673 lt!261419 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261421)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14641 () Bool)

(assert (= bs!14641 d!59115))

(declare-fun m!267639 () Bool)

(assert (=> bs!14641 m!267639))

(declare-fun m!267641 () Bool)

(assert (=> bs!14641 m!267641))

(assert (=> bm!2823 d!59115))

(declare-fun b!168087 () Bool)

(declare-fun e!116671 () Bool)

(declare-fun e!116674 () Bool)

(assert (=> b!168087 (= e!116671 e!116674)))

(declare-fun res!139953 () Bool)

(assert (=> b!168087 (=> (not res!139953) (not e!116674))))

(declare-fun e!116670 () Bool)

(assert (=> b!168087 (= res!139953 e!116670)))

(declare-fun res!139950 () Bool)

(assert (=> b!168087 (=> res!139950 e!116670)))

(declare-fun lt!261507 () tuple4!250)

(assert (=> b!168087 (= res!139950 (bvsge (_1!7919 lt!261507) (_2!7919 lt!261507)))))

(declare-fun lt!261506 () (_ BitVec 32))

(assert (=> b!168087 (= lt!261506 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261508 () (_ BitVec 32))

(assert (=> b!168087 (= lt!261508 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168087 (= lt!261507 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))))))

(declare-fun c!8681 () Bool)

(declare-fun bm!2831 () Bool)

(declare-fun call!2834 () Bool)

(assert (=> bm!2831 (= call!2834 (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!261162)) (_3!601 lt!261507)) (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261507)) lt!261508 (ite c!8681 lt!261506 #b00000000000000000000000000001000)))))

(declare-fun d!59117 () Bool)

(declare-fun res!139951 () Bool)

(assert (=> d!59117 (=> res!139951 e!116671)))

(assert (=> d!59117 (= res!139951 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))))))

(assert (=> d!59117 (= (arrayBitRangesEq!0 (buf!4310 lt!261162) (buf!4310 lt!260871) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))) e!116671)))

(declare-fun b!168088 () Bool)

(declare-fun res!139949 () Bool)

(assert (=> b!168088 (= res!139949 (= lt!261506 #b00000000000000000000000000000000))))

(declare-fun e!116672 () Bool)

(assert (=> b!168088 (=> res!139949 e!116672)))

(declare-fun e!116675 () Bool)

(assert (=> b!168088 (= e!116675 e!116672)))

(declare-fun b!168089 () Bool)

(assert (=> b!168089 (= e!116670 (arrayRangesEq!687 (buf!4310 lt!261162) (buf!4310 lt!260871) (_1!7919 lt!261507) (_2!7919 lt!261507)))))

(declare-fun b!168090 () Bool)

(declare-fun e!116673 () Bool)

(assert (=> b!168090 (= e!116673 call!2834)))

(declare-fun b!168091 () Bool)

(assert (=> b!168091 (= e!116673 e!116675)))

(declare-fun res!139952 () Bool)

(assert (=> b!168091 (= res!139952 call!2834)))

(assert (=> b!168091 (=> (not res!139952) (not e!116675))))

(declare-fun b!168092 () Bool)

(assert (=> b!168092 (= e!116674 e!116673)))

(assert (=> b!168092 (= c!8681 (= (_3!601 lt!261507) (_4!125 lt!261507)))))

(declare-fun b!168093 () Bool)

(assert (=> b!168093 (= e!116672 (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!261162)) (_4!125 lt!261507)) (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261507)) #b00000000000000000000000000000000 lt!261506))))

(assert (= (and d!59117 (not res!139951)) b!168087))

(assert (= (and b!168087 (not res!139950)) b!168089))

(assert (= (and b!168087 res!139953) b!168092))

(assert (= (and b!168092 c!8681) b!168090))

(assert (= (and b!168092 (not c!8681)) b!168091))

(assert (= (and b!168091 res!139952) b!168088))

(assert (= (and b!168088 (not res!139949)) b!168093))

(assert (= (or b!168090 b!168091) bm!2831))

(assert (=> b!168087 m!267371))

(declare-fun m!267643 () Bool)

(assert (=> b!168087 m!267643))

(declare-fun m!267645 () Bool)

(assert (=> bm!2831 m!267645))

(declare-fun m!267647 () Bool)

(assert (=> bm!2831 m!267647))

(assert (=> bm!2831 m!267645))

(assert (=> bm!2831 m!267647))

(declare-fun m!267649 () Bool)

(assert (=> bm!2831 m!267649))

(declare-fun m!267651 () Bool)

(assert (=> b!168089 m!267651))

(declare-fun m!267653 () Bool)

(assert (=> b!168093 m!267653))

(declare-fun m!267655 () Bool)

(assert (=> b!168093 m!267655))

(assert (=> b!168093 m!267653))

(assert (=> b!168093 m!267655))

(declare-fun m!267657 () Bool)

(assert (=> b!168093 m!267657))

(assert (=> b!167933 d!59117))

(declare-fun d!59119 () Bool)

(declare-fun e!116676 () Bool)

(assert (=> d!59119 e!116676))

(declare-fun res!139955 () Bool)

(assert (=> d!59119 (=> (not res!139955) (not e!116676))))

(declare-fun lt!261514 () (_ BitVec 64))

(declare-fun lt!261510 () (_ BitVec 64))

(declare-fun lt!261512 () (_ BitVec 64))

(assert (=> d!59119 (= res!139955 (= lt!261510 (bvsub lt!261512 lt!261514)))))

(assert (=> d!59119 (or (= (bvand lt!261512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261514 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261512 lt!261514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59119 (= lt!261514 (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 lt!261162))) ((_ sign_extend 32) (currentByte!8155 lt!261162)) ((_ sign_extend 32) (currentBit!8150 lt!261162))))))

(declare-fun lt!261511 () (_ BitVec 64))

(declare-fun lt!261509 () (_ BitVec 64))

(assert (=> d!59119 (= lt!261512 (bvmul lt!261511 lt!261509))))

(assert (=> d!59119 (or (= lt!261511 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261509 (bvsdiv (bvmul lt!261511 lt!261509) lt!261511)))))

(assert (=> d!59119 (= lt!261509 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59119 (= lt!261511 ((_ sign_extend 32) (size!3858 (buf!4310 lt!261162))))))

(assert (=> d!59119 (= lt!261510 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 lt!261162)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 lt!261162))))))

(assert (=> d!59119 (invariant!0 (currentBit!8150 lt!261162) (currentByte!8155 lt!261162) (size!3858 (buf!4310 lt!261162)))))

(assert (=> d!59119 (= (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162)) lt!261510)))

(declare-fun b!168094 () Bool)

(declare-fun res!139954 () Bool)

(assert (=> b!168094 (=> (not res!139954) (not e!116676))))

(assert (=> b!168094 (= res!139954 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261510))))

(declare-fun b!168095 () Bool)

(declare-fun lt!261513 () (_ BitVec 64))

(assert (=> b!168095 (= e!116676 (bvsle lt!261510 (bvmul lt!261513 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168095 (or (= lt!261513 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261513 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261513)))))

(assert (=> b!168095 (= lt!261513 ((_ sign_extend 32) (size!3858 (buf!4310 lt!261162))))))

(assert (= (and d!59119 res!139955) b!168094))

(assert (= (and b!168094 res!139954) b!168095))

(declare-fun m!267659 () Bool)

(assert (=> d!59119 m!267659))

(declare-fun m!267661 () Bool)

(assert (=> d!59119 m!267661))

(assert (=> b!167933 d!59119))

(assert (=> b!167940 d!59119))

(declare-fun d!59121 () Bool)

(declare-fun res!139956 () Bool)

(declare-fun e!116677 () Bool)

(assert (=> d!59121 (=> res!139956 e!116677)))

(assert (=> d!59121 (= res!139956 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (=> d!59121 (= (arrayRangesEq!687 lt!260872 (array!8689 (store (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (size!3858 lt!260872)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) e!116677)))

(declare-fun b!168096 () Bool)

(declare-fun e!116678 () Bool)

(assert (=> b!168096 (= e!116677 e!116678)))

(declare-fun res!139957 () Bool)

(assert (=> b!168096 (=> (not res!139957) (not e!116678))))

(assert (=> b!168096 (= res!139957 (= (select (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4779 (array!8689 (store (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (size!3858 lt!260872))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!168097 () Bool)

(assert (=> b!168097 (= e!116678 (arrayRangesEq!687 lt!260872 (array!8689 (store (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577)) lt!260873) (size!3858 lt!260872)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (= (and d!59121 (not res!139956)) b!168096))

(assert (= (and b!168096 res!139957) b!168097))

(assert (=> b!168096 m!267421))

(declare-fun m!267663 () Bool)

(assert (=> b!168096 m!267663))

(declare-fun m!267665 () Bool)

(assert (=> b!168097 m!267665))

(assert (=> b!167975 d!59121))

(declare-fun d!59123 () Bool)

(assert (=> d!59123 (= (byteRangesEq!0 (select (arr!4779 (buf!4310 thiss!1577)) (_4!125 lt!261393)) (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261393)) #b00000000000000000000000000000000 lt!261392) (or (= #b00000000000000000000000000000000 lt!261392) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 thiss!1577)) (_4!125 lt!261393))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261392))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261393))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261392))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14642 () Bool)

(assert (= bs!14642 d!59123))

(declare-fun m!267667 () Bool)

(assert (=> bs!14642 m!267667))

(assert (=> bs!14642 m!266851))

(assert (=> b!167968 d!59123))

(declare-fun d!59125 () Bool)

(declare-fun res!139958 () Bool)

(declare-fun e!116679 () Bool)

(assert (=> d!59125 (=> res!139958 e!116679)))

(assert (=> d!59125 (= res!139958 (= (_1!7919 lt!261420) (_2!7919 lt!261420)))))

(assert (=> d!59125 (= (arrayRangesEq!687 (buf!4310 lt!260871) (buf!4310 thiss!1577) (_1!7919 lt!261420) (_2!7919 lt!261420)) e!116679)))

(declare-fun b!168098 () Bool)

(declare-fun e!116680 () Bool)

(assert (=> b!168098 (= e!116679 e!116680)))

(declare-fun res!139959 () Bool)

(assert (=> b!168098 (=> (not res!139959) (not e!116680))))

(assert (=> b!168098 (= res!139959 (= (select (arr!4779 (buf!4310 lt!260871)) (_1!7919 lt!261420)) (select (arr!4779 (buf!4310 thiss!1577)) (_1!7919 lt!261420))))))

(declare-fun b!168099 () Bool)

(assert (=> b!168099 (= e!116680 (arrayRangesEq!687 (buf!4310 lt!260871) (buf!4310 thiss!1577) (bvadd (_1!7919 lt!261420) #b00000000000000000000000000000001) (_2!7919 lt!261420)))))

(assert (= (and d!59125 (not res!139958)) b!168098))

(assert (= (and b!168098 res!139959) b!168099))

(declare-fun m!267669 () Bool)

(assert (=> b!168098 m!267669))

(declare-fun m!267671 () Bool)

(assert (=> b!168098 m!267671))

(declare-fun m!267673 () Bool)

(assert (=> b!168099 m!267673))

(assert (=> b!167994 d!59125))

(declare-fun d!59127 () Bool)

(declare-fun res!139960 () Bool)

(declare-fun e!116681 () Bool)

(assert (=> d!59127 (=> res!139960 e!116681)))

(assert (=> d!59127 (= res!139960 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (=> d!59127 (= (arrayRangesEq!687 (buf!4310 thiss!1577) (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)) e!116681)))

(declare-fun b!168100 () Bool)

(declare-fun e!116682 () Bool)

(assert (=> b!168100 (= e!116681 e!116682)))

(declare-fun res!139961 () Bool)

(assert (=> b!168100 (=> (not res!139961) (not e!116682))))

(assert (=> b!168100 (= res!139961 (= (select (arr!4779 (buf!4310 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4779 (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!168101 () Bool)

(assert (=> b!168101 (= e!116682 (arrayRangesEq!687 (buf!4310 thiss!1577) (array!8689 (store (arr!4779 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) lt!260875) (size!3858 (buf!4310 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (= (and d!59127 (not res!139960)) b!168100))

(assert (= (and b!168100 res!139961) b!168101))

(declare-fun m!267675 () Bool)

(assert (=> b!168100 m!267675))

(declare-fun m!267677 () Bool)

(assert (=> b!168100 m!267677))

(declare-fun m!267679 () Bool)

(assert (=> b!168101 m!267679))

(assert (=> b!167988 d!59127))

(assert (=> d!59037 d!59019))

(assert (=> d!59017 d!58753))

(declare-fun b!168102 () Bool)

(declare-fun e!116684 () Bool)

(declare-fun e!116687 () Bool)

(assert (=> b!168102 (= e!116684 e!116687)))

(declare-fun res!139966 () Bool)

(assert (=> b!168102 (=> (not res!139966) (not e!116687))))

(declare-fun e!116683 () Bool)

(assert (=> b!168102 (= res!139966 e!116683)))

(declare-fun res!139963 () Bool)

(assert (=> b!168102 (=> res!139963 e!116683)))

(declare-fun lt!261516 () tuple4!250)

(assert (=> b!168102 (= res!139963 (bvsge (_1!7919 lt!261516) (_2!7919 lt!261516)))))

(declare-fun lt!261515 () (_ BitVec 32))

(assert (=> b!168102 (= lt!261515 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261517 () (_ BitVec 32))

(assert (=> b!168102 (= lt!261517 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168102 (= lt!261516 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))))))

(declare-fun call!2835 () Bool)

(declare-fun bm!2832 () Bool)

(declare-fun c!8682 () Bool)

(assert (=> bm!2832 (= call!2835 (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!261162)) (_3!601 lt!261516)) (select (arr!4779 (buf!4310 lt!261162)) (_3!601 lt!261516)) lt!261517 (ite c!8682 lt!261515 #b00000000000000000000000000001000)))))

(declare-fun d!59129 () Bool)

(declare-fun res!139964 () Bool)

(assert (=> d!59129 (=> res!139964 e!116684)))

(assert (=> d!59129 (= res!139964 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))))))

(assert (=> d!59129 (= (arrayBitRangesEq!0 (buf!4310 lt!261162) (buf!4310 lt!261162) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))) e!116684)))

(declare-fun b!168103 () Bool)

(declare-fun res!139962 () Bool)

(assert (=> b!168103 (= res!139962 (= lt!261515 #b00000000000000000000000000000000))))

(declare-fun e!116685 () Bool)

(assert (=> b!168103 (=> res!139962 e!116685)))

(declare-fun e!116688 () Bool)

(assert (=> b!168103 (= e!116688 e!116685)))

(declare-fun b!168104 () Bool)

(assert (=> b!168104 (= e!116683 (arrayRangesEq!687 (buf!4310 lt!261162) (buf!4310 lt!261162) (_1!7919 lt!261516) (_2!7919 lt!261516)))))

(declare-fun b!168105 () Bool)

(declare-fun e!116686 () Bool)

(assert (=> b!168105 (= e!116686 call!2835)))

(declare-fun b!168106 () Bool)

(assert (=> b!168106 (= e!116686 e!116688)))

(declare-fun res!139965 () Bool)

(assert (=> b!168106 (= res!139965 call!2835)))

(assert (=> b!168106 (=> (not res!139965) (not e!116688))))

(declare-fun b!168107 () Bool)

(assert (=> b!168107 (= e!116687 e!116686)))

(assert (=> b!168107 (= c!8682 (= (_3!601 lt!261516) (_4!125 lt!261516)))))

(declare-fun b!168108 () Bool)

(assert (=> b!168108 (= e!116685 (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!261162)) (_4!125 lt!261516)) (select (arr!4779 (buf!4310 lt!261162)) (_4!125 lt!261516)) #b00000000000000000000000000000000 lt!261515))))

(assert (= (and d!59129 (not res!139964)) b!168102))

(assert (= (and b!168102 (not res!139963)) b!168104))

(assert (= (and b!168102 res!139966) b!168107))

(assert (= (and b!168107 c!8682) b!168105))

(assert (= (and b!168107 (not c!8682)) b!168106))

(assert (= (and b!168106 res!139965) b!168103))

(assert (= (and b!168103 (not res!139962)) b!168108))

(assert (= (or b!168105 b!168106) bm!2832))

(assert (=> b!168102 m!267371))

(assert (=> b!168102 m!267643))

(declare-fun m!267681 () Bool)

(assert (=> bm!2832 m!267681))

(assert (=> bm!2832 m!267681))

(assert (=> bm!2832 m!267681))

(assert (=> bm!2832 m!267681))

(declare-fun m!267683 () Bool)

(assert (=> bm!2832 m!267683))

(declare-fun m!267685 () Bool)

(assert (=> b!168104 m!267685))

(declare-fun m!267687 () Bool)

(assert (=> b!168108 m!267687))

(assert (=> b!168108 m!267687))

(assert (=> b!168108 m!267687))

(assert (=> b!168108 m!267687))

(declare-fun m!267689 () Bool)

(assert (=> b!168108 m!267689))

(assert (=> b!167942 d!59129))

(assert (=> b!167942 d!59119))

(declare-fun d!59131 () Bool)

(declare-fun res!139967 () Bool)

(declare-fun e!116689 () Bool)

(assert (=> d!59131 (=> res!139967 e!116689)))

(assert (=> d!59131 (= res!139967 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (=> d!59131 (= (arrayRangesEq!687 lt!260872 lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))) e!116689)))

(declare-fun b!168109 () Bool)

(declare-fun e!116690 () Bool)

(assert (=> b!168109 (= e!116689 e!116690)))

(declare-fun res!139968 () Bool)

(assert (=> b!168109 (=> (not res!139968) (not e!116690))))

(assert (=> b!168109 (= res!139968 (= (select (arr!4779 lt!260872) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4779 lt!260877) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!168110 () Bool)

(assert (=> b!168110 (= e!116690 (arrayRangesEq!687 lt!260872 lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8155 thiss!1577))))))

(assert (= (and d!59131 (not res!139967)) b!168109))

(assert (= (and b!168109 res!139968) b!168110))

(declare-fun m!267691 () Bool)

(assert (=> b!168109 m!267691))

(declare-fun m!267693 () Bool)

(assert (=> b!168109 m!267693))

(declare-fun m!267695 () Bool)

(assert (=> b!168110 m!267695))

(assert (=> b!167970 d!59131))

(declare-fun d!59133 () Bool)

(declare-fun e!116691 () Bool)

(assert (=> d!59133 e!116691))

(declare-fun res!139970 () Bool)

(assert (=> d!59133 (=> (not res!139970) (not e!116691))))

(declare-fun lt!261523 () (_ BitVec 64))

(declare-fun lt!261521 () (_ BitVec 64))

(declare-fun lt!261519 () (_ BitVec 64))

(assert (=> d!59133 (= res!139970 (= lt!261519 (bvsub lt!261521 lt!261523)))))

(assert (=> d!59133 (or (= (bvand lt!261521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261523 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261521 lt!261523) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59133 (= lt!261523 (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 (_2!7907 lt!261150)))) ((_ sign_extend 32) (currentByte!8155 (_2!7907 lt!261150))) ((_ sign_extend 32) (currentBit!8150 (_2!7907 lt!261150)))))))

(declare-fun lt!261520 () (_ BitVec 64))

(declare-fun lt!261518 () (_ BitVec 64))

(assert (=> d!59133 (= lt!261521 (bvmul lt!261520 lt!261518))))

(assert (=> d!59133 (or (= lt!261520 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261518 (bvsdiv (bvmul lt!261520 lt!261518) lt!261520)))))

(assert (=> d!59133 (= lt!261518 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59133 (= lt!261520 ((_ sign_extend 32) (size!3858 (buf!4310 (_2!7907 lt!261150)))))))

(assert (=> d!59133 (= lt!261519 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 (_2!7907 lt!261150))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 (_2!7907 lt!261150)))))))

(assert (=> d!59133 (invariant!0 (currentBit!8150 (_2!7907 lt!261150)) (currentByte!8155 (_2!7907 lt!261150)) (size!3858 (buf!4310 (_2!7907 lt!261150))))))

(assert (=> d!59133 (= (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150))) lt!261519)))

(declare-fun b!168111 () Bool)

(declare-fun res!139969 () Bool)

(assert (=> b!168111 (=> (not res!139969) (not e!116691))))

(assert (=> b!168111 (= res!139969 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261519))))

(declare-fun b!168112 () Bool)

(declare-fun lt!261522 () (_ BitVec 64))

(assert (=> b!168112 (= e!116691 (bvsle lt!261519 (bvmul lt!261522 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168112 (or (= lt!261522 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261522 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261522)))))

(assert (=> b!168112 (= lt!261522 ((_ sign_extend 32) (size!3858 (buf!4310 (_2!7907 lt!261150)))))))

(assert (= (and d!59133 res!139970) b!168111))

(assert (= (and b!168111 res!139969) b!168112))

(declare-fun m!267697 () Bool)

(assert (=> d!59133 m!267697))

(declare-fun m!267699 () Bool)

(assert (=> d!59133 m!267699))

(assert (=> b!167989 d!59133))

(assert (=> b!167989 d!59003))

(declare-fun d!59135 () Bool)

(assert (=> d!59135 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))) (tuple4!251 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!167962 d!59135))

(declare-fun d!59137 () Bool)

(assert (=> d!59137 (= (byteRangesEq!0 (select (arr!4779 (buf!4310 thiss!1577)) (_3!601 lt!261393)) (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261393)) lt!261394 (ite c!8669 lt!261392 #b00000000000000000000000000001000)) (or (= lt!261394 (ite c!8669 lt!261392 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 thiss!1577)) (_3!601 lt!261393))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8669 lt!261392 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261394)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261393))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8669 lt!261392 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261394)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14643 () Bool)

(assert (= bs!14643 d!59137))

(declare-fun m!267701 () Bool)

(assert (=> bs!14643 m!267701))

(declare-fun m!267703 () Bool)

(assert (=> bs!14643 m!267703))

(assert (=> bm!2822 d!59137))

(assert (=> d!58989 d!58997))

(declare-fun d!59139 () Bool)

(assert (=> d!59139 (isPrefixOf!0 lt!261162 lt!261162)))

(assert (=> d!59139 true))

(declare-fun _$14!317 () Unit!11664)

(assert (=> d!59139 (= (choose!11 lt!261162) _$14!317)))

(declare-fun bs!14645 () Bool)

(assert (= bs!14645 d!59139))

(assert (=> bs!14645 m!266971))

(assert (=> d!58989 d!59139))

(declare-fun d!59141 () Bool)

(declare-fun e!116692 () Bool)

(assert (=> d!59141 e!116692))

(declare-fun res!139972 () Bool)

(assert (=> d!59141 (=> (not res!139972) (not e!116692))))

(declare-fun lt!261525 () (_ BitVec 64))

(declare-fun lt!261529 () (_ BitVec 64))

(declare-fun lt!261527 () (_ BitVec 64))

(assert (=> d!59141 (= res!139972 (= lt!261525 (bvsub lt!261527 lt!261529)))))

(assert (=> d!59141 (or (= (bvand lt!261527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261529 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261527 lt!261529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59141 (= lt!261529 (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 (_1!7907 lt!261150)))) ((_ sign_extend 32) (currentByte!8155 (_1!7907 lt!261150))) ((_ sign_extend 32) (currentBit!8150 (_1!7907 lt!261150)))))))

(declare-fun lt!261526 () (_ BitVec 64))

(declare-fun lt!261524 () (_ BitVec 64))

(assert (=> d!59141 (= lt!261527 (bvmul lt!261526 lt!261524))))

(assert (=> d!59141 (or (= lt!261526 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261524 (bvsdiv (bvmul lt!261526 lt!261524) lt!261526)))))

(assert (=> d!59141 (= lt!261524 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59141 (= lt!261526 ((_ sign_extend 32) (size!3858 (buf!4310 (_1!7907 lt!261150)))))))

(assert (=> d!59141 (= lt!261525 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 (_1!7907 lt!261150))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 (_1!7907 lt!261150)))))))

(assert (=> d!59141 (invariant!0 (currentBit!8150 (_1!7907 lt!261150)) (currentByte!8155 (_1!7907 lt!261150)) (size!3858 (buf!4310 (_1!7907 lt!261150))))))

(assert (=> d!59141 (= (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150))) lt!261525)))

(declare-fun b!168113 () Bool)

(declare-fun res!139971 () Bool)

(assert (=> b!168113 (=> (not res!139971) (not e!116692))))

(assert (=> b!168113 (= res!139971 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261525))))

(declare-fun b!168114 () Bool)

(declare-fun lt!261528 () (_ BitVec 64))

(assert (=> b!168114 (= e!116692 (bvsle lt!261525 (bvmul lt!261528 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168114 (or (= lt!261528 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261528 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261528)))))

(assert (=> b!168114 (= lt!261528 ((_ sign_extend 32) (size!3858 (buf!4310 (_1!7907 lt!261150)))))))

(assert (= (and d!59141 res!139972) b!168113))

(assert (= (and b!168113 res!139971) b!168114))

(declare-fun m!267705 () Bool)

(assert (=> d!59141 m!267705))

(declare-fun m!267707 () Bool)

(assert (=> d!59141 m!267707))

(assert (=> b!167971 d!59141))

(assert (=> b!167971 d!58767))

(declare-fun d!59143 () Bool)

(declare-fun res!139973 () Bool)

(declare-fun e!116693 () Bool)

(assert (=> d!59143 (=> res!139973 e!116693)))

(assert (=> d!59143 (= res!139973 (= (_1!7919 lt!261393) (_2!7919 lt!261393)))))

(assert (=> d!59143 (= (arrayRangesEq!687 (buf!4310 thiss!1577) (buf!4310 lt!260871) (_1!7919 lt!261393) (_2!7919 lt!261393)) e!116693)))

(declare-fun b!168115 () Bool)

(declare-fun e!116694 () Bool)

(assert (=> b!168115 (= e!116693 e!116694)))

(declare-fun res!139974 () Bool)

(assert (=> b!168115 (=> (not res!139974) (not e!116694))))

(assert (=> b!168115 (= res!139974 (= (select (arr!4779 (buf!4310 thiss!1577)) (_1!7919 lt!261393)) (select (arr!4779 (buf!4310 lt!260871)) (_1!7919 lt!261393))))))

(declare-fun b!168116 () Bool)

(assert (=> b!168116 (= e!116694 (arrayRangesEq!687 (buf!4310 thiss!1577) (buf!4310 lt!260871) (bvadd (_1!7919 lt!261393) #b00000000000000000000000000000001) (_2!7919 lt!261393)))))

(assert (= (and d!59143 (not res!139973)) b!168115))

(assert (= (and b!168115 res!139974) b!168116))

(declare-fun m!267709 () Bool)

(assert (=> b!168115 m!267709))

(declare-fun m!267711 () Bool)

(assert (=> b!168115 m!267711))

(declare-fun m!267713 () Bool)

(assert (=> b!168116 m!267713))

(assert (=> b!167964 d!59143))

(declare-fun d!59145 () Bool)

(assert (=> d!59145 (= (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 lt!260871))) ((_ sign_extend 32) (currentByte!8155 lt!260871)) ((_ sign_extend 32) (currentBit!8150 lt!260871))) (bvsub (bvmul ((_ sign_extend 32) (size!3858 (buf!4310 lt!260871))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 lt!260871)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 lt!260871)))))))

(assert (=> d!59003 d!59145))

(declare-fun d!59147 () Bool)

(assert (=> d!59147 (= (invariant!0 (currentBit!8150 lt!260871) (currentByte!8155 lt!260871) (size!3858 (buf!4310 lt!260871))) (and (bvsge (currentBit!8150 lt!260871) #b00000000000000000000000000000000) (bvslt (currentBit!8150 lt!260871) #b00000000000000000000000000001000) (bvsge (currentByte!8155 lt!260871) #b00000000000000000000000000000000) (or (bvslt (currentByte!8155 lt!260871) (size!3858 (buf!4310 lt!260871))) (and (= (currentBit!8150 lt!260871) #b00000000000000000000000000000000) (= (currentByte!8155 lt!260871) (size!3858 (buf!4310 lt!260871)))))))))

(assert (=> d!59003 d!59147))

(assert (=> b!167931 d!59119))

(assert (=> b!167931 d!59003))

(declare-fun d!59149 () Bool)

(assert (=> d!59149 (= (arrayBitIndices!0 lt!261160 lt!261156) (tuple4!251 ((_ extract 31 0) (bvadd (bvsdiv lt!261160 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem lt!261160 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!261156 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!261160 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!261156 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!167992 d!59149))

(declare-fun b!168117 () Bool)

(declare-fun e!116696 () Bool)

(declare-fun e!116699 () Bool)

(assert (=> b!168117 (= e!116696 e!116699)))

(declare-fun res!139979 () Bool)

(assert (=> b!168117 (=> (not res!139979) (not e!116699))))

(declare-fun e!116695 () Bool)

(assert (=> b!168117 (= res!139979 e!116695)))

(declare-fun res!139976 () Bool)

(assert (=> b!168117 (=> res!139976 e!116695)))

(declare-fun lt!261531 () tuple4!250)

(assert (=> b!168117 (= res!139976 (bvsge (_1!7919 lt!261531) (_2!7919 lt!261531)))))

(declare-fun lt!261530 () (_ BitVec 32))

(assert (=> b!168117 (= lt!261530 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261532 () (_ BitVec 32))

(assert (=> b!168117 (= lt!261532 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168117 (= lt!261531 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150)))))))

(declare-fun bm!2833 () Bool)

(declare-fun c!8683 () Bool)

(declare-fun call!2836 () Bool)

(assert (=> bm!2833 (= call!2836 (byteRangesEq!0 (select (arr!4779 (buf!4310 (_1!7907 lt!261150))) (_3!601 lt!261531)) (select (arr!4779 (buf!4310 thiss!1577)) (_3!601 lt!261531)) lt!261532 (ite c!8683 lt!261530 #b00000000000000000000000000001000)))))

(declare-fun d!59151 () Bool)

(declare-fun res!139977 () Bool)

(assert (=> d!59151 (=> res!139977 e!116696)))

(assert (=> d!59151 (= res!139977 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150)))))))

(assert (=> d!59151 (= (arrayBitRangesEq!0 (buf!4310 (_1!7907 lt!261150)) (buf!4310 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150)))) e!116696)))

(declare-fun b!168118 () Bool)

(declare-fun res!139975 () Bool)

(assert (=> b!168118 (= res!139975 (= lt!261530 #b00000000000000000000000000000000))))

(declare-fun e!116697 () Bool)

(assert (=> b!168118 (=> res!139975 e!116697)))

(declare-fun e!116700 () Bool)

(assert (=> b!168118 (= e!116700 e!116697)))

(declare-fun b!168119 () Bool)

(assert (=> b!168119 (= e!116695 (arrayRangesEq!687 (buf!4310 (_1!7907 lt!261150)) (buf!4310 thiss!1577) (_1!7919 lt!261531) (_2!7919 lt!261531)))))

(declare-fun b!168120 () Bool)

(declare-fun e!116698 () Bool)

(assert (=> b!168120 (= e!116698 call!2836)))

(declare-fun b!168121 () Bool)

(assert (=> b!168121 (= e!116698 e!116700)))

(declare-fun res!139978 () Bool)

(assert (=> b!168121 (= res!139978 call!2836)))

(assert (=> b!168121 (=> (not res!139978) (not e!116700))))

(declare-fun b!168122 () Bool)

(assert (=> b!168122 (= e!116699 e!116698)))

(assert (=> b!168122 (= c!8683 (= (_3!601 lt!261531) (_4!125 lt!261531)))))

(declare-fun b!168123 () Bool)

(assert (=> b!168123 (= e!116697 (byteRangesEq!0 (select (arr!4779 (buf!4310 (_1!7907 lt!261150))) (_4!125 lt!261531)) (select (arr!4779 (buf!4310 thiss!1577)) (_4!125 lt!261531)) #b00000000000000000000000000000000 lt!261530))))

(assert (= (and d!59151 (not res!139977)) b!168117))

(assert (= (and b!168117 (not res!139976)) b!168119))

(assert (= (and b!168117 res!139979) b!168122))

(assert (= (and b!168122 c!8683) b!168120))

(assert (= (and b!168122 (not c!8683)) b!168121))

(assert (= (and b!168121 res!139978) b!168118))

(assert (= (and b!168118 (not res!139975)) b!168123))

(assert (= (or b!168120 b!168121) bm!2833))

(assert (=> b!168117 m!267385))

(declare-fun m!267715 () Bool)

(assert (=> b!168117 m!267715))

(declare-fun m!267717 () Bool)

(assert (=> bm!2833 m!267717))

(declare-fun m!267719 () Bool)

(assert (=> bm!2833 m!267719))

(assert (=> bm!2833 m!267717))

(assert (=> bm!2833 m!267719))

(declare-fun m!267721 () Bool)

(assert (=> bm!2833 m!267721))

(declare-fun m!267723 () Bool)

(assert (=> b!168119 m!267723))

(declare-fun m!267725 () Bool)

(assert (=> b!168123 m!267725))

(declare-fun m!267727 () Bool)

(assert (=> b!168123 m!267727))

(assert (=> b!168123 m!267725))

(assert (=> b!168123 m!267727))

(declare-fun m!267729 () Bool)

(assert (=> b!168123 m!267729))

(assert (=> b!167973 d!59151))

(assert (=> b!167973 d!59141))

(assert (=> d!59033 d!59035))

(declare-fun d!59153 () Bool)

(assert (=> d!59153 (arrayBitRangesEq!0 (buf!4310 lt!260871) (buf!4310 thiss!1577) lt!261160 lt!261156)))

(assert (=> d!59153 true))

(declare-fun _$19!150 () Unit!11664)

(assert (=> d!59153 (= (choose!8 (buf!4310 thiss!1577) (buf!4310 lt!260871) lt!261160 lt!261156) _$19!150)))

(declare-fun bs!14646 () Bool)

(assert (= bs!14646 d!59153))

(assert (=> bs!14646 m!266985))

(assert (=> d!59033 d!59153))

(declare-fun d!59155 () Bool)

(declare-fun lt!261545 () (_ BitVec 32))

(assert (=> d!59155 (= lt!261545 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261549 () (_ BitVec 32))

(assert (=> d!59155 (= lt!261549 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!116706 () Bool)

(assert (=> d!59155 e!116706))

(declare-fun res!139984 () Bool)

(assert (=> d!59155 (=> (not res!139984) (not e!116706))))

(assert (=> d!59155 (= res!139984 (moveBitIndexPrecond!0 (_1!7907 lt!260878) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11696 () Unit!11664)

(declare-fun Unit!11697 () Unit!11664)

(declare-fun Unit!11698 () Unit!11664)

(assert (=> d!59155 (= (moveBitIndex!0 (_1!7907 lt!260878) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!8150 (_1!7907 lt!260878)) lt!261545) #b00000000000000000000000000000000) (tuple2!14635 Unit!11696 (BitStream!6873 (buf!4310 (_1!7907 lt!260878)) (bvsub (bvadd (currentByte!8155 (_1!7907 lt!260878)) lt!261549) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261545 (currentBit!8150 (_1!7907 lt!260878))))) (ite (bvsge (bvadd (currentBit!8150 (_1!7907 lt!260878)) lt!261545) #b00000000000000000000000000001000) (tuple2!14635 Unit!11697 (BitStream!6873 (buf!4310 (_1!7907 lt!260878)) (bvadd (currentByte!8155 (_1!7907 lt!260878)) lt!261549 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8150 (_1!7907 lt!260878)) lt!261545) #b00000000000000000000000000001000))) (tuple2!14635 Unit!11698 (BitStream!6873 (buf!4310 (_1!7907 lt!260878)) (bvadd (currentByte!8155 (_1!7907 lt!260878)) lt!261549) (bvadd (currentBit!8150 (_1!7907 lt!260878)) lt!261545))))))))

(declare-fun b!168128 () Bool)

(declare-fun e!116705 () Bool)

(assert (=> b!168128 (= e!116706 e!116705)))

(declare-fun res!139985 () Bool)

(assert (=> b!168128 (=> (not res!139985) (not e!116705))))

(declare-fun lt!261550 () tuple2!14634)

(declare-fun lt!261546 () (_ BitVec 64))

(assert (=> b!168128 (= res!139985 (= (bvadd lt!261546 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3858 (buf!4310 (_2!7918 lt!261550))) (currentByte!8155 (_2!7918 lt!261550)) (currentBit!8150 (_2!7918 lt!261550)))))))

(assert (=> b!168128 (or (not (= (bvand lt!261546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261546 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168128 (= lt!261546 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!260878))) (currentByte!8155 (_1!7907 lt!260878)) (currentBit!8150 (_1!7907 lt!260878))))))

(declare-fun lt!261548 () (_ BitVec 32))

(declare-fun lt!261547 () (_ BitVec 32))

(declare-fun Unit!11699 () Unit!11664)

(declare-fun Unit!11700 () Unit!11664)

(declare-fun Unit!11701 () Unit!11664)

(assert (=> b!168128 (= lt!261550 (ite (bvslt (bvadd (currentBit!8150 (_1!7907 lt!260878)) lt!261547) #b00000000000000000000000000000000) (tuple2!14635 Unit!11699 (BitStream!6873 (buf!4310 (_1!7907 lt!260878)) (bvsub (bvadd (currentByte!8155 (_1!7907 lt!260878)) lt!261548) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261547 (currentBit!8150 (_1!7907 lt!260878))))) (ite (bvsge (bvadd (currentBit!8150 (_1!7907 lt!260878)) lt!261547) #b00000000000000000000000000001000) (tuple2!14635 Unit!11700 (BitStream!6873 (buf!4310 (_1!7907 lt!260878)) (bvadd (currentByte!8155 (_1!7907 lt!260878)) lt!261548 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8150 (_1!7907 lt!260878)) lt!261547) #b00000000000000000000000000001000))) (tuple2!14635 Unit!11701 (BitStream!6873 (buf!4310 (_1!7907 lt!260878)) (bvadd (currentByte!8155 (_1!7907 lt!260878)) lt!261548) (bvadd (currentBit!8150 (_1!7907 lt!260878)) lt!261547))))))))

(assert (=> b!168128 (= lt!261547 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168128 (= lt!261548 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168129 () Bool)

(assert (=> b!168129 (= e!116705 (and (= (size!3858 (buf!4310 (_1!7907 lt!260878))) (size!3858 (buf!4310 (_2!7918 lt!261550)))) (= (buf!4310 (_1!7907 lt!260878)) (buf!4310 (_2!7918 lt!261550)))))))

(assert (= (and d!59155 res!139984) b!168128))

(assert (= (and b!168128 res!139985) b!168129))

(declare-fun m!267731 () Bool)

(assert (=> d!59155 m!267731))

(declare-fun m!267733 () Bool)

(assert (=> b!168128 m!267733))

(assert (=> b!168128 m!267441))

(assert (=> b!167982 d!59155))

(declare-fun d!59159 () Bool)

(declare-fun res!139986 () Bool)

(declare-fun e!116707 () Bool)

(assert (=> d!59159 (=> res!139986 e!116707)))

(assert (=> d!59159 (= res!139986 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (=> d!59159 (= (arrayRangesEq!687 (buf!4310 thiss!1577) lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)) e!116707)))

(declare-fun b!168130 () Bool)

(declare-fun e!116708 () Bool)

(assert (=> b!168130 (= e!116707 e!116708)))

(declare-fun res!139987 () Bool)

(assert (=> b!168130 (=> (not res!139987) (not e!116708))))

(assert (=> b!168130 (= res!139987 (= (select (arr!4779 (buf!4310 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4779 lt!260877) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!168131 () Bool)

(assert (=> b!168131 (= e!116708 (arrayRangesEq!687 (buf!4310 thiss!1577) lt!260877 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8155 thiss!1577)))))

(assert (= (and d!59159 (not res!139986)) b!168130))

(assert (= (and b!168130 res!139987) b!168131))

(assert (=> b!168130 m!267675))

(assert (=> b!168130 m!267693))

(declare-fun m!267735 () Bool)

(assert (=> b!168131 m!267735))

(assert (=> b!167986 d!59159))

(declare-fun d!59161 () Bool)

(declare-fun e!116709 () Bool)

(assert (=> d!59161 e!116709))

(declare-fun res!139989 () Bool)

(assert (=> d!59161 (=> (not res!139989) (not e!116709))))

(declare-fun lt!261556 () (_ BitVec 64))

(declare-fun lt!261552 () (_ BitVec 64))

(declare-fun lt!261554 () (_ BitVec 64))

(assert (=> d!59161 (= res!139989 (= lt!261552 (bvsub lt!261554 lt!261556)))))

(assert (=> d!59161 (or (= (bvand lt!261554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261554 lt!261556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59161 (= lt!261556 (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 (_2!7911 lt!261415)))) ((_ sign_extend 32) (currentByte!8155 (_2!7911 lt!261415))) ((_ sign_extend 32) (currentBit!8150 (_2!7911 lt!261415)))))))

(declare-fun lt!261553 () (_ BitVec 64))

(declare-fun lt!261551 () (_ BitVec 64))

(assert (=> d!59161 (= lt!261554 (bvmul lt!261553 lt!261551))))

(assert (=> d!59161 (or (= lt!261553 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261551 (bvsdiv (bvmul lt!261553 lt!261551) lt!261553)))))

(assert (=> d!59161 (= lt!261551 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59161 (= lt!261553 ((_ sign_extend 32) (size!3858 (buf!4310 (_2!7911 lt!261415)))))))

(assert (=> d!59161 (= lt!261552 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 (_2!7911 lt!261415))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 (_2!7911 lt!261415)))))))

(assert (=> d!59161 (invariant!0 (currentBit!8150 (_2!7911 lt!261415)) (currentByte!8155 (_2!7911 lt!261415)) (size!3858 (buf!4310 (_2!7911 lt!261415))))))

(assert (=> d!59161 (= (bitIndex!0 (size!3858 (buf!4310 (_2!7911 lt!261415))) (currentByte!8155 (_2!7911 lt!261415)) (currentBit!8150 (_2!7911 lt!261415))) lt!261552)))

(declare-fun b!168132 () Bool)

(declare-fun res!139988 () Bool)

(assert (=> b!168132 (=> (not res!139988) (not e!116709))))

(assert (=> b!168132 (= res!139988 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261552))))

(declare-fun b!168133 () Bool)

(declare-fun lt!261555 () (_ BitVec 64))

(assert (=> b!168133 (= e!116709 (bvsle lt!261552 (bvmul lt!261555 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168133 (or (= lt!261555 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261555 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261555)))))

(assert (=> b!168133 (= lt!261555 ((_ sign_extend 32) (size!3858 (buf!4310 (_2!7911 lt!261415)))))))

(assert (= (and d!59161 res!139989) b!168132))

(assert (= (and b!168132 res!139988) b!168133))

(declare-fun m!267737 () Bool)

(assert (=> d!59161 m!267737))

(declare-fun m!267739 () Bool)

(assert (=> d!59161 m!267739))

(assert (=> b!167984 d!59161))

(declare-fun d!59163 () Bool)

(declare-fun e!116710 () Bool)

(assert (=> d!59163 e!116710))

(declare-fun res!139991 () Bool)

(assert (=> d!59163 (=> (not res!139991) (not e!116710))))

(declare-fun lt!261558 () (_ BitVec 64))

(declare-fun lt!261560 () (_ BitVec 64))

(declare-fun lt!261562 () (_ BitVec 64))

(assert (=> d!59163 (= res!139991 (= lt!261558 (bvsub lt!261560 lt!261562)))))

(assert (=> d!59163 (or (= (bvand lt!261560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261562 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261560 lt!261562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59163 (= lt!261562 (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 (_1!7907 lt!260878)))) ((_ sign_extend 32) (currentByte!8155 (_1!7907 lt!260878))) ((_ sign_extend 32) (currentBit!8150 (_1!7907 lt!260878)))))))

(declare-fun lt!261559 () (_ BitVec 64))

(declare-fun lt!261557 () (_ BitVec 64))

(assert (=> d!59163 (= lt!261560 (bvmul lt!261559 lt!261557))))

(assert (=> d!59163 (or (= lt!261559 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261557 (bvsdiv (bvmul lt!261559 lt!261557) lt!261559)))))

(assert (=> d!59163 (= lt!261557 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59163 (= lt!261559 ((_ sign_extend 32) (size!3858 (buf!4310 (_1!7907 lt!260878)))))))

(assert (=> d!59163 (= lt!261558 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 (_1!7907 lt!260878))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 (_1!7907 lt!260878)))))))

(assert (=> d!59163 (invariant!0 (currentBit!8150 (_1!7907 lt!260878)) (currentByte!8155 (_1!7907 lt!260878)) (size!3858 (buf!4310 (_1!7907 lt!260878))))))

(assert (=> d!59163 (= (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!260878))) (currentByte!8155 (_1!7907 lt!260878)) (currentBit!8150 (_1!7907 lt!260878))) lt!261558)))

(declare-fun b!168134 () Bool)

(declare-fun res!139990 () Bool)

(assert (=> b!168134 (=> (not res!139990) (not e!116710))))

(assert (=> b!168134 (= res!139990 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261558))))

(declare-fun b!168135 () Bool)

(declare-fun lt!261561 () (_ BitVec 64))

(assert (=> b!168135 (= e!116710 (bvsle lt!261558 (bvmul lt!261561 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168135 (or (= lt!261561 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261561 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261561)))))

(assert (=> b!168135 (= lt!261561 ((_ sign_extend 32) (size!3858 (buf!4310 (_1!7907 lt!260878)))))))

(assert (= (and d!59163 res!139991) b!168134))

(assert (= (and b!168134 res!139990) b!168135))

(declare-fun m!267741 () Bool)

(assert (=> d!59163 m!267741))

(declare-fun m!267743 () Bool)

(assert (=> d!59163 m!267743))

(assert (=> b!167984 d!59163))

(declare-fun d!59165 () Bool)

(declare-fun e!116711 () Bool)

(assert (=> d!59165 e!116711))

(declare-fun res!139993 () Bool)

(assert (=> d!59165 (=> (not res!139993) (not e!116711))))

(declare-fun lt!261566 () (_ BitVec 64))

(declare-fun lt!261564 () (_ BitVec 64))

(declare-fun lt!261568 () (_ BitVec 64))

(assert (=> d!59165 (= res!139993 (= lt!261564 (bvsub lt!261566 lt!261568)))))

(assert (=> d!59165 (or (= (bvand lt!261566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261568 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261566 lt!261568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59165 (= lt!261568 (remainingBits!0 ((_ sign_extend 32) (size!3858 (buf!4310 lt!261378))) ((_ sign_extend 32) (currentByte!8155 lt!261378)) ((_ sign_extend 32) (currentBit!8150 lt!261378))))))

(declare-fun lt!261565 () (_ BitVec 64))

(declare-fun lt!261563 () (_ BitVec 64))

(assert (=> d!59165 (= lt!261566 (bvmul lt!261565 lt!261563))))

(assert (=> d!59165 (or (= lt!261565 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261563 (bvsdiv (bvmul lt!261565 lt!261563) lt!261565)))))

(assert (=> d!59165 (= lt!261563 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59165 (= lt!261565 ((_ sign_extend 32) (size!3858 (buf!4310 lt!261378))))))

(assert (=> d!59165 (= lt!261564 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8155 lt!261378)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8150 lt!261378))))))

(assert (=> d!59165 (invariant!0 (currentBit!8150 lt!261378) (currentByte!8155 lt!261378) (size!3858 (buf!4310 lt!261378)))))

(assert (=> d!59165 (= (bitIndex!0 (size!3858 (buf!4310 lt!261378)) (currentByte!8155 lt!261378) (currentBit!8150 lt!261378)) lt!261564)))

(declare-fun b!168136 () Bool)

(declare-fun res!139992 () Bool)

(assert (=> b!168136 (=> (not res!139992) (not e!116711))))

(assert (=> b!168136 (= res!139992 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261564))))

(declare-fun b!168137 () Bool)

(declare-fun lt!261567 () (_ BitVec 64))

(assert (=> b!168137 (= e!116711 (bvsle lt!261564 (bvmul lt!261567 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168137 (or (= lt!261567 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261567 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261567)))))

(assert (=> b!168137 (= lt!261567 ((_ sign_extend 32) (size!3858 (buf!4310 lt!261378))))))

(assert (= (and d!59165 res!139993) b!168136))

(assert (= (and b!168136 res!139992) b!168137))

(declare-fun m!267745 () Bool)

(assert (=> d!59165 m!267745))

(declare-fun m!267747 () Bool)

(assert (=> d!59165 m!267747))

(assert (=> d!59001 d!59165))

(assert (=> d!59001 d!59133))

(declare-fun d!59167 () Bool)

(declare-fun lt!261569 () (_ BitVec 32))

(assert (=> d!59167 (= lt!261569 ((_ extract 31 0) (bvsrem (bvsub lt!261165 lt!261161) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261573 () (_ BitVec 32))

(assert (=> d!59167 (= lt!261573 ((_ extract 31 0) (bvsdiv (bvsub lt!261165 lt!261161) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!116713 () Bool)

(assert (=> d!59167 e!116713))

(declare-fun res!139994 () Bool)

(assert (=> d!59167 (=> (not res!139994) (not e!116713))))

(assert (=> d!59167 (= res!139994 (moveBitIndexPrecond!0 (_2!7907 lt!261150) (bvsub lt!261165 lt!261161)))))

(declare-fun Unit!11702 () Unit!11664)

(declare-fun Unit!11703 () Unit!11664)

(declare-fun Unit!11704 () Unit!11664)

(assert (=> d!59167 (= (moveBitIndex!0 (_2!7907 lt!261150) (bvsub lt!261165 lt!261161)) (ite (bvslt (bvadd (currentBit!8150 (_2!7907 lt!261150)) lt!261569) #b00000000000000000000000000000000) (tuple2!14635 Unit!11702 (BitStream!6873 (buf!4310 (_2!7907 lt!261150)) (bvsub (bvadd (currentByte!8155 (_2!7907 lt!261150)) lt!261573) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261569 (currentBit!8150 (_2!7907 lt!261150))))) (ite (bvsge (bvadd (currentBit!8150 (_2!7907 lt!261150)) lt!261569) #b00000000000000000000000000001000) (tuple2!14635 Unit!11703 (BitStream!6873 (buf!4310 (_2!7907 lt!261150)) (bvadd (currentByte!8155 (_2!7907 lt!261150)) lt!261573 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8150 (_2!7907 lt!261150)) lt!261569) #b00000000000000000000000000001000))) (tuple2!14635 Unit!11704 (BitStream!6873 (buf!4310 (_2!7907 lt!261150)) (bvadd (currentByte!8155 (_2!7907 lt!261150)) lt!261573) (bvadd (currentBit!8150 (_2!7907 lt!261150)) lt!261569))))))))

(declare-fun b!168138 () Bool)

(declare-fun e!116712 () Bool)

(assert (=> b!168138 (= e!116713 e!116712)))

(declare-fun res!139995 () Bool)

(assert (=> b!168138 (=> (not res!139995) (not e!116712))))

(declare-fun lt!261574 () tuple2!14634)

(declare-fun lt!261570 () (_ BitVec 64))

(assert (=> b!168138 (= res!139995 (= (bvadd lt!261570 (bvsub lt!261165 lt!261161)) (bitIndex!0 (size!3858 (buf!4310 (_2!7918 lt!261574))) (currentByte!8155 (_2!7918 lt!261574)) (currentBit!8150 (_2!7918 lt!261574)))))))

(assert (=> b!168138 (or (not (= (bvand lt!261570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261165 lt!261161) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261570 (bvsub lt!261165 lt!261161)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168138 (= lt!261570 (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150))))))

(declare-fun lt!261572 () (_ BitVec 32))

(declare-fun lt!261571 () (_ BitVec 32))

(declare-fun Unit!11705 () Unit!11664)

(declare-fun Unit!11706 () Unit!11664)

(declare-fun Unit!11707 () Unit!11664)

(assert (=> b!168138 (= lt!261574 (ite (bvslt (bvadd (currentBit!8150 (_2!7907 lt!261150)) lt!261571) #b00000000000000000000000000000000) (tuple2!14635 Unit!11705 (BitStream!6873 (buf!4310 (_2!7907 lt!261150)) (bvsub (bvadd (currentByte!8155 (_2!7907 lt!261150)) lt!261572) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261571 (currentBit!8150 (_2!7907 lt!261150))))) (ite (bvsge (bvadd (currentBit!8150 (_2!7907 lt!261150)) lt!261571) #b00000000000000000000000000001000) (tuple2!14635 Unit!11706 (BitStream!6873 (buf!4310 (_2!7907 lt!261150)) (bvadd (currentByte!8155 (_2!7907 lt!261150)) lt!261572 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8150 (_2!7907 lt!261150)) lt!261571) #b00000000000000000000000000001000))) (tuple2!14635 Unit!11707 (BitStream!6873 (buf!4310 (_2!7907 lt!261150)) (bvadd (currentByte!8155 (_2!7907 lt!261150)) lt!261572) (bvadd (currentBit!8150 (_2!7907 lt!261150)) lt!261571))))))))

(assert (=> b!168138 (= lt!261571 ((_ extract 31 0) (bvsrem (bvsub lt!261165 lt!261161) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168138 (= lt!261572 ((_ extract 31 0) (bvsdiv (bvsub lt!261165 lt!261161) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168139 () Bool)

(assert (=> b!168139 (= e!116712 (and (= (size!3858 (buf!4310 (_2!7907 lt!261150))) (size!3858 (buf!4310 (_2!7918 lt!261574)))) (= (buf!4310 (_2!7907 lt!261150)) (buf!4310 (_2!7918 lt!261574)))))))

(assert (= (and d!59167 res!139994) b!168138))

(assert (= (and b!168138 res!139995) b!168139))

(assert (=> d!59167 m!267399))

(declare-fun m!267749 () Bool)

(assert (=> b!168138 m!267749))

(assert (=> b!168138 m!267387))

(assert (=> d!59001 d!59167))

(declare-fun d!59169 () Bool)

(declare-fun res!139998 () Bool)

(declare-fun e!116716 () Bool)

(assert (=> d!59169 (=> (not res!139998) (not e!116716))))

(assert (=> d!59169 (= res!139998 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3858 (buf!4310 (_2!7907 lt!261150))))) (bvsub lt!261165 lt!261161)) (bvsle (bvsub lt!261165 lt!261161) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3858 (buf!4310 (_2!7907 lt!261150))))))))))

(assert (=> d!59169 (= (moveBitIndexPrecond!0 (_2!7907 lt!261150) (bvsub lt!261165 lt!261161)) e!116716)))

(declare-fun b!168143 () Bool)

(declare-fun lt!261577 () (_ BitVec 64))

(assert (=> b!168143 (= e!116716 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261577) (bvsle lt!261577 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3858 (buf!4310 (_2!7907 lt!261150))))))))))

(assert (=> b!168143 (= lt!261577 (bvadd (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150))) (bvsub lt!261165 lt!261161)))))

(assert (= (and d!59169 res!139998) b!168143))

(assert (=> b!168143 m!267387))

(assert (=> d!59001 d!59169))

(assert (=> d!58993 d!58985))

(declare-fun d!59171 () Bool)

(assert (=> d!59171 (isPrefixOf!0 lt!261162 lt!260871)))

(assert (=> d!59171 true))

(declare-fun _$15!284 () Unit!11664)

(assert (=> d!59171 (= (choose!30 lt!261162 thiss!1577 lt!260871) _$15!284)))

(declare-fun bs!14647 () Bool)

(assert (= bs!14647 d!59171))

(assert (=> bs!14647 m!266963))

(assert (=> d!58993 d!59171))

(declare-fun d!59173 () Bool)

(declare-fun res!139999 () Bool)

(declare-fun e!116717 () Bool)

(assert (=> d!59173 (=> (not res!139999) (not e!116717))))

(assert (=> d!59173 (= res!139999 (= (size!3858 (buf!4310 lt!261162)) (size!3858 (buf!4310 thiss!1577))))))

(assert (=> d!59173 (= (isPrefixOf!0 lt!261162 thiss!1577) e!116717)))

(declare-fun b!168144 () Bool)

(declare-fun res!140000 () Bool)

(assert (=> b!168144 (=> (not res!140000) (not e!116717))))

(assert (=> b!168144 (= res!140000 (bvsle (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162)) (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))))))

(declare-fun b!168145 () Bool)

(declare-fun e!116718 () Bool)

(assert (=> b!168145 (= e!116717 e!116718)))

(declare-fun res!140001 () Bool)

(assert (=> b!168145 (=> res!140001 e!116718)))

(assert (=> b!168145 (= res!140001 (= (size!3858 (buf!4310 lt!261162)) #b00000000000000000000000000000000))))

(declare-fun b!168146 () Bool)

(assert (=> b!168146 (= e!116718 (arrayBitRangesEq!0 (buf!4310 lt!261162) (buf!4310 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!261162)) (currentByte!8155 lt!261162) (currentBit!8150 lt!261162))))))

(assert (= (and d!59173 res!139999) b!168144))

(assert (= (and b!168144 res!140000) b!168145))

(assert (= (and b!168145 (not res!140001)) b!168146))

(assert (=> b!168144 m!267371))

(assert (=> b!168144 m!266735))

(assert (=> b!168146 m!267371))

(assert (=> b!168146 m!267371))

(declare-fun m!267751 () Bool)

(assert (=> b!168146 m!267751))

(assert (=> d!58993 d!59173))

(declare-fun d!59175 () Bool)

(assert (=> d!59175 (= (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261420)) (select (arr!4779 (buf!4310 thiss!1577)) (_4!125 lt!261420)) #b00000000000000000000000000000000 lt!261419) (or (= #b00000000000000000000000000000000 lt!261419) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261420))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261419))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4779 (buf!4310 thiss!1577)) (_4!125 lt!261420))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261419))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14648 () Bool)

(assert (= bs!14648 d!59175))

(declare-fun m!267753 () Bool)

(assert (=> bs!14648 m!267753))

(assert (=> bs!14648 m!266851))

(assert (=> b!167998 d!59175))

(assert (=> b!167937 d!59141))

(assert (=> b!167937 d!59133))

(declare-fun b!168147 () Bool)

(declare-fun e!116720 () Bool)

(declare-fun e!116723 () Bool)

(assert (=> b!168147 (= e!116720 e!116723)))

(declare-fun res!140006 () Bool)

(assert (=> b!168147 (=> (not res!140006) (not e!116723))))

(declare-fun e!116719 () Bool)

(assert (=> b!168147 (= res!140006 e!116719)))

(declare-fun res!140003 () Bool)

(assert (=> b!168147 (=> res!140003 e!116719)))

(declare-fun lt!261579 () tuple4!250)

(assert (=> b!168147 (= res!140003 (bvsge (_1!7919 lt!261579) (_2!7919 lt!261579)))))

(declare-fun lt!261578 () (_ BitVec 32))

(assert (=> b!168147 (= lt!261578 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261580 () (_ BitVec 32))

(assert (=> b!168147 (= lt!261580 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168147 (= lt!261579 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150)))))))

(declare-fun c!8684 () Bool)

(declare-fun bm!2834 () Bool)

(declare-fun call!2837 () Bool)

(assert (=> bm!2834 (= call!2837 (byteRangesEq!0 (select (arr!4779 (buf!4310 (_2!7907 lt!261150))) (_3!601 lt!261579)) (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261579)) lt!261580 (ite c!8684 lt!261578 #b00000000000000000000000000001000)))))

(declare-fun d!59177 () Bool)

(declare-fun res!140004 () Bool)

(assert (=> d!59177 (=> res!140004 e!116720)))

(assert (=> d!59177 (= res!140004 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150)))))))

(assert (=> d!59177 (= (arrayBitRangesEq!0 (buf!4310 (_2!7907 lt!261150)) (buf!4310 lt!260871) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_2!7907 lt!261150))) (currentByte!8155 (_2!7907 lt!261150)) (currentBit!8150 (_2!7907 lt!261150)))) e!116720)))

(declare-fun b!168148 () Bool)

(declare-fun res!140002 () Bool)

(assert (=> b!168148 (= res!140002 (= lt!261578 #b00000000000000000000000000000000))))

(declare-fun e!116721 () Bool)

(assert (=> b!168148 (=> res!140002 e!116721)))

(declare-fun e!116724 () Bool)

(assert (=> b!168148 (= e!116724 e!116721)))

(declare-fun b!168149 () Bool)

(assert (=> b!168149 (= e!116719 (arrayRangesEq!687 (buf!4310 (_2!7907 lt!261150)) (buf!4310 lt!260871) (_1!7919 lt!261579) (_2!7919 lt!261579)))))

(declare-fun b!168150 () Bool)

(declare-fun e!116722 () Bool)

(assert (=> b!168150 (= e!116722 call!2837)))

(declare-fun b!168151 () Bool)

(assert (=> b!168151 (= e!116722 e!116724)))

(declare-fun res!140005 () Bool)

(assert (=> b!168151 (= res!140005 call!2837)))

(assert (=> b!168151 (=> (not res!140005) (not e!116724))))

(declare-fun b!168152 () Bool)

(assert (=> b!168152 (= e!116723 e!116722)))

(assert (=> b!168152 (= c!8684 (= (_3!601 lt!261579) (_4!125 lt!261579)))))

(declare-fun b!168153 () Bool)

(assert (=> b!168153 (= e!116721 (byteRangesEq!0 (select (arr!4779 (buf!4310 (_2!7907 lt!261150))) (_4!125 lt!261579)) (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261579)) #b00000000000000000000000000000000 lt!261578))))

(assert (= (and d!59177 (not res!140004)) b!168147))

(assert (= (and b!168147 (not res!140003)) b!168149))

(assert (= (and b!168147 res!140006) b!168152))

(assert (= (and b!168152 c!8684) b!168150))

(assert (= (and b!168152 (not c!8684)) b!168151))

(assert (= (and b!168151 res!140005) b!168148))

(assert (= (and b!168148 (not res!140002)) b!168153))

(assert (= (or b!168150 b!168151) bm!2834))

(assert (=> b!168147 m!267387))

(declare-fun m!267755 () Bool)

(assert (=> b!168147 m!267755))

(declare-fun m!267757 () Bool)

(assert (=> bm!2834 m!267757))

(declare-fun m!267759 () Bool)

(assert (=> bm!2834 m!267759))

(assert (=> bm!2834 m!267757))

(assert (=> bm!2834 m!267759))

(declare-fun m!267761 () Bool)

(assert (=> bm!2834 m!267761))

(declare-fun m!267763 () Bool)

(assert (=> b!168149 m!267763))

(declare-fun m!267765 () Bool)

(assert (=> b!168153 m!267765))

(declare-fun m!267767 () Bool)

(assert (=> b!168153 m!267767))

(assert (=> b!168153 m!267765))

(assert (=> b!168153 m!267767))

(declare-fun m!267769 () Bool)

(assert (=> b!168153 m!267769))

(assert (=> b!167991 d!59177))

(assert (=> b!167991 d!59133))

(assert (=> d!58987 d!58983))

(declare-fun d!59179 () Bool)

(assert (=> d!59179 (isPrefixOf!0 lt!260871 lt!260871)))

(assert (=> d!59179 true))

(declare-fun _$14!318 () Unit!11664)

(assert (=> d!59179 (= (choose!11 lt!260871) _$14!318)))

(declare-fun bs!14649 () Bool)

(assert (= bs!14649 d!59179))

(assert (=> bs!14649 m!266977))

(assert (=> d!58987 d!59179))

(assert (=> d!58999 d!58991))

(declare-fun d!59181 () Bool)

(assert (=> d!59181 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!59181 true))

(declare-fun _$14!319 () Unit!11664)

(assert (=> d!59181 (= (choose!11 thiss!1577) _$14!319)))

(declare-fun bs!14650 () Bool)

(assert (= bs!14650 d!59181))

(assert (=> bs!14650 m!266965))

(assert (=> d!58999 d!59181))

(assert (=> b!167934 d!58767))

(assert (=> b!167928 d!59003))

(assert (=> d!59029 d!58755))

(declare-fun b!168154 () Bool)

(declare-fun e!116726 () Bool)

(declare-fun e!116729 () Bool)

(assert (=> b!168154 (= e!116726 e!116729)))

(declare-fun res!140011 () Bool)

(assert (=> b!168154 (=> (not res!140011) (not e!116729))))

(declare-fun e!116725 () Bool)

(assert (=> b!168154 (= res!140011 e!116725)))

(declare-fun res!140008 () Bool)

(assert (=> b!168154 (=> res!140008 e!116725)))

(declare-fun lt!261582 () tuple4!250)

(assert (=> b!168154 (= res!140008 (bvsge (_1!7919 lt!261582) (_2!7919 lt!261582)))))

(declare-fun lt!261581 () (_ BitVec 32))

(assert (=> b!168154 (= lt!261581 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261583 () (_ BitVec 32))

(assert (=> b!168154 (= lt!261583 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168154 (= lt!261582 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150)))))))

(declare-fun bm!2835 () Bool)

(declare-fun call!2838 () Bool)

(declare-fun c!8685 () Bool)

(assert (=> bm!2835 (= call!2838 (byteRangesEq!0 (select (arr!4779 (buf!4310 (_1!7907 lt!261150))) (_3!601 lt!261582)) (select (arr!4779 (buf!4310 (_2!7907 lt!261150))) (_3!601 lt!261582)) lt!261583 (ite c!8685 lt!261581 #b00000000000000000000000000001000)))))

(declare-fun d!59183 () Bool)

(declare-fun res!140009 () Bool)

(assert (=> d!59183 (=> res!140009 e!116726)))

(assert (=> d!59183 (= res!140009 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150)))))))

(assert (=> d!59183 (= (arrayBitRangesEq!0 (buf!4310 (_1!7907 lt!261150)) (buf!4310 (_2!7907 lt!261150)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 (_1!7907 lt!261150))) (currentByte!8155 (_1!7907 lt!261150)) (currentBit!8150 (_1!7907 lt!261150)))) e!116726)))

(declare-fun b!168155 () Bool)

(declare-fun res!140007 () Bool)

(assert (=> b!168155 (= res!140007 (= lt!261581 #b00000000000000000000000000000000))))

(declare-fun e!116727 () Bool)

(assert (=> b!168155 (=> res!140007 e!116727)))

(declare-fun e!116730 () Bool)

(assert (=> b!168155 (= e!116730 e!116727)))

(declare-fun b!168156 () Bool)

(assert (=> b!168156 (= e!116725 (arrayRangesEq!687 (buf!4310 (_1!7907 lt!261150)) (buf!4310 (_2!7907 lt!261150)) (_1!7919 lt!261582) (_2!7919 lt!261582)))))

(declare-fun b!168157 () Bool)

(declare-fun e!116728 () Bool)

(assert (=> b!168157 (= e!116728 call!2838)))

(declare-fun b!168158 () Bool)

(assert (=> b!168158 (= e!116728 e!116730)))

(declare-fun res!140010 () Bool)

(assert (=> b!168158 (= res!140010 call!2838)))

(assert (=> b!168158 (=> (not res!140010) (not e!116730))))

(declare-fun b!168159 () Bool)

(assert (=> b!168159 (= e!116729 e!116728)))

(assert (=> b!168159 (= c!8685 (= (_3!601 lt!261582) (_4!125 lt!261582)))))

(declare-fun b!168160 () Bool)

(assert (=> b!168160 (= e!116727 (byteRangesEq!0 (select (arr!4779 (buf!4310 (_1!7907 lt!261150))) (_4!125 lt!261582)) (select (arr!4779 (buf!4310 (_2!7907 lt!261150))) (_4!125 lt!261582)) #b00000000000000000000000000000000 lt!261581))))

(assert (= (and d!59183 (not res!140009)) b!168154))

(assert (= (and b!168154 (not res!140008)) b!168156))

(assert (= (and b!168154 res!140011) b!168159))

(assert (= (and b!168159 c!8685) b!168157))

(assert (= (and b!168159 (not c!8685)) b!168158))

(assert (= (and b!168158 res!140010) b!168155))

(assert (= (and b!168155 (not res!140007)) b!168160))

(assert (= (or b!168157 b!168158) bm!2835))

(assert (=> b!168154 m!267385))

(assert (=> b!168154 m!267715))

(declare-fun m!267771 () Bool)

(assert (=> bm!2835 m!267771))

(declare-fun m!267773 () Bool)

(assert (=> bm!2835 m!267773))

(assert (=> bm!2835 m!267771))

(assert (=> bm!2835 m!267773))

(declare-fun m!267775 () Bool)

(assert (=> bm!2835 m!267775))

(declare-fun m!267777 () Bool)

(assert (=> b!168156 m!267777))

(declare-fun m!267779 () Bool)

(assert (=> b!168160 m!267779))

(declare-fun m!267781 () Bool)

(assert (=> b!168160 m!267781))

(assert (=> b!168160 m!267779))

(assert (=> b!168160 m!267781))

(declare-fun m!267783 () Bool)

(assert (=> b!168160 m!267783))

(assert (=> b!167939 d!59183))

(assert (=> b!167939 d!59141))

(declare-fun b!168161 () Bool)

(declare-fun e!116732 () Bool)

(declare-fun e!116735 () Bool)

(assert (=> b!168161 (= e!116732 e!116735)))

(declare-fun res!140016 () Bool)

(assert (=> b!168161 (=> (not res!140016) (not e!116735))))

(declare-fun e!116731 () Bool)

(assert (=> b!168161 (= res!140016 e!116731)))

(declare-fun res!140013 () Bool)

(assert (=> b!168161 (=> res!140013 e!116731)))

(declare-fun lt!261585 () tuple4!250)

(assert (=> b!168161 (= res!140013 (bvsge (_1!7919 lt!261585) (_2!7919 lt!261585)))))

(declare-fun lt!261584 () (_ BitVec 32))

(assert (=> b!168161 (= lt!261584 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261586 () (_ BitVec 32))

(assert (=> b!168161 (= lt!261586 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168161 (= lt!261585 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))))))

(declare-fun c!8686 () Bool)

(declare-fun bm!2836 () Bool)

(declare-fun call!2839 () Bool)

(assert (=> bm!2836 (= call!2839 (byteRangesEq!0 (select (arr!4779 (buf!4310 thiss!1577)) (_3!601 lt!261585)) (select (arr!4779 (buf!4310 thiss!1577)) (_3!601 lt!261585)) lt!261586 (ite c!8686 lt!261584 #b00000000000000000000000000001000)))))

(declare-fun d!59185 () Bool)

(declare-fun res!140014 () Bool)

(assert (=> d!59185 (=> res!140014 e!116732)))

(assert (=> d!59185 (= res!140014 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))))))

(assert (=> d!59185 (= (arrayBitRangesEq!0 (buf!4310 thiss!1577) (buf!4310 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 thiss!1577)) (currentByte!8155 thiss!1577) (currentBit!8150 thiss!1577))) e!116732)))

(declare-fun b!168162 () Bool)

(declare-fun res!140012 () Bool)

(assert (=> b!168162 (= res!140012 (= lt!261584 #b00000000000000000000000000000000))))

(declare-fun e!116733 () Bool)

(assert (=> b!168162 (=> res!140012 e!116733)))

(declare-fun e!116736 () Bool)

(assert (=> b!168162 (= e!116736 e!116733)))

(declare-fun b!168163 () Bool)

(assert (=> b!168163 (= e!116731 (arrayRangesEq!687 (buf!4310 thiss!1577) (buf!4310 thiss!1577) (_1!7919 lt!261585) (_2!7919 lt!261585)))))

(declare-fun b!168164 () Bool)

(declare-fun e!116734 () Bool)

(assert (=> b!168164 (= e!116734 call!2839)))

(declare-fun b!168165 () Bool)

(assert (=> b!168165 (= e!116734 e!116736)))

(declare-fun res!140015 () Bool)

(assert (=> b!168165 (= res!140015 call!2839)))

(assert (=> b!168165 (=> (not res!140015) (not e!116736))))

(declare-fun b!168166 () Bool)

(assert (=> b!168166 (= e!116735 e!116734)))

(assert (=> b!168166 (= c!8686 (= (_3!601 lt!261585) (_4!125 lt!261585)))))

(declare-fun b!168167 () Bool)

(assert (=> b!168167 (= e!116733 (byteRangesEq!0 (select (arr!4779 (buf!4310 thiss!1577)) (_4!125 lt!261585)) (select (arr!4779 (buf!4310 thiss!1577)) (_4!125 lt!261585)) #b00000000000000000000000000000000 lt!261584))))

(assert (= (and d!59185 (not res!140014)) b!168161))

(assert (= (and b!168161 (not res!140013)) b!168163))

(assert (= (and b!168161 res!140016) b!168166))

(assert (= (and b!168166 c!8686) b!168164))

(assert (= (and b!168166 (not c!8686)) b!168165))

(assert (= (and b!168165 res!140015) b!168162))

(assert (= (and b!168162 (not res!140012)) b!168167))

(assert (= (or b!168164 b!168165) bm!2836))

(assert (=> b!168161 m!266735))

(assert (=> b!168161 m!267405))

(declare-fun m!267785 () Bool)

(assert (=> bm!2836 m!267785))

(assert (=> bm!2836 m!267785))

(assert (=> bm!2836 m!267785))

(assert (=> bm!2836 m!267785))

(declare-fun m!267787 () Bool)

(assert (=> bm!2836 m!267787))

(declare-fun m!267789 () Bool)

(assert (=> b!168163 m!267789))

(declare-fun m!267791 () Bool)

(assert (=> b!168167 m!267791))

(assert (=> b!168167 m!267791))

(assert (=> b!168167 m!267791))

(assert (=> b!168167 m!267791))

(declare-fun m!267793 () Bool)

(assert (=> b!168167 m!267793))

(assert (=> b!167936 d!59185))

(assert (=> b!167936 d!58767))

(assert (=> d!58981 d!58985))

(declare-fun d!59187 () Bool)

(assert (=> d!59187 (isPrefixOf!0 lt!261162 lt!260871)))

(assert (=> d!59187 true))

(declare-fun _$15!285 () Unit!11664)

(assert (=> d!59187 (= (choose!30 lt!261162 lt!260871 lt!260871) _$15!285)))

(declare-fun bs!14651 () Bool)

(assert (= bs!14651 d!59187))

(assert (=> bs!14651 m!266963))

(assert (=> d!58981 d!59187))

(declare-fun b!168168 () Bool)

(declare-fun e!116738 () Bool)

(declare-fun e!116741 () Bool)

(assert (=> b!168168 (= e!116738 e!116741)))

(declare-fun res!140021 () Bool)

(assert (=> b!168168 (=> (not res!140021) (not e!116741))))

(declare-fun e!116737 () Bool)

(assert (=> b!168168 (= res!140021 e!116737)))

(declare-fun res!140018 () Bool)

(assert (=> b!168168 (=> res!140018 e!116737)))

(declare-fun lt!261588 () tuple4!250)

(assert (=> b!168168 (= res!140018 (bvsge (_1!7919 lt!261588) (_2!7919 lt!261588)))))

(declare-fun lt!261587 () (_ BitVec 32))

(assert (=> b!168168 (= lt!261587 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261589 () (_ BitVec 32))

(assert (=> b!168168 (= lt!261589 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168168 (= lt!261588 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871))))))

(declare-fun bm!2837 () Bool)

(declare-fun c!8687 () Bool)

(declare-fun call!2840 () Bool)

(assert (=> bm!2837 (= call!2840 (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261588)) (select (arr!4779 (buf!4310 lt!260871)) (_3!601 lt!261588)) lt!261589 (ite c!8687 lt!261587 #b00000000000000000000000000001000)))))

(declare-fun d!59189 () Bool)

(declare-fun res!140019 () Bool)

(assert (=> d!59189 (=> res!140019 e!116738)))

(assert (=> d!59189 (= res!140019 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871))))))

(assert (=> d!59189 (= (arrayBitRangesEq!0 (buf!4310 lt!260871) (buf!4310 lt!260871) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3858 (buf!4310 lt!260871)) (currentByte!8155 lt!260871) (currentBit!8150 lt!260871))) e!116738)))

(declare-fun b!168169 () Bool)

(declare-fun res!140017 () Bool)

(assert (=> b!168169 (= res!140017 (= lt!261587 #b00000000000000000000000000000000))))

(declare-fun e!116739 () Bool)

(assert (=> b!168169 (=> res!140017 e!116739)))

(declare-fun e!116742 () Bool)

(assert (=> b!168169 (= e!116742 e!116739)))

(declare-fun b!168170 () Bool)

(assert (=> b!168170 (= e!116737 (arrayRangesEq!687 (buf!4310 lt!260871) (buf!4310 lt!260871) (_1!7919 lt!261588) (_2!7919 lt!261588)))))

(declare-fun b!168171 () Bool)

(declare-fun e!116740 () Bool)

(assert (=> b!168171 (= e!116740 call!2840)))

(declare-fun b!168172 () Bool)

(assert (=> b!168172 (= e!116740 e!116742)))

(declare-fun res!140020 () Bool)

(assert (=> b!168172 (= res!140020 call!2840)))

(assert (=> b!168172 (=> (not res!140020) (not e!116742))))

(declare-fun b!168173 () Bool)

(assert (=> b!168173 (= e!116741 e!116740)))

(assert (=> b!168173 (= c!8687 (= (_3!601 lt!261588) (_4!125 lt!261588)))))

(declare-fun b!168174 () Bool)

(assert (=> b!168174 (= e!116739 (byteRangesEq!0 (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261588)) (select (arr!4779 (buf!4310 lt!260871)) (_4!125 lt!261588)) #b00000000000000000000000000000000 lt!261587))))

(assert (= (and d!59189 (not res!140019)) b!168168))

(assert (= (and b!168168 (not res!140018)) b!168170))

(assert (= (and b!168168 res!140021) b!168173))

(assert (= (and b!168173 c!8687) b!168171))

(assert (= (and b!168173 (not c!8687)) b!168172))

(assert (= (and b!168172 res!140020) b!168169))

(assert (= (and b!168169 (not res!140017)) b!168174))

(assert (= (or b!168171 b!168172) bm!2837))

(assert (=> b!168168 m!266877))

(declare-fun m!267795 () Bool)

(assert (=> b!168168 m!267795))

(declare-fun m!267797 () Bool)

(assert (=> bm!2837 m!267797))

(assert (=> bm!2837 m!267797))

(assert (=> bm!2837 m!267797))

(assert (=> bm!2837 m!267797))

(declare-fun m!267799 () Bool)

(assert (=> bm!2837 m!267799))

(declare-fun m!267801 () Bool)

(assert (=> b!168170 m!267801))

(declare-fun m!267803 () Bool)

(assert (=> b!168174 m!267803))

(assert (=> b!168174 m!267803))

(assert (=> b!168174 m!267803))

(assert (=> b!168174 m!267803))

(declare-fun m!267805 () Bool)

(assert (=> b!168174 m!267805))

(assert (=> b!167930 d!59189))

(assert (=> b!167930 d!59003))

(push 1)

(assert (not b!168167))

(assert (not b!168160))

(assert (not d!59119))

(assert (not b!168174))

(assert (not bm!2833))

(assert (not d!59155))

(assert (not b!168104))

(assert (not d!59179))

(assert (not b!168154))

(assert (not d!59141))

(assert (not b!168156))

(assert (not b!168108))

(assert (not b!168170))

(assert (not b!168138))

(assert (not d!59133))

(assert (not d!59171))

(assert (not b!168131))

(assert (not b!168149))

(assert (not b!168128))

(assert (not bm!2837))

(assert (not b!168089))

(assert (not d!59187))

(assert (not b!168087))

(assert (not d!59139))

(assert (not b!168097))

(assert (not d!59181))

(assert (not b!168143))

(assert (not b!168116))

(assert (not b!168153))

(assert (not b!168146))

(assert (not d!59163))

(assert (not b!168161))

(assert (not b!168144))

(assert (not bm!2834))

(assert (not bm!2832))

(assert (not d!59167))

(assert (not b!168163))

(assert (not b!168123))

(assert (not b!168117))

(assert (not b!168102))

(assert (not b!168110))

(assert (not b!168147))

(assert (not bm!2831))

(assert (not b!168093))

(assert (not b!168101))

(assert (not d!59153))

(assert (not bm!2835))

(assert (not b!168168))

(assert (not bm!2836))

(assert (not b!168099))

(assert (not d!59165))

(assert (not d!59161))

(assert (not b!168119))

(check-sat)

