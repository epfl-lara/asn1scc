; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66380 () Bool)

(assert start!66380)

(declare-fun b!297516 () Bool)

(declare-fun e!213006 () Bool)

(declare-datatypes ((array!17817 0))(
  ( (array!17818 (arr!8802 (Array (_ BitVec 32) (_ BitVec 8))) (size!7722 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13448 0))(
  ( (BitStream!13449 (buf!7785 array!17817) (currentByte!14327 (_ BitVec 32)) (currentBit!14322 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13448)

(declare-fun array_inv!7334 (array!17817) Bool)

(assert (=> b!297516 (= e!213006 (array_inv!7334 (buf!7785 thiss!1728)))))

(declare-fun b!297513 () Bool)

(declare-fun res!245549 () Bool)

(declare-fun e!213003 () Bool)

(assert (=> b!297513 (=> (not res!245549) (not e!213003))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297513 (= res!245549 (validate_offset_bits!1 ((_ sign_extend 32) (size!7722 (buf!7785 thiss!1728))) ((_ sign_extend 32) (currentByte!14327 thiss!1728)) ((_ sign_extend 32) (currentBit!14322 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297514 () Bool)

(declare-fun res!245548 () Bool)

(assert (=> b!297514 (=> (not res!245548) (not e!213003))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297514 (= res!245548 (bvsge from!505 to!474))))

(declare-fun b!297515 () Bool)

(declare-fun lt!433749 () (_ BitVec 64))

(declare-fun lt!433751 () (_ BitVec 64))

(assert (=> b!297515 (= e!213003 (not (or (not (= lt!433751 (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!433751 (bvand (bvadd lt!433749 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!297515 (= lt!433751 (bvand lt!433749 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297515 (= lt!433749 (bitIndex!0 (size!7722 (buf!7785 thiss!1728)) (currentByte!14327 thiss!1728) (currentBit!14322 thiss!1728)))))

(declare-fun arr!273 () array!17817)

(declare-fun arrayBitRangesEq!0 (array!17817 array!17817 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297515 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20765 0))(
  ( (Unit!20766) )
))
(declare-fun lt!433752 () Unit!20765)

(declare-fun lt!433750 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17817 array!17817 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20765)

(assert (=> b!297515 (= lt!433752 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433750 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297515 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433750)))

(assert (=> b!297515 (= lt!433750 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7722 arr!273))))))

(declare-fun lt!433748 () Unit!20765)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17817) Unit!20765)

(assert (=> b!297515 (= lt!433748 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245547 () Bool)

(assert (=> start!66380 (=> (not res!245547) (not e!213003))))

(assert (=> start!66380 (= res!245547 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7722 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66380 e!213003))

(declare-fun inv!12 (BitStream!13448) Bool)

(assert (=> start!66380 (and (inv!12 thiss!1728) e!213006)))

(assert (=> start!66380 true))

(assert (=> start!66380 (array_inv!7334 arr!273)))

(assert (= (and start!66380 res!245547) b!297513))

(assert (= (and b!297513 res!245549) b!297514))

(assert (= (and b!297514 res!245548) b!297515))

(assert (= start!66380 b!297516))

(declare-fun m!436345 () Bool)

(assert (=> b!297516 m!436345))

(declare-fun m!436347 () Bool)

(assert (=> b!297513 m!436347))

(declare-fun m!436349 () Bool)

(assert (=> b!297515 m!436349))

(declare-fun m!436351 () Bool)

(assert (=> b!297515 m!436351))

(declare-fun m!436353 () Bool)

(assert (=> b!297515 m!436353))

(declare-fun m!436355 () Bool)

(assert (=> b!297515 m!436355))

(declare-fun m!436357 () Bool)

(assert (=> b!297515 m!436357))

(declare-fun m!436359 () Bool)

(assert (=> start!66380 m!436359))

(declare-fun m!436361 () Bool)

(assert (=> start!66380 m!436361))

(push 1)

(assert (not b!297515))

(assert (not b!297513))

(assert (not start!66380))

(assert (not b!297516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100186 () Bool)

(declare-fun e!213024 () Bool)

(assert (=> d!100186 e!213024))

(declare-fun res!245565 () Bool)

(assert (=> d!100186 (=> (not res!245565) (not e!213024))))

(declare-fun lt!433770 () (_ BitVec 64))

(assert (=> d!100186 (= res!245565 (or (= lt!433770 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433770 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433770))))))

(assert (=> d!100186 (= lt!433770 ((_ sign_extend 32) (size!7722 arr!273)))))

(declare-fun lt!433769 () Unit!20765)

(declare-fun choose!59 (array!17817) Unit!20765)

(assert (=> d!100186 (= lt!433769 (choose!59 arr!273))))

(assert (=> d!100186 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!433769)))

(declare-fun b!297536 () Bool)

(assert (=> b!297536 (= e!213024 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7722 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100186 res!245565) b!297536))

(declare-fun m!436367 () Bool)

(assert (=> d!100186 m!436367))

(declare-fun m!436369 () Bool)

(assert (=> b!297536 m!436369))

(assert (=> b!297515 d!100186))

(declare-fun b!297592 () Bool)

(declare-fun e!213072 () Bool)

(declare-fun e!213074 () Bool)

(assert (=> b!297592 (= e!213072 e!213074)))

(declare-fun res!245610 () Bool)

(assert (=> b!297592 (=> (not res!245610) (not e!213074))))

(declare-fun e!213073 () Bool)

(assert (=> b!297592 (= res!245610 e!213073)))

(declare-fun res!245607 () Bool)

(assert (=> b!297592 (=> res!245607 e!213073)))

(declare-datatypes ((tuple4!922 0))(
  ( (tuple4!923 (_1!13110 (_ BitVec 32)) (_2!13110 (_ BitVec 32)) (_3!1418 (_ BitVec 32)) (_4!461 (_ BitVec 32))) )
))
(declare-fun lt!433813 () tuple4!922)

(assert (=> b!297592 (= res!245607 (bvsge (_1!13110 lt!433813) (_2!13110 lt!433813)))))

(declare-fun lt!433814 () (_ BitVec 32))

(assert (=> b!297592 (= lt!433814 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433815 () (_ BitVec 32))

(assert (=> b!297592 (= lt!433815 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!922)

(assert (=> b!297592 (= lt!433813 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!297593 () Bool)

(declare-fun e!213075 () Bool)

(assert (=> b!297593 (= e!213074 e!213075)))

(declare-fun c!13615 () Bool)

(assert (=> b!297593 (= c!13615 (= (_3!1418 lt!433813) (_4!461 lt!433813)))))

(declare-fun b!297594 () Bool)

(declare-fun e!213070 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297594 (= e!213070 (byteRangesEq!0 (select (arr!8802 arr!273) (_4!461 lt!433813)) (select (arr!8802 arr!273) (_4!461 lt!433813)) #b00000000000000000000000000000000 lt!433814))))

(declare-fun b!297595 () Bool)

(declare-fun res!245608 () Bool)

(assert (=> b!297595 (= res!245608 (= lt!433814 #b00000000000000000000000000000000))))

(assert (=> b!297595 (=> res!245608 e!213070)))

(declare-fun e!213071 () Bool)

(assert (=> b!297595 (= e!213071 e!213070)))

(declare-fun b!297596 () Bool)

(declare-fun call!5253 () Bool)

(assert (=> b!297596 (= e!213075 call!5253)))

(declare-fun b!297597 () Bool)

(declare-fun arrayRangesEq!1519 (array!17817 array!17817 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297597 (= e!213073 (arrayRangesEq!1519 arr!273 arr!273 (_1!13110 lt!433813) (_2!13110 lt!433813)))))

(declare-fun b!297598 () Bool)

(assert (=> b!297598 (= e!213075 e!213071)))

(declare-fun res!245609 () Bool)

(assert (=> b!297598 (= res!245609 call!5253)))

(assert (=> b!297598 (=> (not res!245609) (not e!213071))))

(declare-fun bm!5250 () Bool)

(assert (=> bm!5250 (= call!5253 (byteRangesEq!0 (select (arr!8802 arr!273) (_3!1418 lt!433813)) (select (arr!8802 arr!273) (_3!1418 lt!433813)) lt!433815 (ite c!13615 lt!433814 #b00000000000000000000000000001000)))))

(declare-fun d!100188 () Bool)

(declare-fun res!245611 () Bool)

(assert (=> d!100188 (=> res!245611 e!213072)))

(assert (=> d!100188 (= res!245611 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100188 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213072)))

(assert (= (and d!100188 (not res!245611)) b!297592))

(assert (= (and b!297592 (not res!245607)) b!297597))

(assert (= (and b!297592 res!245610) b!297593))

(assert (= (and b!297593 c!13615) b!297596))

(assert (= (and b!297593 (not c!13615)) b!297598))

(assert (= (and b!297598 res!245609) b!297595))

(assert (= (and b!297595 (not res!245608)) b!297594))

(assert (= (or b!297596 b!297598) bm!5250))

(declare-fun m!436413 () Bool)

(assert (=> b!297592 m!436413))

(declare-fun m!436415 () Bool)

(assert (=> b!297594 m!436415))

(assert (=> b!297594 m!436415))

(assert (=> b!297594 m!436415))

(assert (=> b!297594 m!436415))

(declare-fun m!436417 () Bool)

(assert (=> b!297594 m!436417))

(declare-fun m!436419 () Bool)

(assert (=> b!297597 m!436419))

(declare-fun m!436421 () Bool)

(assert (=> bm!5250 m!436421))

(assert (=> bm!5250 m!436421))

(assert (=> bm!5250 m!436421))

(assert (=> bm!5250 m!436421))

(declare-fun m!436423 () Bool)

(assert (=> bm!5250 m!436423))

(assert (=> b!297515 d!100188))

(declare-fun d!100200 () Bool)

(assert (=> d!100200 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433821 () Unit!20765)

(declare-fun choose!4 (array!17817 array!17817 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20765)

(assert (=> d!100200 (= lt!433821 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433750 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100200 (bvsle (size!7722 arr!273) (size!7722 arr!273))))

(assert (=> d!100200 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433750 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!433821)))

(declare-fun bs!25637 () Bool)

(assert (= bs!25637 d!100200))

(assert (=> bs!25637 m!436357))

(declare-fun m!436427 () Bool)

(assert (=> bs!25637 m!436427))

(assert (=> b!297515 d!100200))

(declare-fun d!100204 () Bool)

(declare-fun e!213090 () Bool)

(assert (=> d!100204 e!213090))

(declare-fun res!245630 () Bool)

(assert (=> d!100204 (=> (not res!245630) (not e!213090))))

(declare-fun lt!433863 () (_ BitVec 64))

(declare-fun lt!433862 () (_ BitVec 64))

(declare-fun lt!433866 () (_ BitVec 64))

(assert (=> d!100204 (= res!245630 (= lt!433862 (bvsub lt!433866 lt!433863)))))

(assert (=> d!100204 (or (= (bvand lt!433866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433863 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433866 lt!433863) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100204 (= lt!433863 (remainingBits!0 ((_ sign_extend 32) (size!7722 (buf!7785 thiss!1728))) ((_ sign_extend 32) (currentByte!14327 thiss!1728)) ((_ sign_extend 32) (currentBit!14322 thiss!1728))))))

(declare-fun lt!433861 () (_ BitVec 64))

(declare-fun lt!433864 () (_ BitVec 64))

(assert (=> d!100204 (= lt!433866 (bvmul lt!433861 lt!433864))))

(assert (=> d!100204 (or (= lt!433861 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433864 (bvsdiv (bvmul lt!433861 lt!433864) lt!433861)))))

(assert (=> d!100204 (= lt!433864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100204 (= lt!433861 ((_ sign_extend 32) (size!7722 (buf!7785 thiss!1728))))))

(assert (=> d!100204 (= lt!433862 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14327 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14322 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100204 (invariant!0 (currentBit!14322 thiss!1728) (currentByte!14327 thiss!1728) (size!7722 (buf!7785 thiss!1728)))))

(assert (=> d!100204 (= (bitIndex!0 (size!7722 (buf!7785 thiss!1728)) (currentByte!14327 thiss!1728) (currentBit!14322 thiss!1728)) lt!433862)))

(declare-fun b!297619 () Bool)

(declare-fun res!245631 () Bool)

(assert (=> b!297619 (=> (not res!245631) (not e!213090))))

(assert (=> b!297619 (= res!245631 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433862))))

(declare-fun b!297620 () Bool)

(declare-fun lt!433865 () (_ BitVec 64))

(assert (=> b!297620 (= e!213090 (bvsle lt!433862 (bvmul lt!433865 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297620 (or (= lt!433865 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433865 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433865)))))

(assert (=> b!297620 (= lt!433865 ((_ sign_extend 32) (size!7722 (buf!7785 thiss!1728))))))

(assert (= (and d!100204 res!245630) b!297619))

(assert (= (and b!297619 res!245631) b!297620))

(declare-fun m!436449 () Bool)

(assert (=> d!100204 m!436449))

(declare-fun m!436451 () Bool)

(assert (=> d!100204 m!436451))

(assert (=> b!297515 d!100204))

(declare-fun b!297621 () Bool)

(declare-fun e!213093 () Bool)

(declare-fun e!213095 () Bool)

(assert (=> b!297621 (= e!213093 e!213095)))

(declare-fun res!245635 () Bool)

(assert (=> b!297621 (=> (not res!245635) (not e!213095))))

(declare-fun e!213094 () Bool)

(assert (=> b!297621 (= res!245635 e!213094)))

(declare-fun res!245632 () Bool)

(assert (=> b!297621 (=> res!245632 e!213094)))

(declare-fun lt!433867 () tuple4!922)

(assert (=> b!297621 (= res!245632 (bvsge (_1!13110 lt!433867) (_2!13110 lt!433867)))))

(declare-fun lt!433868 () (_ BitVec 32))

(assert (=> b!297621 (= lt!433868 ((_ extract 31 0) (bvsrem lt!433750 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433869 () (_ BitVec 32))

(assert (=> b!297621 (= lt!433869 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297621 (= lt!433867 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433750))))

(declare-fun b!297622 () Bool)

(declare-fun e!213096 () Bool)

(assert (=> b!297622 (= e!213095 e!213096)))

(declare-fun c!13617 () Bool)

(assert (=> b!297622 (= c!13617 (= (_3!1418 lt!433867) (_4!461 lt!433867)))))

(declare-fun b!297623 () Bool)

(declare-fun e!213091 () Bool)

(assert (=> b!297623 (= e!213091 (byteRangesEq!0 (select (arr!8802 arr!273) (_4!461 lt!433867)) (select (arr!8802 arr!273) (_4!461 lt!433867)) #b00000000000000000000000000000000 lt!433868))))

(declare-fun b!297624 () Bool)

(declare-fun res!245633 () Bool)

(assert (=> b!297624 (= res!245633 (= lt!433868 #b00000000000000000000000000000000))))

(assert (=> b!297624 (=> res!245633 e!213091)))

(declare-fun e!213092 () Bool)

(assert (=> b!297624 (= e!213092 e!213091)))

(declare-fun b!297625 () Bool)

(declare-fun call!5255 () Bool)

(assert (=> b!297625 (= e!213096 call!5255)))

(declare-fun b!297626 () Bool)

(assert (=> b!297626 (= e!213094 (arrayRangesEq!1519 arr!273 arr!273 (_1!13110 lt!433867) (_2!13110 lt!433867)))))

(declare-fun b!297627 () Bool)

(assert (=> b!297627 (= e!213096 e!213092)))

(declare-fun res!245634 () Bool)

(assert (=> b!297627 (= res!245634 call!5255)))

(assert (=> b!297627 (=> (not res!245634) (not e!213092))))

(declare-fun bm!5252 () Bool)

(assert (=> bm!5252 (= call!5255 (byteRangesEq!0 (select (arr!8802 arr!273) (_3!1418 lt!433867)) (select (arr!8802 arr!273) (_3!1418 lt!433867)) lt!433869 (ite c!13617 lt!433868 #b00000000000000000000000000001000)))))

(declare-fun d!100224 () Bool)

(declare-fun res!245636 () Bool)

(assert (=> d!100224 (=> res!245636 e!213093)))

(assert (=> d!100224 (= res!245636 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!433750))))

(assert (=> d!100224 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433750) e!213093)))

(assert (= (and d!100224 (not res!245636)) b!297621))

(assert (= (and b!297621 (not res!245632)) b!297626))

(assert (= (and b!297621 res!245635) b!297622))

(assert (= (and b!297622 c!13617) b!297625))

(assert (= (and b!297622 (not c!13617)) b!297627))

(assert (= (and b!297627 res!245634) b!297624))

(assert (= (and b!297624 (not res!245633)) b!297623))

(assert (= (or b!297625 b!297627) bm!5252))

(declare-fun m!436453 () Bool)

(assert (=> b!297621 m!436453))

(declare-fun m!436455 () Bool)

(assert (=> b!297623 m!436455))

(assert (=> b!297623 m!436455))

(assert (=> b!297623 m!436455))

(assert (=> b!297623 m!436455))

(declare-fun m!436457 () Bool)

(assert (=> b!297623 m!436457))

(declare-fun m!436459 () Bool)

(assert (=> b!297626 m!436459))

(declare-fun m!436461 () Bool)

(assert (=> bm!5252 m!436461))

(assert (=> bm!5252 m!436461))

(assert (=> bm!5252 m!436461))

(assert (=> bm!5252 m!436461))

(declare-fun m!436463 () Bool)

(assert (=> bm!5252 m!436463))

(assert (=> b!297515 d!100224))

(declare-fun d!100226 () Bool)

(assert (=> d!100226 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7722 (buf!7785 thiss!1728))) ((_ sign_extend 32) (currentByte!14327 thiss!1728)) ((_ sign_extend 32) (currentBit!14322 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7722 (buf!7785 thiss!1728))) ((_ sign_extend 32) (currentByte!14327 thiss!1728)) ((_ sign_extend 32) (currentBit!14322 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25642 () Bool)

(assert (= bs!25642 d!100226))

(assert (=> bs!25642 m!436449))

(assert (=> b!297513 d!100226))

(declare-fun d!100228 () Bool)

(assert (=> d!100228 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14322 thiss!1728) (currentByte!14327 thiss!1728) (size!7722 (buf!7785 thiss!1728))))))

(declare-fun bs!25643 () Bool)

(assert (= bs!25643 d!100228))

(assert (=> bs!25643 m!436451))

(assert (=> start!66380 d!100228))

(declare-fun d!100230 () Bool)

(assert (=> d!100230 (= (array_inv!7334 arr!273) (bvsge (size!7722 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66380 d!100230))

(declare-fun d!100232 () Bool)

(assert (=> d!100232 (= (array_inv!7334 (buf!7785 thiss!1728)) (bvsge (size!7722 (buf!7785 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!297516 d!100232))

(push 1)

(assert (not b!297626))

(assert (not d!100204))

(assert (not bm!5252))

(assert (not bm!5250))

(assert (not b!297597))

(assert (not d!100200))

(assert (not b!297594))

(assert (not b!297592))

(assert (not d!100226))

(assert (not b!297621))

(assert (not b!297536))

(assert (not d!100186))

(assert (not b!297623))

(assert (not d!100228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

