; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32460 () Bool)

(assert start!32460)

(declare-fun b!160023 () Bool)

(declare-fun e!109470 () Bool)

(declare-datatypes ((array!7635 0))(
  ( (array!7636 (arr!4376 (Array (_ BitVec 32) (_ BitVec 8))) (size!3455 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6078 0))(
  ( (BitStream!6079 (buf!3913 array!7635) (currentByte!7162 (_ BitVec 32)) (currentBit!7157 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6078)

(declare-datatypes ((Unit!10931 0))(
  ( (Unit!10932) )
))
(declare-datatypes ((tuple3!812 0))(
  ( (tuple3!813 (_1!7755 Unit!10931) (_2!7755 (_ BitVec 8)) (_3!523 BitStream!6078)) )
))
(declare-fun lt!252513 () tuple3!812)

(declare-fun arrayRangesEq!506 (array!7635 array!7635 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160023 (= e!109470 (arrayRangesEq!506 (buf!3913 thiss!1602) (buf!3913 (_3!523 lt!252513)) #b00000000000000000000000000000000 (currentByte!7162 thiss!1602)))))

(declare-fun b!160024 () Bool)

(declare-fun e!109468 () Unit!10931)

(declare-fun Unit!10933 () Unit!10931)

(assert (=> b!160024 (= e!109468 Unit!10933)))

(declare-fun call!2720 () Bool)

(assert (=> b!160024 call!2720))

(declare-fun b!160025 () Bool)

(declare-fun e!109469 () Bool)

(declare-fun array_inv!3202 (array!7635) Bool)

(assert (=> b!160025 (= e!109469 (array_inv!3202 (buf!3913 thiss!1602)))))

(declare-fun lt!252506 () array!7635)

(declare-fun bm!2717 () Bool)

(declare-fun c!8450 () Bool)

(declare-fun lt!252515 () (_ BitVec 8))

(declare-fun lt!252514 () (_ BitVec 8))

(assert (=> bm!2717 (= call!2720 (arrayRangesEq!506 (ite c!8450 lt!252506 (buf!3913 thiss!1602)) (ite c!8450 (array!7636 (store (store (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) lt!252515) (currentByte!7162 thiss!1602) lt!252514) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 (buf!3913 thiss!1602))) (buf!3913 (_3!523 lt!252513))) #b00000000000000000000000000000000 (ite c!8450 (currentByte!7162 (_3!523 lt!252513)) (currentByte!7162 thiss!1602))))))

(declare-fun b!160026 () Bool)

(declare-fun e!109464 () Bool)

(declare-fun e!109465 () Bool)

(assert (=> b!160026 (= e!109464 e!109465)))

(declare-fun res!133553 () Bool)

(assert (=> b!160026 (=> res!133553 e!109465)))

(assert (=> b!160026 (= res!133553 (not (= (size!3455 (buf!3913 thiss!1602)) (size!3455 (buf!3913 (_3!523 lt!252513))))))))

(declare-fun lt!252501 () Unit!10931)

(assert (=> b!160026 (= lt!252501 e!109468)))

(declare-fun lt!252505 () Bool)

(assert (=> b!160026 (= c!8450 lt!252505)))

(declare-fun b!160027 () Bool)

(declare-datatypes ((tuple2!14464 0))(
  ( (tuple2!14465 (_1!7756 BitStream!6078) (_2!7756 BitStream!6078)) )
))
(declare-fun lt!252512 () tuple2!14464)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!160027 (= e!109465 (validate_offset_byte!0 ((_ sign_extend 32) (size!3455 (buf!3913 (_1!7756 lt!252512)))) ((_ sign_extend 32) (currentByte!7162 (_1!7756 lt!252512))) ((_ sign_extend 32) (currentBit!7157 (_1!7756 lt!252512)))))))

(declare-fun reader!0 (BitStream!6078 BitStream!6078) tuple2!14464)

(assert (=> b!160027 (= lt!252512 (reader!0 thiss!1602 (_3!523 lt!252513)))))

(declare-fun b!160028 () Bool)

(declare-fun res!133552 () Bool)

(assert (=> b!160028 (=> res!133552 e!109465)))

(declare-fun isPrefixOf!0 (BitStream!6078 BitStream!6078) Bool)

(assert (=> b!160028 (= res!133552 (not (isPrefixOf!0 thiss!1602 (_3!523 lt!252513))))))

(declare-fun b!160030 () Bool)

(declare-fun e!109463 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160030 (= e!109463 (byteRangesEq!0 (select (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602)) lt!252514 #b00000000000000000000000000000000 (currentBit!7157 thiss!1602)))))

(declare-fun b!160031 () Bool)

(declare-fun res!133555 () Bool)

(assert (=> b!160031 (=> res!133555 e!109465)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!160031 (= res!133555 (not (= (bitIndex!0 (size!3455 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)) (currentBit!7157 (_3!523 lt!252513))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3455 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) (currentBit!7157 thiss!1602))))))))

(declare-fun b!160032 () Bool)

(declare-fun e!109467 () Bool)

(assert (=> b!160032 (= e!109467 (not e!109464))))

(declare-fun res!133556 () Bool)

(assert (=> b!160032 (=> res!133556 e!109464)))

(assert (=> b!160032 (= res!133556 (not (arrayRangesEq!506 (buf!3913 thiss!1602) lt!252506 #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001))))))

(declare-fun lt!252508 () (_ BitVec 8))

(assert (=> b!160032 (arrayRangesEq!506 (buf!3913 thiss!1602) (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) lt!252508) (size!3455 (buf!3913 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001))))

(declare-fun lt!252504 () Unit!10931)

(declare-fun arrayUpdatedAtPrefixLemma!114 (array!7635 (_ BitVec 32) (_ BitVec 8)) Unit!10931)

(assert (=> b!160032 (= lt!252504 (arrayUpdatedAtPrefixLemma!114 (buf!3913 thiss!1602) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) lt!252508))))

(assert (=> b!160032 (= lt!252508 (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)))))

(declare-fun lt!252502 () (_ BitVec 32))

(declare-fun lt!252509 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252511 () (_ BitVec 8))

(declare-fun Unit!10934 () Unit!10931)

(declare-fun Unit!10935 () Unit!10931)

(assert (=> b!160032 (= lt!252513 (ite lt!252505 (let ((bdg!9472 ((_ extract 7 0) (bvnot lt!252502)))) (let ((bdg!9473 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) lt!252515) (currentByte!7162 thiss!1602) lt!252514) (bvadd #b00000000000000000000000000000001 (currentByte!7162 thiss!1602)))) ((_ sign_extend 24) bdg!9472))))) (tuple3!813 Unit!10934 bdg!9472 (BitStream!6079 (array!7636 (store (arr!4376 (array!7636 (store (arr!4376 lt!252506) (bvadd #b00000000000000000000000000000001 (currentByte!7162 thiss!1602)) bdg!9473) (size!3455 lt!252506))) (bvadd #b00000000000000000000000000000001 (currentByte!7162 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9473) (bvshl ((_ sign_extend 24) v!222) lt!252509)))) (size!3455 (array!7636 (store (arr!4376 lt!252506) (bvadd #b00000000000000000000000000000001 (currentByte!7162 thiss!1602)) bdg!9473) (size!3455 lt!252506)))) (bvadd #b00000000000000000000000000000001 (currentByte!7162 thiss!1602)) (currentBit!7157 thiss!1602))))) (tuple3!813 Unit!10935 lt!252511 (BitStream!6079 lt!252506 (bvadd #b00000000000000000000000000000001 (currentByte!7162 thiss!1602)) (currentBit!7157 thiss!1602)))))))

(declare-fun lt!252507 () (_ BitVec 32))

(assert (=> b!160032 (= lt!252505 (bvsgt lt!252507 #b00000000000000000000000000000000))))

(assert (=> b!160032 e!109463))

(declare-fun res!133550 () Bool)

(assert (=> b!160032 (=> res!133550 e!109463)))

(assert (=> b!160032 (= res!133550 (bvsge (currentByte!7162 thiss!1602) (size!3455 (buf!3913 thiss!1602))))))

(assert (=> b!160032 (= lt!252506 (array!7636 (store (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) lt!252515) (currentByte!7162 thiss!1602) lt!252514) (size!3455 (buf!3913 thiss!1602))))))

(assert (=> b!160032 (= lt!252514 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252515) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252507))))))

(assert (=> b!160032 (= lt!252515 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602))) lt!252502)))))

(assert (=> b!160032 (= lt!252502 ((_ sign_extend 24) lt!252511))))

(assert (=> b!160032 (= lt!252511 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252509)))))))

(assert (=> b!160032 (= lt!252509 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252507))))))

(assert (=> b!160032 (= lt!252507 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7157 thiss!1602))))))

(declare-fun res!133554 () Bool)

(assert (=> start!32460 (=> (not res!133554) (not e!109467))))

(assert (=> start!32460 (= res!133554 (validate_offset_byte!0 ((_ sign_extend 32) (size!3455 (buf!3913 thiss!1602))) ((_ sign_extend 32) (currentByte!7162 thiss!1602)) ((_ sign_extend 32) (currentBit!7157 thiss!1602))))))

(assert (=> start!32460 e!109467))

(declare-fun inv!12 (BitStream!6078) Bool)

(assert (=> start!32460 (and (inv!12 thiss!1602) e!109469)))

(assert (=> start!32460 true))

(declare-fun b!160029 () Bool)

(declare-fun Unit!10936 () Unit!10931)

(assert (=> b!160029 (= e!109468 Unit!10936)))

(declare-fun lt!252510 () Unit!10931)

(assert (=> b!160029 (= lt!252510 (arrayUpdatedAtPrefixLemma!114 (buf!3913 thiss!1602) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))))))

(assert (=> b!160029 (arrayRangesEq!506 (buf!3913 thiss!1602) (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 (buf!3913 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7162 (_3!523 lt!252513)))))

(declare-fun lt!252516 () Unit!10931)

(assert (=> b!160029 (= lt!252516 (arrayUpdatedAtPrefixLemma!114 lt!252506 (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))))))

(assert (=> b!160029 call!2720))

(declare-fun lt!252503 () Unit!10931)

(declare-fun arrayRangesEqTransitive!140 (array!7635 array!7635 array!7635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10931)

(assert (=> b!160029 (= lt!252503 (arrayRangesEqTransitive!140 (buf!3913 thiss!1602) lt!252506 (buf!3913 (_3!523 lt!252513)) #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) (currentByte!7162 (_3!523 lt!252513))))))

(declare-fun res!133551 () Bool)

(assert (=> b!160029 (= res!133551 (arrayRangesEq!506 (buf!3913 thiss!1602) (buf!3913 (_3!523 lt!252513)) #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)))))

(assert (=> b!160029 (=> (not res!133551) (not e!109470))))

(assert (=> b!160029 e!109470))

(assert (= (and start!32460 res!133554) b!160032))

(assert (= (and b!160032 (not res!133550)) b!160030))

(assert (= (and b!160032 (not res!133556)) b!160026))

(assert (= (and b!160026 c!8450) b!160029))

(assert (= (and b!160026 (not c!8450)) b!160024))

(assert (= (and b!160029 res!133551) b!160023))

(assert (= (or b!160029 b!160024) bm!2717))

(assert (= (and b!160026 (not res!133553)) b!160031))

(assert (= (and b!160031 (not res!133555)) b!160028))

(assert (= (and b!160028 (not res!133552)) b!160027))

(assert (= start!32460 b!160025))

(declare-fun m!252531 () Bool)

(assert (=> b!160029 m!252531))

(declare-fun m!252533 () Bool)

(assert (=> b!160029 m!252533))

(declare-fun m!252535 () Bool)

(assert (=> b!160029 m!252535))

(declare-fun m!252537 () Bool)

(assert (=> b!160029 m!252537))

(assert (=> b!160029 m!252531))

(assert (=> b!160029 m!252531))

(declare-fun m!252539 () Bool)

(assert (=> b!160029 m!252539))

(declare-fun m!252541 () Bool)

(assert (=> b!160029 m!252541))

(declare-fun m!252543 () Bool)

(assert (=> b!160029 m!252543))

(declare-fun m!252545 () Bool)

(assert (=> b!160027 m!252545))

(declare-fun m!252547 () Bool)

(assert (=> b!160027 m!252547))

(declare-fun m!252549 () Bool)

(assert (=> b!160030 m!252549))

(assert (=> b!160030 m!252549))

(declare-fun m!252551 () Bool)

(assert (=> b!160030 m!252551))

(declare-fun m!252553 () Bool)

(assert (=> b!160032 m!252553))

(declare-fun m!252555 () Bool)

(assert (=> b!160032 m!252555))

(declare-fun m!252557 () Bool)

(assert (=> b!160032 m!252557))

(declare-fun m!252559 () Bool)

(assert (=> b!160032 m!252559))

(declare-fun m!252561 () Bool)

(assert (=> b!160032 m!252561))

(declare-fun m!252563 () Bool)

(assert (=> b!160032 m!252563))

(assert (=> b!160032 m!252549))

(declare-fun m!252565 () Bool)

(assert (=> b!160032 m!252565))

(declare-fun m!252567 () Bool)

(assert (=> b!160032 m!252567))

(declare-fun m!252569 () Bool)

(assert (=> b!160032 m!252569))

(declare-fun m!252571 () Bool)

(assert (=> b!160032 m!252571))

(declare-fun m!252573 () Bool)

(assert (=> b!160032 m!252573))

(declare-fun m!252575 () Bool)

(assert (=> b!160023 m!252575))

(declare-fun m!252577 () Bool)

(assert (=> b!160028 m!252577))

(declare-fun m!252579 () Bool)

(assert (=> bm!2717 m!252579))

(assert (=> bm!2717 m!252555))

(assert (=> bm!2717 m!252563))

(declare-fun m!252581 () Bool)

(assert (=> bm!2717 m!252581))

(assert (=> bm!2717 m!252531))

(declare-fun m!252583 () Bool)

(assert (=> b!160031 m!252583))

(declare-fun m!252585 () Bool)

(assert (=> b!160031 m!252585))

(declare-fun m!252587 () Bool)

(assert (=> b!160025 m!252587))

(declare-fun m!252589 () Bool)

(assert (=> start!32460 m!252589))

(declare-fun m!252591 () Bool)

(assert (=> start!32460 m!252591))

(check-sat (not bm!2717) (not b!160029) (not b!160028) (not start!32460) (not b!160027) (not b!160023) (not b!160031) (not b!160030) (not b!160025) (not b!160032))
(check-sat)
(get-model)

(declare-fun d!53911 () Bool)

(declare-fun e!109497 () Bool)

(assert (=> d!53911 e!109497))

(declare-fun res!133580 () Bool)

(assert (=> d!53911 (=> (not res!133580) (not e!109497))))

(assert (=> d!53911 (= res!133580 (and (bvsge (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000000) (bvslt (currentByte!7162 (_3!523 lt!252513)) (size!3455 (buf!3913 thiss!1602)))))))

(declare-fun lt!252567 () Unit!10931)

(declare-fun choose!145 (array!7635 (_ BitVec 32) (_ BitVec 8)) Unit!10931)

(assert (=> d!53911 (= lt!252567 (choose!145 (buf!3913 thiss!1602) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))))))

(assert (=> d!53911 (and (bvsle #b00000000000000000000000000000000 (currentByte!7162 (_3!523 lt!252513))) (bvslt (currentByte!7162 (_3!523 lt!252513)) (size!3455 (buf!3913 thiss!1602))))))

(assert (=> d!53911 (= (arrayUpdatedAtPrefixLemma!114 (buf!3913 thiss!1602) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) lt!252567)))

(declare-fun b!160065 () Bool)

(assert (=> b!160065 (= e!109497 (arrayRangesEq!506 (buf!3913 thiss!1602) (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 (buf!3913 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7162 (_3!523 lt!252513))))))

(assert (= (and d!53911 res!133580) b!160065))

(assert (=> d!53911 m!252531))

(declare-fun m!252655 () Bool)

(assert (=> d!53911 m!252655))

(assert (=> b!160065 m!252535))

(assert (=> b!160065 m!252537))

(assert (=> b!160029 d!53911))

(declare-fun d!53913 () Bool)

(declare-fun res!133585 () Bool)

(declare-fun e!109502 () Bool)

(assert (=> d!53913 (=> res!133585 e!109502)))

(assert (=> d!53913 (= res!133585 (= #b00000000000000000000000000000000 (currentByte!7162 (_3!523 lt!252513))))))

(assert (=> d!53913 (= (arrayRangesEq!506 (buf!3913 thiss!1602) (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 (buf!3913 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7162 (_3!523 lt!252513))) e!109502)))

(declare-fun b!160070 () Bool)

(declare-fun e!109503 () Bool)

(assert (=> b!160070 (= e!109502 e!109503)))

(declare-fun res!133586 () Bool)

(assert (=> b!160070 (=> (not res!133586) (not e!109503))))

(assert (=> b!160070 (= res!133586 (= (select (arr!4376 (buf!3913 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4376 (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 (buf!3913 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!160071 () Bool)

(assert (=> b!160071 (= e!109503 (arrayRangesEq!506 (buf!3913 thiss!1602) (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 (buf!3913 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7162 (_3!523 lt!252513))))))

(assert (= (and d!53913 (not res!133585)) b!160070))

(assert (= (and b!160070 res!133586) b!160071))

(declare-fun m!252657 () Bool)

(assert (=> b!160070 m!252657))

(declare-fun m!252659 () Bool)

(assert (=> b!160070 m!252659))

(declare-fun m!252661 () Bool)

(assert (=> b!160071 m!252661))

(assert (=> b!160029 d!53913))

(declare-fun d!53915 () Bool)

(declare-fun e!109504 () Bool)

(assert (=> d!53915 e!109504))

(declare-fun res!133587 () Bool)

(assert (=> d!53915 (=> (not res!133587) (not e!109504))))

(assert (=> d!53915 (= res!133587 (and (bvsge (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000000) (bvslt (currentByte!7162 (_3!523 lt!252513)) (size!3455 lt!252506))))))

(declare-fun lt!252568 () Unit!10931)

(assert (=> d!53915 (= lt!252568 (choose!145 lt!252506 (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))))))

(assert (=> d!53915 (and (bvsle #b00000000000000000000000000000000 (currentByte!7162 (_3!523 lt!252513))) (bvslt (currentByte!7162 (_3!523 lt!252513)) (size!3455 lt!252506)))))

(assert (=> d!53915 (= (arrayUpdatedAtPrefixLemma!114 lt!252506 (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) lt!252568)))

(declare-fun b!160072 () Bool)

(assert (=> b!160072 (= e!109504 (arrayRangesEq!506 lt!252506 (array!7636 (store (arr!4376 lt!252506) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 lt!252506)) #b00000000000000000000000000000000 (currentByte!7162 (_3!523 lt!252513))))))

(assert (= (and d!53915 res!133587) b!160072))

(assert (=> d!53915 m!252531))

(declare-fun m!252663 () Bool)

(assert (=> d!53915 m!252663))

(declare-fun m!252665 () Bool)

(assert (=> b!160072 m!252665))

(declare-fun m!252667 () Bool)

(assert (=> b!160072 m!252667))

(assert (=> b!160029 d!53915))

(declare-fun d!53917 () Bool)

(declare-fun res!133588 () Bool)

(declare-fun e!109505 () Bool)

(assert (=> d!53917 (=> res!133588 e!109505)))

(assert (=> d!53917 (= res!133588 (= #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)))))

(assert (=> d!53917 (= (arrayRangesEq!506 (buf!3913 thiss!1602) (buf!3913 (_3!523 lt!252513)) #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)) e!109505)))

(declare-fun b!160073 () Bool)

(declare-fun e!109506 () Bool)

(assert (=> b!160073 (= e!109505 e!109506)))

(declare-fun res!133589 () Bool)

(assert (=> b!160073 (=> (not res!133589) (not e!109506))))

(assert (=> b!160073 (= res!133589 (= (select (arr!4376 (buf!3913 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) #b00000000000000000000000000000000)))))

(declare-fun b!160074 () Bool)

(assert (=> b!160074 (= e!109506 (arrayRangesEq!506 (buf!3913 thiss!1602) (buf!3913 (_3!523 lt!252513)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)))))

(assert (= (and d!53917 (not res!133588)) b!160073))

(assert (= (and b!160073 res!133589) b!160074))

(assert (=> b!160073 m!252657))

(declare-fun m!252669 () Bool)

(assert (=> b!160073 m!252669))

(declare-fun m!252671 () Bool)

(assert (=> b!160074 m!252671))

(assert (=> b!160029 d!53917))

(declare-fun d!53919 () Bool)

(assert (=> d!53919 (arrayRangesEq!506 (buf!3913 thiss!1602) (buf!3913 (_3!523 lt!252513)) #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001))))

(declare-fun lt!252571 () Unit!10931)

(declare-fun choose!146 (array!7635 array!7635 array!7635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10931)

(assert (=> d!53919 (= lt!252571 (choose!146 (buf!3913 thiss!1602) lt!252506 (buf!3913 (_3!523 lt!252513)) #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) (currentByte!7162 (_3!523 lt!252513))))))

(assert (=> d!53919 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) (currentByte!7162 (_3!523 lt!252513))))))

(assert (=> d!53919 (= (arrayRangesEqTransitive!140 (buf!3913 thiss!1602) lt!252506 (buf!3913 (_3!523 lt!252513)) #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) (currentByte!7162 (_3!523 lt!252513))) lt!252571)))

(declare-fun bs!13354 () Bool)

(assert (= bs!13354 d!53919))

(assert (=> bs!13354 m!252541))

(declare-fun m!252673 () Bool)

(assert (=> bs!13354 m!252673))

(assert (=> b!160029 d!53919))

(declare-fun d!53921 () Bool)

(assert (=> d!53921 (= (array_inv!3202 (buf!3913 thiss!1602)) (bvsge (size!3455 (buf!3913 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160025 d!53921))

(declare-fun d!53923 () Bool)

(declare-fun res!133590 () Bool)

(declare-fun e!109507 () Bool)

(assert (=> d!53923 (=> res!133590 e!109507)))

(assert (=> d!53923 (= res!133590 (= #b00000000000000000000000000000000 (ite c!8450 (currentByte!7162 (_3!523 lt!252513)) (currentByte!7162 thiss!1602))))))

(assert (=> d!53923 (= (arrayRangesEq!506 (ite c!8450 lt!252506 (buf!3913 thiss!1602)) (ite c!8450 (array!7636 (store (store (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) lt!252515) (currentByte!7162 thiss!1602) lt!252514) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 (buf!3913 thiss!1602))) (buf!3913 (_3!523 lt!252513))) #b00000000000000000000000000000000 (ite c!8450 (currentByte!7162 (_3!523 lt!252513)) (currentByte!7162 thiss!1602))) e!109507)))

(declare-fun b!160075 () Bool)

(declare-fun e!109508 () Bool)

(assert (=> b!160075 (= e!109507 e!109508)))

(declare-fun res!133591 () Bool)

(assert (=> b!160075 (=> (not res!133591) (not e!109508))))

(assert (=> b!160075 (= res!133591 (= (select (arr!4376 (ite c!8450 lt!252506 (buf!3913 thiss!1602))) #b00000000000000000000000000000000) (select (arr!4376 (ite c!8450 (array!7636 (store (store (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) lt!252515) (currentByte!7162 thiss!1602) lt!252514) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 (buf!3913 thiss!1602))) (buf!3913 (_3!523 lt!252513)))) #b00000000000000000000000000000000)))))

(declare-fun b!160076 () Bool)

(assert (=> b!160076 (= e!109508 (arrayRangesEq!506 (ite c!8450 lt!252506 (buf!3913 thiss!1602)) (ite c!8450 (array!7636 (store (store (store (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) lt!252515) (currentByte!7162 thiss!1602) lt!252514) (currentByte!7162 (_3!523 lt!252513)) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)))) (size!3455 (buf!3913 thiss!1602))) (buf!3913 (_3!523 lt!252513))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8450 (currentByte!7162 (_3!523 lt!252513)) (currentByte!7162 thiss!1602))))))

(assert (= (and d!53923 (not res!133590)) b!160075))

(assert (= (and b!160075 res!133591) b!160076))

(declare-fun m!252675 () Bool)

(assert (=> b!160075 m!252675))

(declare-fun m!252677 () Bool)

(assert (=> b!160075 m!252677))

(declare-fun m!252679 () Bool)

(assert (=> b!160076 m!252679))

(assert (=> bm!2717 d!53923))

(declare-fun d!53925 () Bool)

(assert (=> d!53925 (= (byteRangesEq!0 (select (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602)) lt!252514 #b00000000000000000000000000000000 (currentBit!7157 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7157 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4376 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7157 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!252514) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7157 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13355 () Bool)

(assert (= bs!13355 d!53925))

(declare-fun m!252681 () Bool)

(assert (=> bs!13355 m!252681))

(declare-fun m!252683 () Bool)

(assert (=> bs!13355 m!252683))

(assert (=> b!160030 d!53925))

(declare-fun d!53927 () Bool)

(declare-fun e!109511 () Bool)

(assert (=> d!53927 e!109511))

(declare-fun res!133596 () Bool)

(assert (=> d!53927 (=> (not res!133596) (not e!109511))))

(declare-fun lt!252585 () (_ BitVec 64))

(declare-fun lt!252586 () (_ BitVec 64))

(declare-fun lt!252587 () (_ BitVec 64))

(assert (=> d!53927 (= res!133596 (= lt!252585 (bvsub lt!252587 lt!252586)))))

(assert (=> d!53927 (or (= (bvand lt!252587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!252586 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!252587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!252587 lt!252586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53927 (= lt!252586 (remainingBits!0 ((_ sign_extend 32) (size!3455 (buf!3913 (_3!523 lt!252513)))) ((_ sign_extend 32) (currentByte!7162 (_3!523 lt!252513))) ((_ sign_extend 32) (currentBit!7157 (_3!523 lt!252513)))))))

(declare-fun lt!252588 () (_ BitVec 64))

(declare-fun lt!252584 () (_ BitVec 64))

(assert (=> d!53927 (= lt!252587 (bvmul lt!252588 lt!252584))))

(assert (=> d!53927 (or (= lt!252588 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!252584 (bvsdiv (bvmul lt!252588 lt!252584) lt!252588)))))

(assert (=> d!53927 (= lt!252584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!53927 (= lt!252588 ((_ sign_extend 32) (size!3455 (buf!3913 (_3!523 lt!252513)))))))

(assert (=> d!53927 (= lt!252585 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7162 (_3!523 lt!252513))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7157 (_3!523 lt!252513)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53927 (invariant!0 (currentBit!7157 (_3!523 lt!252513)) (currentByte!7162 (_3!523 lt!252513)) (size!3455 (buf!3913 (_3!523 lt!252513))))))

(assert (=> d!53927 (= (bitIndex!0 (size!3455 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)) (currentBit!7157 (_3!523 lt!252513))) lt!252585)))

(declare-fun b!160081 () Bool)

(declare-fun res!133597 () Bool)

(assert (=> b!160081 (=> (not res!133597) (not e!109511))))

(assert (=> b!160081 (= res!133597 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!252585))))

(declare-fun b!160082 () Bool)

(declare-fun lt!252589 () (_ BitVec 64))

(assert (=> b!160082 (= e!109511 (bvsle lt!252585 (bvmul lt!252589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!160082 (or (= lt!252589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!252589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!252589)))))

(assert (=> b!160082 (= lt!252589 ((_ sign_extend 32) (size!3455 (buf!3913 (_3!523 lt!252513)))))))

(assert (= (and d!53927 res!133596) b!160081))

(assert (= (and b!160081 res!133597) b!160082))

(declare-fun m!252685 () Bool)

(assert (=> d!53927 m!252685))

(declare-fun m!252687 () Bool)

(assert (=> d!53927 m!252687))

(assert (=> b!160031 d!53927))

(declare-fun d!53929 () Bool)

(declare-fun e!109512 () Bool)

(assert (=> d!53929 e!109512))

(declare-fun res!133598 () Bool)

(assert (=> d!53929 (=> (not res!133598) (not e!109512))))

(declare-fun lt!252593 () (_ BitVec 64))

(declare-fun lt!252592 () (_ BitVec 64))

(declare-fun lt!252591 () (_ BitVec 64))

(assert (=> d!53929 (= res!133598 (= lt!252591 (bvsub lt!252593 lt!252592)))))

(assert (=> d!53929 (or (= (bvand lt!252593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!252592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!252593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!252593 lt!252592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53929 (= lt!252592 (remainingBits!0 ((_ sign_extend 32) (size!3455 (buf!3913 thiss!1602))) ((_ sign_extend 32) (currentByte!7162 thiss!1602)) ((_ sign_extend 32) (currentBit!7157 thiss!1602))))))

(declare-fun lt!252594 () (_ BitVec 64))

(declare-fun lt!252590 () (_ BitVec 64))

(assert (=> d!53929 (= lt!252593 (bvmul lt!252594 lt!252590))))

(assert (=> d!53929 (or (= lt!252594 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!252590 (bvsdiv (bvmul lt!252594 lt!252590) lt!252594)))))

(assert (=> d!53929 (= lt!252590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!53929 (= lt!252594 ((_ sign_extend 32) (size!3455 (buf!3913 thiss!1602))))))

(assert (=> d!53929 (= lt!252591 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7162 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7157 thiss!1602))))))

(assert (=> d!53929 (invariant!0 (currentBit!7157 thiss!1602) (currentByte!7162 thiss!1602) (size!3455 (buf!3913 thiss!1602)))))

(assert (=> d!53929 (= (bitIndex!0 (size!3455 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) (currentBit!7157 thiss!1602)) lt!252591)))

(declare-fun b!160083 () Bool)

(declare-fun res!133599 () Bool)

(assert (=> b!160083 (=> (not res!133599) (not e!109512))))

(assert (=> b!160083 (= res!133599 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!252591))))

(declare-fun b!160084 () Bool)

(declare-fun lt!252595 () (_ BitVec 64))

(assert (=> b!160084 (= e!109512 (bvsle lt!252591 (bvmul lt!252595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!160084 (or (= lt!252595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!252595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!252595)))))

(assert (=> b!160084 (= lt!252595 ((_ sign_extend 32) (size!3455 (buf!3913 thiss!1602))))))

(assert (= (and d!53929 res!133598) b!160083))

(assert (= (and b!160083 res!133599) b!160084))

(declare-fun m!252689 () Bool)

(assert (=> d!53929 m!252689))

(declare-fun m!252691 () Bool)

(assert (=> d!53929 m!252691))

(assert (=> b!160031 d!53929))

(declare-fun d!53931 () Bool)

(assert (=> d!53931 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3455 (buf!3913 (_1!7756 lt!252512)))) ((_ sign_extend 32) (currentByte!7162 (_1!7756 lt!252512))) ((_ sign_extend 32) (currentBit!7157 (_1!7756 lt!252512)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3455 (buf!3913 (_1!7756 lt!252512)))) ((_ sign_extend 32) (currentByte!7162 (_1!7756 lt!252512))) ((_ sign_extend 32) (currentBit!7157 (_1!7756 lt!252512)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13356 () Bool)

(assert (= bs!13356 d!53931))

(declare-fun m!252693 () Bool)

(assert (=> bs!13356 m!252693))

(assert (=> b!160027 d!53931))

(declare-fun d!53933 () Bool)

(declare-fun e!109531 () Bool)

(assert (=> d!53933 e!109531))

(declare-fun res!133621 () Bool)

(assert (=> d!53933 (=> (not res!133621) (not e!109531))))

(declare-fun lt!252643 () tuple2!14464)

(assert (=> d!53933 (= res!133621 (isPrefixOf!0 (_1!7756 lt!252643) (_2!7756 lt!252643)))))

(declare-fun lt!252642 () BitStream!6078)

(assert (=> d!53933 (= lt!252643 (tuple2!14465 lt!252642 (_3!523 lt!252513)))))

(declare-fun lt!252656 () Unit!10931)

(declare-fun lt!252650 () Unit!10931)

(assert (=> d!53933 (= lt!252656 lt!252650)))

(assert (=> d!53933 (isPrefixOf!0 lt!252642 (_3!523 lt!252513))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6078 BitStream!6078 BitStream!6078) Unit!10931)

(assert (=> d!53933 (= lt!252650 (lemmaIsPrefixTransitive!0 lt!252642 (_3!523 lt!252513) (_3!523 lt!252513)))))

(declare-fun lt!252655 () Unit!10931)

(declare-fun lt!252640 () Unit!10931)

(assert (=> d!53933 (= lt!252655 lt!252640)))

(assert (=> d!53933 (isPrefixOf!0 lt!252642 (_3!523 lt!252513))))

(assert (=> d!53933 (= lt!252640 (lemmaIsPrefixTransitive!0 lt!252642 thiss!1602 (_3!523 lt!252513)))))

(declare-fun lt!252652 () Unit!10931)

(declare-fun e!109530 () Unit!10931)

(assert (=> d!53933 (= lt!252652 e!109530)))

(declare-fun c!8456 () Bool)

(assert (=> d!53933 (= c!8456 (not (= (size!3455 (buf!3913 thiss!1602)) #b00000000000000000000000000000000)))))

(declare-fun lt!252639 () Unit!10931)

(declare-fun lt!252654 () Unit!10931)

(assert (=> d!53933 (= lt!252639 lt!252654)))

(assert (=> d!53933 (isPrefixOf!0 (_3!523 lt!252513) (_3!523 lt!252513))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6078) Unit!10931)

(assert (=> d!53933 (= lt!252654 (lemmaIsPrefixRefl!0 (_3!523 lt!252513)))))

(declare-fun lt!252646 () Unit!10931)

(declare-fun lt!252645 () Unit!10931)

(assert (=> d!53933 (= lt!252646 lt!252645)))

(assert (=> d!53933 (= lt!252645 (lemmaIsPrefixRefl!0 (_3!523 lt!252513)))))

(declare-fun lt!252647 () Unit!10931)

(declare-fun lt!252641 () Unit!10931)

(assert (=> d!53933 (= lt!252647 lt!252641)))

(assert (=> d!53933 (isPrefixOf!0 lt!252642 lt!252642)))

(assert (=> d!53933 (= lt!252641 (lemmaIsPrefixRefl!0 lt!252642))))

(declare-fun lt!252653 () Unit!10931)

(declare-fun lt!252651 () Unit!10931)

(assert (=> d!53933 (= lt!252653 lt!252651)))

(assert (=> d!53933 (isPrefixOf!0 thiss!1602 thiss!1602)))

(assert (=> d!53933 (= lt!252651 (lemmaIsPrefixRefl!0 thiss!1602))))

(assert (=> d!53933 (= lt!252642 (BitStream!6079 (buf!3913 (_3!523 lt!252513)) (currentByte!7162 thiss!1602) (currentBit!7157 thiss!1602)))))

(assert (=> d!53933 (isPrefixOf!0 thiss!1602 (_3!523 lt!252513))))

(assert (=> d!53933 (= (reader!0 thiss!1602 (_3!523 lt!252513)) lt!252643)))

(declare-fun b!160108 () Bool)

(declare-fun res!133619 () Bool)

(assert (=> b!160108 (=> (not res!133619) (not e!109531))))

(assert (=> b!160108 (= res!133619 (isPrefixOf!0 (_2!7756 lt!252643) (_3!523 lt!252513)))))

(declare-fun b!160109 () Bool)

(declare-fun lt!252657 () (_ BitVec 64))

(declare-fun lt!252644 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6078 (_ BitVec 64)) BitStream!6078)

(assert (=> b!160109 (= e!109531 (= (_1!7756 lt!252643) (withMovedBitIndex!0 (_2!7756 lt!252643) (bvsub lt!252657 lt!252644))))))

(assert (=> b!160109 (or (= (bvand lt!252657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!252644 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!252657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!252657 lt!252644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!160109 (= lt!252644 (bitIndex!0 (size!3455 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)) (currentBit!7157 (_3!523 lt!252513))))))

(assert (=> b!160109 (= lt!252657 (bitIndex!0 (size!3455 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) (currentBit!7157 thiss!1602)))))

(declare-fun b!160110 () Bool)

(declare-fun res!133620 () Bool)

(assert (=> b!160110 (=> (not res!133620) (not e!109531))))

(assert (=> b!160110 (= res!133620 (isPrefixOf!0 (_1!7756 lt!252643) thiss!1602))))

(declare-fun b!160111 () Bool)

(declare-fun Unit!10943 () Unit!10931)

(assert (=> b!160111 (= e!109530 Unit!10943)))

(declare-fun b!160112 () Bool)

(declare-fun lt!252649 () Unit!10931)

(assert (=> b!160112 (= e!109530 lt!252649)))

(declare-fun lt!252648 () (_ BitVec 64))

(assert (=> b!160112 (= lt!252648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!252658 () (_ BitVec 64))

(assert (=> b!160112 (= lt!252658 (bitIndex!0 (size!3455 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) (currentBit!7157 thiss!1602)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!7635 array!7635 (_ BitVec 64) (_ BitVec 64)) Unit!10931)

(assert (=> b!160112 (= lt!252649 (arrayBitRangesEqSymmetric!0 (buf!3913 thiss!1602) (buf!3913 (_3!523 lt!252513)) lt!252648 lt!252658))))

(declare-fun arrayBitRangesEq!0 (array!7635 array!7635 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!160112 (arrayBitRangesEq!0 (buf!3913 (_3!523 lt!252513)) (buf!3913 thiss!1602) lt!252648 lt!252658)))

(assert (= (and d!53933 c!8456) b!160112))

(assert (= (and d!53933 (not c!8456)) b!160111))

(assert (= (and d!53933 res!133621) b!160110))

(assert (= (and b!160110 res!133620) b!160108))

(assert (= (and b!160108 res!133619) b!160109))

(declare-fun m!252717 () Bool)

(assert (=> d!53933 m!252717))

(declare-fun m!252719 () Bool)

(assert (=> d!53933 m!252719))

(declare-fun m!252721 () Bool)

(assert (=> d!53933 m!252721))

(assert (=> d!53933 m!252577))

(declare-fun m!252723 () Bool)

(assert (=> d!53933 m!252723))

(declare-fun m!252725 () Bool)

(assert (=> d!53933 m!252725))

(declare-fun m!252727 () Bool)

(assert (=> d!53933 m!252727))

(declare-fun m!252729 () Bool)

(assert (=> d!53933 m!252729))

(declare-fun m!252731 () Bool)

(assert (=> d!53933 m!252731))

(declare-fun m!252733 () Bool)

(assert (=> d!53933 m!252733))

(declare-fun m!252735 () Bool)

(assert (=> d!53933 m!252735))

(declare-fun m!252737 () Bool)

(assert (=> b!160110 m!252737))

(declare-fun m!252739 () Bool)

(assert (=> b!160109 m!252739))

(assert (=> b!160109 m!252583))

(assert (=> b!160109 m!252585))

(declare-fun m!252741 () Bool)

(assert (=> b!160108 m!252741))

(assert (=> b!160112 m!252585))

(declare-fun m!252743 () Bool)

(assert (=> b!160112 m!252743))

(declare-fun m!252745 () Bool)

(assert (=> b!160112 m!252745))

(assert (=> b!160027 d!53933))

(declare-fun d!53951 () Bool)

(declare-fun res!133622 () Bool)

(declare-fun e!109532 () Bool)

(assert (=> d!53951 (=> res!133622 e!109532)))

(assert (=> d!53951 (= res!133622 (= #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)))))

(assert (=> d!53951 (= (arrayRangesEq!506 (buf!3913 thiss!1602) lt!252506 #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)) e!109532)))

(declare-fun b!160113 () Bool)

(declare-fun e!109533 () Bool)

(assert (=> b!160113 (= e!109532 e!109533)))

(declare-fun res!133623 () Bool)

(assert (=> b!160113 (=> (not res!133623) (not e!109533))))

(assert (=> b!160113 (= res!133623 (= (select (arr!4376 (buf!3913 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4376 lt!252506) #b00000000000000000000000000000000)))))

(declare-fun b!160114 () Bool)

(assert (=> b!160114 (= e!109533 (arrayRangesEq!506 (buf!3913 thiss!1602) lt!252506 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)))))

(assert (= (and d!53951 (not res!133622)) b!160113))

(assert (= (and b!160113 res!133623) b!160114))

(assert (=> b!160113 m!252657))

(declare-fun m!252747 () Bool)

(assert (=> b!160113 m!252747))

(declare-fun m!252749 () Bool)

(assert (=> b!160114 m!252749))

(assert (=> b!160032 d!53951))

(declare-fun d!53953 () Bool)

(declare-fun res!133624 () Bool)

(declare-fun e!109534 () Bool)

(assert (=> d!53953 (=> res!133624 e!109534)))

(assert (=> d!53953 (= res!133624 (= #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)))))

(assert (=> d!53953 (= (arrayRangesEq!506 (buf!3913 thiss!1602) (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) lt!252508) (size!3455 (buf!3913 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)) e!109534)))

(declare-fun b!160115 () Bool)

(declare-fun e!109535 () Bool)

(assert (=> b!160115 (= e!109534 e!109535)))

(declare-fun res!133625 () Bool)

(assert (=> b!160115 (=> (not res!133625) (not e!109535))))

(assert (=> b!160115 (= res!133625 (= (select (arr!4376 (buf!3913 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4376 (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) lt!252508) (size!3455 (buf!3913 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!160116 () Bool)

(assert (=> b!160116 (= e!109535 (arrayRangesEq!506 (buf!3913 thiss!1602) (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) lt!252508) (size!3455 (buf!3913 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)))))

(assert (= (and d!53953 (not res!133624)) b!160115))

(assert (= (and b!160115 res!133625) b!160116))

(assert (=> b!160115 m!252657))

(declare-fun m!252751 () Bool)

(assert (=> b!160115 m!252751))

(declare-fun m!252753 () Bool)

(assert (=> b!160116 m!252753))

(assert (=> b!160032 d!53953))

(declare-fun d!53955 () Bool)

(declare-fun e!109536 () Bool)

(assert (=> d!53955 e!109536))

(declare-fun res!133626 () Bool)

(assert (=> d!53955 (=> (not res!133626) (not e!109536))))

(assert (=> d!53955 (= res!133626 (and (bvsge (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) (size!3455 (buf!3913 thiss!1602)))))))

(declare-fun lt!252659 () Unit!10931)

(assert (=> d!53955 (= lt!252659 (choose!145 (buf!3913 thiss!1602) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) lt!252508))))

(assert (=> d!53955 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) (size!3455 (buf!3913 thiss!1602))))))

(assert (=> d!53955 (= (arrayUpdatedAtPrefixLemma!114 (buf!3913 thiss!1602) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) lt!252508) lt!252659)))

(declare-fun b!160117 () Bool)

(assert (=> b!160117 (= e!109536 (arrayRangesEq!506 (buf!3913 thiss!1602) (array!7636 (store (arr!4376 (buf!3913 thiss!1602)) (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001) lt!252508) (size!3455 (buf!3913 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7162 (_3!523 lt!252513)) #b00000000000000000000000000000001)))))

(assert (= (and d!53955 res!133626) b!160117))

(declare-fun m!252755 () Bool)

(assert (=> d!53955 m!252755))

(assert (=> b!160117 m!252561))

(assert (=> b!160117 m!252571))

(assert (=> b!160032 d!53955))

(declare-fun d!53957 () Bool)

(declare-fun res!133627 () Bool)

(declare-fun e!109537 () Bool)

(assert (=> d!53957 (=> res!133627 e!109537)))

(assert (=> d!53957 (= res!133627 (= #b00000000000000000000000000000000 (currentByte!7162 thiss!1602)))))

(assert (=> d!53957 (= (arrayRangesEq!506 (buf!3913 thiss!1602) (buf!3913 (_3!523 lt!252513)) #b00000000000000000000000000000000 (currentByte!7162 thiss!1602)) e!109537)))

(declare-fun b!160118 () Bool)

(declare-fun e!109538 () Bool)

(assert (=> b!160118 (= e!109537 e!109538)))

(declare-fun res!133628 () Bool)

(assert (=> b!160118 (=> (not res!133628) (not e!109538))))

(assert (=> b!160118 (= res!133628 (= (select (arr!4376 (buf!3913 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4376 (buf!3913 (_3!523 lt!252513))) #b00000000000000000000000000000000)))))

(declare-fun b!160119 () Bool)

(assert (=> b!160119 (= e!109538 (arrayRangesEq!506 (buf!3913 thiss!1602) (buf!3913 (_3!523 lt!252513)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7162 thiss!1602)))))

(assert (= (and d!53957 (not res!133627)) b!160118))

(assert (= (and b!160118 res!133628) b!160119))

(assert (=> b!160118 m!252657))

(assert (=> b!160118 m!252669))

(declare-fun m!252757 () Bool)

(assert (=> b!160119 m!252757))

(assert (=> b!160023 d!53957))

(declare-fun d!53959 () Bool)

(declare-fun res!133636 () Bool)

(declare-fun e!109544 () Bool)

(assert (=> d!53959 (=> (not res!133636) (not e!109544))))

(assert (=> d!53959 (= res!133636 (= (size!3455 (buf!3913 thiss!1602)) (size!3455 (buf!3913 (_3!523 lt!252513)))))))

(assert (=> d!53959 (= (isPrefixOf!0 thiss!1602 (_3!523 lt!252513)) e!109544)))

(declare-fun b!160126 () Bool)

(declare-fun res!133635 () Bool)

(assert (=> b!160126 (=> (not res!133635) (not e!109544))))

(assert (=> b!160126 (= res!133635 (bvsle (bitIndex!0 (size!3455 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) (currentBit!7157 thiss!1602)) (bitIndex!0 (size!3455 (buf!3913 (_3!523 lt!252513))) (currentByte!7162 (_3!523 lt!252513)) (currentBit!7157 (_3!523 lt!252513)))))))

(declare-fun b!160127 () Bool)

(declare-fun e!109543 () Bool)

(assert (=> b!160127 (= e!109544 e!109543)))

(declare-fun res!133637 () Bool)

(assert (=> b!160127 (=> res!133637 e!109543)))

(assert (=> b!160127 (= res!133637 (= (size!3455 (buf!3913 thiss!1602)) #b00000000000000000000000000000000))))

(declare-fun b!160128 () Bool)

(assert (=> b!160128 (= e!109543 (arrayBitRangesEq!0 (buf!3913 thiss!1602) (buf!3913 (_3!523 lt!252513)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3455 (buf!3913 thiss!1602)) (currentByte!7162 thiss!1602) (currentBit!7157 thiss!1602))))))

(assert (= (and d!53959 res!133636) b!160126))

(assert (= (and b!160126 res!133635) b!160127))

(assert (= (and b!160127 (not res!133637)) b!160128))

(assert (=> b!160126 m!252585))

(assert (=> b!160126 m!252583))

(assert (=> b!160128 m!252585))

(assert (=> b!160128 m!252585))

(declare-fun m!252759 () Bool)

(assert (=> b!160128 m!252759))

(assert (=> b!160028 d!53959))

(declare-fun d!53961 () Bool)

(assert (=> d!53961 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3455 (buf!3913 thiss!1602))) ((_ sign_extend 32) (currentByte!7162 thiss!1602)) ((_ sign_extend 32) (currentBit!7157 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3455 (buf!3913 thiss!1602))) ((_ sign_extend 32) (currentByte!7162 thiss!1602)) ((_ sign_extend 32) (currentBit!7157 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13359 () Bool)

(assert (= bs!13359 d!53961))

(assert (=> bs!13359 m!252689))

(assert (=> start!32460 d!53961))

(declare-fun d!53963 () Bool)

(assert (=> d!53963 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7157 thiss!1602) (currentByte!7162 thiss!1602) (size!3455 (buf!3913 thiss!1602))))))

(declare-fun bs!13360 () Bool)

(assert (= bs!13360 d!53963))

(assert (=> bs!13360 m!252691))

(assert (=> start!32460 d!53963))

(check-sat (not b!160126) (not b!160112) (not b!160076) (not d!53927) (not b!160072) (not d!53955) (not b!160108) (not b!160065) (not b!160074) (not d!53919) (not b!160114) (not b!160110) (not d!53915) (not d!53911) (not d!53929) (not d!53961) (not d!53963) (not b!160071) (not b!160119) (not b!160128) (not b!160116) (not b!160109) (not b!160117) (not d!53931) (not d!53933))
(check-sat)
