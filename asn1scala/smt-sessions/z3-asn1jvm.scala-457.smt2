; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12446 () Bool)

(assert start!12446)

(declare-datatypes ((array!2808 0))(
  ( (array!2809 (arr!1851 (Array (_ BitVec 32) (_ BitVec 8))) (size!1287 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2808)

(declare-fun e!42092 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!2232 0))(
  ( (BitStream!2233 (buf!1668 array!2808) (currentByte!3316 (_ BitVec 32)) (currentBit!3311 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5704 0))(
  ( (tuple2!5705 (_1!2963 BitStream!2232) (_2!2963 BitStream!2232)) )
))
(declare-fun lt!100193 () tuple2!5704)

(declare-datatypes ((Unit!4315 0))(
  ( (Unit!4316) )
))
(declare-datatypes ((tuple2!5706 0))(
  ( (tuple2!5707 (_1!2964 Unit!4315) (_2!2964 BitStream!2232)) )
))
(declare-fun lt!100196 () tuple2!5706)

(declare-fun b!63565 () Bool)

(declare-datatypes ((List!691 0))(
  ( (Nil!688) (Cons!687 (h!806 Bool) (t!1441 List!691)) )
))
(declare-fun head!510 (List!691) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2232 array!2808 (_ BitVec 64) (_ BitVec 64)) List!691)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2232 BitStream!2232 (_ BitVec 64)) List!691)

(assert (=> b!63565 (= e!42092 (= (head!510 (byteArrayBitContentToList!0 (_2!2964 lt!100196) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!510 (bitStreamReadBitsIntoList!0 (_2!2964 lt!100196) (_1!2963 lt!100193) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!63566 () Bool)

(declare-fun e!42085 () Bool)

(declare-fun e!42089 () Bool)

(assert (=> b!63566 (= e!42085 e!42089)))

(declare-fun res!52833 () Bool)

(assert (=> b!63566 (=> res!52833 e!42089)))

(declare-fun thiss!1379 () BitStream!2232)

(declare-fun isPrefixOf!0 (BitStream!2232 BitStream!2232) Bool)

(assert (=> b!63566 (= res!52833 (not (isPrefixOf!0 thiss!1379 (_2!2964 lt!100196))))))

(declare-fun lt!100187 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63566 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) lt!100187)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!63566 (= lt!100187 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100201 () Unit!4315)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2232 BitStream!2232 (_ BitVec 64) (_ BitVec 64)) Unit!4315)

(assert (=> b!63566 (= lt!100201 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2964 lt!100196) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2232 (_ BitVec 8) (_ BitVec 32)) tuple2!5706)

(assert (=> b!63566 (= lt!100196 (appendBitFromByte!0 thiss!1379 (select (arr!1851 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!63567 () Bool)

(declare-fun res!52819 () Bool)

(declare-fun e!42087 () Bool)

(assert (=> b!63567 (=> res!52819 e!42087)))

(declare-fun lt!100190 () tuple2!5704)

(declare-fun lt!100200 () tuple2!5704)

(assert (=> b!63567 (= res!52819 (not (isPrefixOf!0 (_1!2963 lt!100190) (_1!2963 lt!100200))))))

(declare-fun b!63568 () Bool)

(declare-fun res!52829 () Bool)

(assert (=> b!63568 (=> res!52829 e!42087)))

(declare-fun lt!100195 () List!691)

(declare-fun length!319 (List!691) Int)

(assert (=> b!63568 (= res!52829 (<= (length!319 lt!100195) 0))))

(declare-fun b!63569 () Bool)

(declare-fun e!42095 () Bool)

(declare-fun e!42093 () Bool)

(assert (=> b!63569 (= e!42095 e!42093)))

(declare-fun res!52826 () Bool)

(assert (=> b!63569 (=> res!52826 e!42093)))

(declare-fun lt!100192 () (_ BitVec 64))

(declare-fun lt!100191 () (_ BitVec 64))

(assert (=> b!63569 (= res!52826 (not (= lt!100191 (bvsub (bvadd lt!100192 to!314) i!635))))))

(declare-fun lt!100186 () tuple2!5706)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!63569 (= lt!100191 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100186))) (currentByte!3316 (_2!2964 lt!100186)) (currentBit!3311 (_2!2964 lt!100186))))))

(declare-fun b!63570 () Bool)

(declare-fun res!52818 () Bool)

(declare-fun e!42090 () Bool)

(assert (=> b!63570 (=> res!52818 e!42090)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!63570 (= res!52818 (not (invariant!0 (currentBit!3311 (_2!2964 lt!100196)) (currentByte!3316 (_2!2964 lt!100196)) (size!1287 (buf!1668 (_2!2964 lt!100186))))))))

(declare-fun b!63571 () Bool)

(declare-fun res!52828 () Bool)

(declare-fun e!42094 () Bool)

(assert (=> b!63571 (=> (not res!52828) (not e!42094))))

(assert (=> b!63571 (= res!52828 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 thiss!1379))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!63572 () Bool)

(assert (=> b!63572 (= e!42093 e!42090)))

(declare-fun res!52831 () Bool)

(assert (=> b!63572 (=> res!52831 e!42090)))

(assert (=> b!63572 (= res!52831 (not (= (size!1287 (buf!1668 (_2!2964 lt!100196))) (size!1287 (buf!1668 (_2!2964 lt!100186))))))))

(declare-fun e!42086 () Bool)

(assert (=> b!63572 e!42086))

(declare-fun res!52832 () Bool)

(assert (=> b!63572 (=> (not res!52832) (not e!42086))))

(assert (=> b!63572 (= res!52832 (= (size!1287 (buf!1668 (_2!2964 lt!100186))) (size!1287 (buf!1668 thiss!1379))))))

(declare-fun b!63573 () Bool)

(assert (=> b!63573 (= e!42086 (= lt!100191 (bvsub (bvsub (bvadd (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!52824 () Bool)

(assert (=> start!12446 (=> (not res!52824) (not e!42094))))

(assert (=> start!12446 (= res!52824 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1287 srcBuffer!2))))))))

(assert (=> start!12446 e!42094))

(assert (=> start!12446 true))

(declare-fun array_inv!1175 (array!2808) Bool)

(assert (=> start!12446 (array_inv!1175 srcBuffer!2)))

(declare-fun e!42084 () Bool)

(declare-fun inv!12 (BitStream!2232) Bool)

(assert (=> start!12446 (and (inv!12 thiss!1379) e!42084)))

(declare-fun b!63574 () Bool)

(declare-fun res!52823 () Bool)

(assert (=> b!63574 (=> res!52823 e!42087)))

(assert (=> b!63574 (= res!52823 (not (isPrefixOf!0 (_1!2963 lt!100190) (_2!2964 lt!100186))))))

(declare-fun b!63575 () Bool)

(assert (=> b!63575 (= e!42090 e!42087)))

(declare-fun res!52821 () Bool)

(assert (=> b!63575 (=> res!52821 e!42087)))

(assert (=> b!63575 (= res!52821 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100188 () List!691)

(assert (=> b!63575 (= lt!100188 (bitStreamReadBitsIntoList!0 (_2!2964 lt!100186) (_1!2963 lt!100200) lt!100187))))

(assert (=> b!63575 (= lt!100195 (bitStreamReadBitsIntoList!0 (_2!2964 lt!100186) (_1!2963 lt!100190) (bvsub to!314 i!635)))))

(assert (=> b!63575 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) lt!100187)))

(declare-fun lt!100189 () Unit!4315)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2232 array!2808 (_ BitVec 64)) Unit!4315)

(assert (=> b!63575 (= lt!100189 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2964 lt!100196) (buf!1668 (_2!2964 lt!100186)) lt!100187))))

(declare-fun reader!0 (BitStream!2232 BitStream!2232) tuple2!5704)

(assert (=> b!63575 (= lt!100200 (reader!0 (_2!2964 lt!100196) (_2!2964 lt!100186)))))

(assert (=> b!63575 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!100198 () Unit!4315)

(assert (=> b!63575 (= lt!100198 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1668 (_2!2964 lt!100186)) (bvsub to!314 i!635)))))

(assert (=> b!63575 (= lt!100190 (reader!0 thiss!1379 (_2!2964 lt!100186)))))

(declare-fun b!63576 () Bool)

(declare-fun res!52827 () Bool)

(assert (=> b!63576 (=> res!52827 e!42087)))

(assert (=> b!63576 (= res!52827 (not (isPrefixOf!0 (_1!2963 lt!100200) (_2!2964 lt!100186))))))

(declare-fun b!63577 () Bool)

(declare-fun res!52822 () Bool)

(assert (=> b!63577 (=> res!52822 e!42093)))

(assert (=> b!63577 (= res!52822 (not (invariant!0 (currentBit!3311 (_2!2964 lt!100186)) (currentByte!3316 (_2!2964 lt!100186)) (size!1287 (buf!1668 (_2!2964 lt!100186))))))))

(declare-fun b!63578 () Bool)

(assert (=> b!63578 (= e!42087 (or (not (= (buf!1668 (_1!2963 lt!100190)) (buf!1668 (_1!2963 lt!100200)))) (not (= (buf!1668 (_1!2963 lt!100190)) (buf!1668 (_2!2964 lt!100186)))) (bvslt lt!100191 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!63579 () Bool)

(assert (=> b!63579 (= e!42089 e!42095)))

(declare-fun res!52830 () Bool)

(assert (=> b!63579 (=> res!52830 e!42095)))

(assert (=> b!63579 (= res!52830 (not (isPrefixOf!0 (_2!2964 lt!100196) (_2!2964 lt!100186))))))

(assert (=> b!63579 (isPrefixOf!0 thiss!1379 (_2!2964 lt!100186))))

(declare-fun lt!100197 () Unit!4315)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2232 BitStream!2232 BitStream!2232) Unit!4315)

(assert (=> b!63579 (= lt!100197 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2964 lt!100196) (_2!2964 lt!100186)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2232 array!2808 (_ BitVec 64) (_ BitVec 64)) tuple2!5706)

(assert (=> b!63579 (= lt!100186 (appendBitsMSBFirstLoop!0 (_2!2964 lt!100196) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!63579 e!42092))

(declare-fun res!52816 () Bool)

(assert (=> b!63579 (=> (not res!52816) (not e!42092))))

(assert (=> b!63579 (= res!52816 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100194 () Unit!4315)

(assert (=> b!63579 (= lt!100194 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1668 (_2!2964 lt!100196)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!63579 (= lt!100193 (reader!0 thiss!1379 (_2!2964 lt!100196)))))

(declare-fun b!63580 () Bool)

(assert (=> b!63580 (= e!42094 (not e!42085))))

(declare-fun res!52825 () Bool)

(assert (=> b!63580 (=> res!52825 e!42085)))

(assert (=> b!63580 (= res!52825 (bvsge i!635 to!314))))

(assert (=> b!63580 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!100199 () Unit!4315)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2232) Unit!4315)

(assert (=> b!63580 (= lt!100199 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!63580 (= lt!100192 (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)))))

(declare-fun b!63581 () Bool)

(declare-fun res!52817 () Bool)

(assert (=> b!63581 (=> res!52817 e!42090)))

(assert (=> b!63581 (= res!52817 (not (invariant!0 (currentBit!3311 (_2!2964 lt!100196)) (currentByte!3316 (_2!2964 lt!100196)) (size!1287 (buf!1668 (_2!2964 lt!100196))))))))

(declare-fun b!63582 () Bool)

(declare-fun res!52820 () Bool)

(assert (=> b!63582 (=> res!52820 e!42093)))

(assert (=> b!63582 (= res!52820 (not (= (size!1287 (buf!1668 thiss!1379)) (size!1287 (buf!1668 (_2!2964 lt!100186))))))))

(declare-fun b!63583 () Bool)

(assert (=> b!63583 (= e!42084 (array_inv!1175 (buf!1668 thiss!1379)))))

(assert (= (and start!12446 res!52824) b!63571))

(assert (= (and b!63571 res!52828) b!63580))

(assert (= (and b!63580 (not res!52825)) b!63566))

(assert (= (and b!63566 (not res!52833)) b!63579))

(assert (= (and b!63579 res!52816) b!63565))

(assert (= (and b!63579 (not res!52830)) b!63569))

(assert (= (and b!63569 (not res!52826)) b!63577))

(assert (= (and b!63577 (not res!52822)) b!63582))

(assert (= (and b!63582 (not res!52820)) b!63572))

(assert (= (and b!63572 res!52832) b!63573))

(assert (= (and b!63572 (not res!52831)) b!63581))

(assert (= (and b!63581 (not res!52817)) b!63570))

(assert (= (and b!63570 (not res!52818)) b!63575))

(assert (= (and b!63575 (not res!52821)) b!63568))

(assert (= (and b!63568 (not res!52829)) b!63574))

(assert (= (and b!63574 (not res!52823)) b!63576))

(assert (= (and b!63576 (not res!52827)) b!63567))

(assert (= (and b!63567 (not res!52819)) b!63578))

(assert (= start!12446 b!63583))

(declare-fun m!100707 () Bool)

(assert (=> b!63573 m!100707))

(declare-fun m!100709 () Bool)

(assert (=> start!12446 m!100709))

(declare-fun m!100711 () Bool)

(assert (=> start!12446 m!100711))

(declare-fun m!100713 () Bool)

(assert (=> b!63579 m!100713))

(declare-fun m!100715 () Bool)

(assert (=> b!63579 m!100715))

(declare-fun m!100717 () Bool)

(assert (=> b!63579 m!100717))

(declare-fun m!100719 () Bool)

(assert (=> b!63579 m!100719))

(declare-fun m!100721 () Bool)

(assert (=> b!63579 m!100721))

(declare-fun m!100723 () Bool)

(assert (=> b!63579 m!100723))

(declare-fun m!100725 () Bool)

(assert (=> b!63579 m!100725))

(declare-fun m!100727 () Bool)

(assert (=> b!63568 m!100727))

(declare-fun m!100729 () Bool)

(assert (=> b!63577 m!100729))

(declare-fun m!100731 () Bool)

(assert (=> b!63571 m!100731))

(declare-fun m!100733 () Bool)

(assert (=> b!63566 m!100733))

(declare-fun m!100735 () Bool)

(assert (=> b!63566 m!100735))

(declare-fun m!100737 () Bool)

(assert (=> b!63566 m!100737))

(assert (=> b!63566 m!100733))

(declare-fun m!100739 () Bool)

(assert (=> b!63566 m!100739))

(declare-fun m!100741 () Bool)

(assert (=> b!63566 m!100741))

(declare-fun m!100743 () Bool)

(assert (=> b!63565 m!100743))

(assert (=> b!63565 m!100743))

(declare-fun m!100745 () Bool)

(assert (=> b!63565 m!100745))

(declare-fun m!100747 () Bool)

(assert (=> b!63565 m!100747))

(assert (=> b!63565 m!100747))

(declare-fun m!100749 () Bool)

(assert (=> b!63565 m!100749))

(declare-fun m!100751 () Bool)

(assert (=> b!63580 m!100751))

(declare-fun m!100753 () Bool)

(assert (=> b!63580 m!100753))

(declare-fun m!100755 () Bool)

(assert (=> b!63580 m!100755))

(declare-fun m!100757 () Bool)

(assert (=> b!63569 m!100757))

(declare-fun m!100759 () Bool)

(assert (=> b!63576 m!100759))

(declare-fun m!100761 () Bool)

(assert (=> b!63570 m!100761))

(declare-fun m!100763 () Bool)

(assert (=> b!63575 m!100763))

(declare-fun m!100765 () Bool)

(assert (=> b!63575 m!100765))

(declare-fun m!100767 () Bool)

(assert (=> b!63575 m!100767))

(declare-fun m!100769 () Bool)

(assert (=> b!63575 m!100769))

(declare-fun m!100771 () Bool)

(assert (=> b!63575 m!100771))

(declare-fun m!100773 () Bool)

(assert (=> b!63575 m!100773))

(declare-fun m!100775 () Bool)

(assert (=> b!63575 m!100775))

(declare-fun m!100777 () Bool)

(assert (=> b!63575 m!100777))

(declare-fun m!100779 () Bool)

(assert (=> b!63567 m!100779))

(declare-fun m!100781 () Bool)

(assert (=> b!63574 m!100781))

(declare-fun m!100783 () Bool)

(assert (=> b!63583 m!100783))

(declare-fun m!100785 () Bool)

(assert (=> b!63581 m!100785))

(check-sat (not b!63566) (not b!63575) (not b!63580) (not b!63573) (not b!63565) (not b!63571) (not b!63581) (not start!12446) (not b!63574) (not b!63579) (not b!63583) (not b!63577) (not b!63570) (not b!63569) (not b!63576) (not b!63568) (not b!63567))
(check-sat)
(get-model)

(declare-fun d!19754 () Bool)

(assert (=> d!19754 (= (head!510 (byteArrayBitContentToList!0 (_2!2964 lt!100196) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!806 (byteArrayBitContentToList!0 (_2!2964 lt!100196) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!63565 d!19754))

(declare-fun d!19756 () Bool)

(declare-fun c!4545 () Bool)

(assert (=> d!19756 (= c!4545 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42134 () List!691)

(assert (=> d!19756 (= (byteArrayBitContentToList!0 (_2!2964 lt!100196) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!42134)))

(declare-fun b!63645 () Bool)

(assert (=> b!63645 (= e!42134 Nil!688)))

(declare-fun b!63646 () Bool)

(assert (=> b!63646 (= e!42134 (Cons!687 (not (= (bvand ((_ sign_extend 24) (select (arr!1851 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2964 lt!100196) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19756 c!4545) b!63645))

(assert (= (and d!19756 (not c!4545)) b!63646))

(assert (=> b!63646 m!100733))

(declare-fun m!100867 () Bool)

(assert (=> b!63646 m!100867))

(declare-fun m!100869 () Bool)

(assert (=> b!63646 m!100869))

(assert (=> b!63565 d!19756))

(declare-fun d!19758 () Bool)

(assert (=> d!19758 (= (head!510 (bitStreamReadBitsIntoList!0 (_2!2964 lt!100196) (_1!2963 lt!100193) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!806 (bitStreamReadBitsIntoList!0 (_2!2964 lt!100196) (_1!2963 lt!100193) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!63565 d!19758))

(declare-fun b!63656 () Bool)

(declare-fun lt!100257 () (_ BitVec 64))

(declare-datatypes ((tuple2!5718 0))(
  ( (tuple2!5719 (_1!2970 Bool) (_2!2970 BitStream!2232)) )
))
(declare-fun lt!100258 () tuple2!5718)

(declare-datatypes ((tuple2!5720 0))(
  ( (tuple2!5721 (_1!2971 List!691) (_2!2971 BitStream!2232)) )
))
(declare-fun e!42140 () tuple2!5720)

(assert (=> b!63656 (= e!42140 (tuple2!5721 (Cons!687 (_1!2970 lt!100258) (bitStreamReadBitsIntoList!0 (_2!2964 lt!100196) (_2!2970 lt!100258) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!100257))) (_2!2970 lt!100258)))))

(declare-fun readBit!0 (BitStream!2232) tuple2!5718)

(assert (=> b!63656 (= lt!100258 (readBit!0 (_1!2963 lt!100193)))))

(assert (=> b!63656 (= lt!100257 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!63657 () Bool)

(declare-fun e!42139 () Bool)

(declare-fun lt!100256 () List!691)

(declare-fun isEmpty!196 (List!691) Bool)

(assert (=> b!63657 (= e!42139 (isEmpty!196 lt!100256))))

(declare-fun b!63658 () Bool)

(assert (=> b!63658 (= e!42139 (> (length!319 lt!100256) 0))))

(declare-fun d!19760 () Bool)

(assert (=> d!19760 e!42139))

(declare-fun c!4551 () Bool)

(assert (=> d!19760 (= c!4551 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19760 (= lt!100256 (_1!2971 e!42140))))

(declare-fun c!4550 () Bool)

(assert (=> d!19760 (= c!4550 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19760 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19760 (= (bitStreamReadBitsIntoList!0 (_2!2964 lt!100196) (_1!2963 lt!100193) #b0000000000000000000000000000000000000000000000000000000000000001) lt!100256)))

(declare-fun b!63655 () Bool)

(assert (=> b!63655 (= e!42140 (tuple2!5721 Nil!688 (_1!2963 lt!100193)))))

(assert (= (and d!19760 c!4550) b!63655))

(assert (= (and d!19760 (not c!4550)) b!63656))

(assert (= (and d!19760 c!4551) b!63657))

(assert (= (and d!19760 (not c!4551)) b!63658))

(declare-fun m!100871 () Bool)

(assert (=> b!63656 m!100871))

(declare-fun m!100873 () Bool)

(assert (=> b!63656 m!100873))

(declare-fun m!100875 () Bool)

(assert (=> b!63657 m!100875))

(declare-fun m!100877 () Bool)

(assert (=> b!63658 m!100877))

(assert (=> b!63565 d!19760))

(declare-fun d!19762 () Bool)

(assert (=> d!19762 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!100261 () Unit!4315)

(declare-fun choose!9 (BitStream!2232 array!2808 (_ BitVec 64) BitStream!2232) Unit!4315)

(assert (=> d!19762 (= lt!100261 (choose!9 thiss!1379 (buf!1668 (_2!2964 lt!100186)) (bvsub to!314 i!635) (BitStream!2233 (buf!1668 (_2!2964 lt!100186)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379))))))

(assert (=> d!19762 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1668 (_2!2964 lt!100186)) (bvsub to!314 i!635)) lt!100261)))

(declare-fun bs!4875 () Bool)

(assert (= bs!4875 d!19762))

(assert (=> bs!4875 m!100769))

(declare-fun m!100879 () Bool)

(assert (=> bs!4875 m!100879))

(assert (=> b!63575 d!19762))

(declare-fun b!63669 () Bool)

(declare-fun e!42145 () Unit!4315)

(declare-fun Unit!4327 () Unit!4315)

(assert (=> b!63669 (= e!42145 Unit!4327)))

(declare-fun b!63670 () Bool)

(declare-fun res!52895 () Bool)

(declare-fun e!42146 () Bool)

(assert (=> b!63670 (=> (not res!52895) (not e!42146))))

(declare-fun lt!100308 () tuple2!5704)

(assert (=> b!63670 (= res!52895 (isPrefixOf!0 (_1!2963 lt!100308) (_2!2964 lt!100196)))))

(declare-fun d!19764 () Bool)

(assert (=> d!19764 e!42146))

(declare-fun res!52896 () Bool)

(assert (=> d!19764 (=> (not res!52896) (not e!42146))))

(assert (=> d!19764 (= res!52896 (isPrefixOf!0 (_1!2963 lt!100308) (_2!2963 lt!100308)))))

(declare-fun lt!100313 () BitStream!2232)

(assert (=> d!19764 (= lt!100308 (tuple2!5705 lt!100313 (_2!2964 lt!100186)))))

(declare-fun lt!100320 () Unit!4315)

(declare-fun lt!100316 () Unit!4315)

(assert (=> d!19764 (= lt!100320 lt!100316)))

(assert (=> d!19764 (isPrefixOf!0 lt!100313 (_2!2964 lt!100186))))

(assert (=> d!19764 (= lt!100316 (lemmaIsPrefixTransitive!0 lt!100313 (_2!2964 lt!100186) (_2!2964 lt!100186)))))

(declare-fun lt!100315 () Unit!4315)

(declare-fun lt!100321 () Unit!4315)

(assert (=> d!19764 (= lt!100315 lt!100321)))

(assert (=> d!19764 (isPrefixOf!0 lt!100313 (_2!2964 lt!100186))))

(assert (=> d!19764 (= lt!100321 (lemmaIsPrefixTransitive!0 lt!100313 (_2!2964 lt!100196) (_2!2964 lt!100186)))))

(declare-fun lt!100312 () Unit!4315)

(assert (=> d!19764 (= lt!100312 e!42145)))

(declare-fun c!4554 () Bool)

(assert (=> d!19764 (= c!4554 (not (= (size!1287 (buf!1668 (_2!2964 lt!100196))) #b00000000000000000000000000000000)))))

(declare-fun lt!100319 () Unit!4315)

(declare-fun lt!100307 () Unit!4315)

(assert (=> d!19764 (= lt!100319 lt!100307)))

(assert (=> d!19764 (isPrefixOf!0 (_2!2964 lt!100186) (_2!2964 lt!100186))))

(assert (=> d!19764 (= lt!100307 (lemmaIsPrefixRefl!0 (_2!2964 lt!100186)))))

(declare-fun lt!100309 () Unit!4315)

(declare-fun lt!100303 () Unit!4315)

(assert (=> d!19764 (= lt!100309 lt!100303)))

(assert (=> d!19764 (= lt!100303 (lemmaIsPrefixRefl!0 (_2!2964 lt!100186)))))

(declare-fun lt!100304 () Unit!4315)

(declare-fun lt!100317 () Unit!4315)

(assert (=> d!19764 (= lt!100304 lt!100317)))

(assert (=> d!19764 (isPrefixOf!0 lt!100313 lt!100313)))

(assert (=> d!19764 (= lt!100317 (lemmaIsPrefixRefl!0 lt!100313))))

(declare-fun lt!100310 () Unit!4315)

(declare-fun lt!100314 () Unit!4315)

(assert (=> d!19764 (= lt!100310 lt!100314)))

(assert (=> d!19764 (isPrefixOf!0 (_2!2964 lt!100196) (_2!2964 lt!100196))))

(assert (=> d!19764 (= lt!100314 (lemmaIsPrefixRefl!0 (_2!2964 lt!100196)))))

(assert (=> d!19764 (= lt!100313 (BitStream!2233 (buf!1668 (_2!2964 lt!100186)) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))))))

(assert (=> d!19764 (isPrefixOf!0 (_2!2964 lt!100196) (_2!2964 lt!100186))))

(assert (=> d!19764 (= (reader!0 (_2!2964 lt!100196) (_2!2964 lt!100186)) lt!100308)))

(declare-fun b!63671 () Bool)

(declare-fun lt!100311 () Unit!4315)

(assert (=> b!63671 (= e!42145 lt!100311)))

(declare-fun lt!100318 () (_ BitVec 64))

(assert (=> b!63671 (= lt!100318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!100305 () (_ BitVec 64))

(assert (=> b!63671 (= lt!100305 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2808 array!2808 (_ BitVec 64) (_ BitVec 64)) Unit!4315)

(assert (=> b!63671 (= lt!100311 (arrayBitRangesEqSymmetric!0 (buf!1668 (_2!2964 lt!100196)) (buf!1668 (_2!2964 lt!100186)) lt!100318 lt!100305))))

(declare-fun arrayBitRangesEq!0 (array!2808 array!2808 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63671 (arrayBitRangesEq!0 (buf!1668 (_2!2964 lt!100186)) (buf!1668 (_2!2964 lt!100196)) lt!100318 lt!100305)))

(declare-fun lt!100306 () (_ BitVec 64))

(declare-fun lt!100302 () (_ BitVec 64))

(declare-fun b!63672 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2232 (_ BitVec 64)) BitStream!2232)

(assert (=> b!63672 (= e!42146 (= (_1!2963 lt!100308) (withMovedBitIndex!0 (_2!2963 lt!100308) (bvsub lt!100302 lt!100306))))))

(assert (=> b!63672 (or (= (bvand lt!100302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100306 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100302 lt!100306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63672 (= lt!100306 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100186))) (currentByte!3316 (_2!2964 lt!100186)) (currentBit!3311 (_2!2964 lt!100186))))))

(assert (=> b!63672 (= lt!100302 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))))))

(declare-fun b!63673 () Bool)

(declare-fun res!52894 () Bool)

(assert (=> b!63673 (=> (not res!52894) (not e!42146))))

(assert (=> b!63673 (= res!52894 (isPrefixOf!0 (_2!2963 lt!100308) (_2!2964 lt!100186)))))

(assert (= (and d!19764 c!4554) b!63671))

(assert (= (and d!19764 (not c!4554)) b!63669))

(assert (= (and d!19764 res!52896) b!63670))

(assert (= (and b!63670 res!52895) b!63673))

(assert (= (and b!63673 res!52894) b!63672))

(assert (=> b!63671 m!100707))

(declare-fun m!100881 () Bool)

(assert (=> b!63671 m!100881))

(declare-fun m!100883 () Bool)

(assert (=> b!63671 m!100883))

(declare-fun m!100885 () Bool)

(assert (=> d!19764 m!100885))

(assert (=> d!19764 m!100715))

(declare-fun m!100887 () Bool)

(assert (=> d!19764 m!100887))

(declare-fun m!100889 () Bool)

(assert (=> d!19764 m!100889))

(declare-fun m!100891 () Bool)

(assert (=> d!19764 m!100891))

(declare-fun m!100893 () Bool)

(assert (=> d!19764 m!100893))

(declare-fun m!100895 () Bool)

(assert (=> d!19764 m!100895))

(declare-fun m!100897 () Bool)

(assert (=> d!19764 m!100897))

(declare-fun m!100899 () Bool)

(assert (=> d!19764 m!100899))

(declare-fun m!100901 () Bool)

(assert (=> d!19764 m!100901))

(declare-fun m!100903 () Bool)

(assert (=> d!19764 m!100903))

(declare-fun m!100905 () Bool)

(assert (=> b!63670 m!100905))

(declare-fun m!100907 () Bool)

(assert (=> b!63672 m!100907))

(assert (=> b!63672 m!100757))

(assert (=> b!63672 m!100707))

(declare-fun m!100909 () Bool)

(assert (=> b!63673 m!100909))

(assert (=> b!63575 d!19764))

(declare-fun d!19766 () Bool)

(assert (=> d!19766 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) lt!100187)))

(declare-fun lt!100322 () Unit!4315)

(assert (=> d!19766 (= lt!100322 (choose!9 (_2!2964 lt!100196) (buf!1668 (_2!2964 lt!100186)) lt!100187 (BitStream!2233 (buf!1668 (_2!2964 lt!100186)) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196)))))))

(assert (=> d!19766 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2964 lt!100196) (buf!1668 (_2!2964 lt!100186)) lt!100187) lt!100322)))

(declare-fun bs!4876 () Bool)

(assert (= bs!4876 d!19766))

(assert (=> bs!4876 m!100773))

(declare-fun m!100911 () Bool)

(assert (=> bs!4876 m!100911))

(assert (=> b!63575 d!19766))

(declare-fun b!63674 () Bool)

(declare-fun e!42147 () Unit!4315)

(declare-fun Unit!4328 () Unit!4315)

(assert (=> b!63674 (= e!42147 Unit!4328)))

(declare-fun b!63675 () Bool)

(declare-fun res!52898 () Bool)

(declare-fun e!42148 () Bool)

(assert (=> b!63675 (=> (not res!52898) (not e!42148))))

(declare-fun lt!100329 () tuple2!5704)

(assert (=> b!63675 (= res!52898 (isPrefixOf!0 (_1!2963 lt!100329) thiss!1379))))

(declare-fun d!19768 () Bool)

(assert (=> d!19768 e!42148))

(declare-fun res!52899 () Bool)

(assert (=> d!19768 (=> (not res!52899) (not e!42148))))

(assert (=> d!19768 (= res!52899 (isPrefixOf!0 (_1!2963 lt!100329) (_2!2963 lt!100329)))))

(declare-fun lt!100334 () BitStream!2232)

(assert (=> d!19768 (= lt!100329 (tuple2!5705 lt!100334 (_2!2964 lt!100186)))))

(declare-fun lt!100341 () Unit!4315)

(declare-fun lt!100337 () Unit!4315)

(assert (=> d!19768 (= lt!100341 lt!100337)))

(assert (=> d!19768 (isPrefixOf!0 lt!100334 (_2!2964 lt!100186))))

(assert (=> d!19768 (= lt!100337 (lemmaIsPrefixTransitive!0 lt!100334 (_2!2964 lt!100186) (_2!2964 lt!100186)))))

(declare-fun lt!100336 () Unit!4315)

(declare-fun lt!100342 () Unit!4315)

(assert (=> d!19768 (= lt!100336 lt!100342)))

(assert (=> d!19768 (isPrefixOf!0 lt!100334 (_2!2964 lt!100186))))

(assert (=> d!19768 (= lt!100342 (lemmaIsPrefixTransitive!0 lt!100334 thiss!1379 (_2!2964 lt!100186)))))

(declare-fun lt!100333 () Unit!4315)

(assert (=> d!19768 (= lt!100333 e!42147)))

(declare-fun c!4555 () Bool)

(assert (=> d!19768 (= c!4555 (not (= (size!1287 (buf!1668 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!100340 () Unit!4315)

(declare-fun lt!100328 () Unit!4315)

(assert (=> d!19768 (= lt!100340 lt!100328)))

(assert (=> d!19768 (isPrefixOf!0 (_2!2964 lt!100186) (_2!2964 lt!100186))))

(assert (=> d!19768 (= lt!100328 (lemmaIsPrefixRefl!0 (_2!2964 lt!100186)))))

(declare-fun lt!100330 () Unit!4315)

(declare-fun lt!100324 () Unit!4315)

(assert (=> d!19768 (= lt!100330 lt!100324)))

(assert (=> d!19768 (= lt!100324 (lemmaIsPrefixRefl!0 (_2!2964 lt!100186)))))

(declare-fun lt!100325 () Unit!4315)

(declare-fun lt!100338 () Unit!4315)

(assert (=> d!19768 (= lt!100325 lt!100338)))

(assert (=> d!19768 (isPrefixOf!0 lt!100334 lt!100334)))

(assert (=> d!19768 (= lt!100338 (lemmaIsPrefixRefl!0 lt!100334))))

(declare-fun lt!100331 () Unit!4315)

(declare-fun lt!100335 () Unit!4315)

(assert (=> d!19768 (= lt!100331 lt!100335)))

(assert (=> d!19768 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19768 (= lt!100335 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19768 (= lt!100334 (BitStream!2233 (buf!1668 (_2!2964 lt!100186)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)))))

(assert (=> d!19768 (isPrefixOf!0 thiss!1379 (_2!2964 lt!100186))))

(assert (=> d!19768 (= (reader!0 thiss!1379 (_2!2964 lt!100186)) lt!100329)))

(declare-fun b!63676 () Bool)

(declare-fun lt!100332 () Unit!4315)

(assert (=> b!63676 (= e!42147 lt!100332)))

(declare-fun lt!100339 () (_ BitVec 64))

(assert (=> b!63676 (= lt!100339 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!100326 () (_ BitVec 64))

(assert (=> b!63676 (= lt!100326 (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)))))

(assert (=> b!63676 (= lt!100332 (arrayBitRangesEqSymmetric!0 (buf!1668 thiss!1379) (buf!1668 (_2!2964 lt!100186)) lt!100339 lt!100326))))

(assert (=> b!63676 (arrayBitRangesEq!0 (buf!1668 (_2!2964 lt!100186)) (buf!1668 thiss!1379) lt!100339 lt!100326)))

(declare-fun lt!100323 () (_ BitVec 64))

(declare-fun b!63677 () Bool)

(declare-fun lt!100327 () (_ BitVec 64))

(assert (=> b!63677 (= e!42148 (= (_1!2963 lt!100329) (withMovedBitIndex!0 (_2!2963 lt!100329) (bvsub lt!100323 lt!100327))))))

(assert (=> b!63677 (or (= (bvand lt!100323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100323 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100323 lt!100327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63677 (= lt!100327 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100186))) (currentByte!3316 (_2!2964 lt!100186)) (currentBit!3311 (_2!2964 lt!100186))))))

(assert (=> b!63677 (= lt!100323 (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)))))

(declare-fun b!63678 () Bool)

(declare-fun res!52897 () Bool)

(assert (=> b!63678 (=> (not res!52897) (not e!42148))))

(assert (=> b!63678 (= res!52897 (isPrefixOf!0 (_2!2963 lt!100329) (_2!2964 lt!100186)))))

(assert (= (and d!19768 c!4555) b!63676))

(assert (= (and d!19768 (not c!4555)) b!63674))

(assert (= (and d!19768 res!52899) b!63675))

(assert (= (and b!63675 res!52898) b!63678))

(assert (= (and b!63678 res!52897) b!63677))

(assert (=> b!63676 m!100755))

(declare-fun m!100913 () Bool)

(assert (=> b!63676 m!100913))

(declare-fun m!100915 () Bool)

(assert (=> b!63676 m!100915))

(declare-fun m!100917 () Bool)

(assert (=> d!19768 m!100917))

(assert (=> d!19768 m!100713))

(declare-fun m!100919 () Bool)

(assert (=> d!19768 m!100919))

(declare-fun m!100921 () Bool)

(assert (=> d!19768 m!100921))

(assert (=> d!19768 m!100891))

(declare-fun m!100923 () Bool)

(assert (=> d!19768 m!100923))

(assert (=> d!19768 m!100753))

(declare-fun m!100925 () Bool)

(assert (=> d!19768 m!100925))

(assert (=> d!19768 m!100899))

(assert (=> d!19768 m!100751))

(declare-fun m!100927 () Bool)

(assert (=> d!19768 m!100927))

(declare-fun m!100929 () Bool)

(assert (=> b!63675 m!100929))

(declare-fun m!100931 () Bool)

(assert (=> b!63677 m!100931))

(assert (=> b!63677 m!100757))

(assert (=> b!63677 m!100755))

(declare-fun m!100933 () Bool)

(assert (=> b!63678 m!100933))

(assert (=> b!63575 d!19768))

(declare-fun d!19770 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19770 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) lt!100187) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196)))) lt!100187))))

(declare-fun bs!4877 () Bool)

(assert (= bs!4877 d!19770))

(declare-fun m!100935 () Bool)

(assert (=> bs!4877 m!100935))

(assert (=> b!63575 d!19770))

(declare-fun b!63680 () Bool)

(declare-fun lt!100345 () tuple2!5718)

(declare-fun e!42150 () tuple2!5720)

(declare-fun lt!100344 () (_ BitVec 64))

(assert (=> b!63680 (= e!42150 (tuple2!5721 (Cons!687 (_1!2970 lt!100345) (bitStreamReadBitsIntoList!0 (_2!2964 lt!100186) (_2!2970 lt!100345) (bvsub (bvsub to!314 i!635) lt!100344))) (_2!2970 lt!100345)))))

(assert (=> b!63680 (= lt!100345 (readBit!0 (_1!2963 lt!100190)))))

(assert (=> b!63680 (= lt!100344 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!63681 () Bool)

(declare-fun e!42149 () Bool)

(declare-fun lt!100343 () List!691)

(assert (=> b!63681 (= e!42149 (isEmpty!196 lt!100343))))

(declare-fun b!63682 () Bool)

(assert (=> b!63682 (= e!42149 (> (length!319 lt!100343) 0))))

(declare-fun d!19772 () Bool)

(assert (=> d!19772 e!42149))

(declare-fun c!4557 () Bool)

(assert (=> d!19772 (= c!4557 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19772 (= lt!100343 (_1!2971 e!42150))))

(declare-fun c!4556 () Bool)

(assert (=> d!19772 (= c!4556 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19772 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19772 (= (bitStreamReadBitsIntoList!0 (_2!2964 lt!100186) (_1!2963 lt!100190) (bvsub to!314 i!635)) lt!100343)))

(declare-fun b!63679 () Bool)

(assert (=> b!63679 (= e!42150 (tuple2!5721 Nil!688 (_1!2963 lt!100190)))))

(assert (= (and d!19772 c!4556) b!63679))

(assert (= (and d!19772 (not c!4556)) b!63680))

(assert (= (and d!19772 c!4557) b!63681))

(assert (= (and d!19772 (not c!4557)) b!63682))

(declare-fun m!100937 () Bool)

(assert (=> b!63680 m!100937))

(declare-fun m!100939 () Bool)

(assert (=> b!63680 m!100939))

(declare-fun m!100941 () Bool)

(assert (=> b!63681 m!100941))

(declare-fun m!100943 () Bool)

(assert (=> b!63682 m!100943))

(assert (=> b!63575 d!19772))

(declare-fun d!19774 () Bool)

(assert (=> d!19774 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4878 () Bool)

(assert (= bs!4878 d!19774))

(declare-fun m!100945 () Bool)

(assert (=> bs!4878 m!100945))

(assert (=> b!63575 d!19774))

(declare-fun lt!100347 () (_ BitVec 64))

(declare-fun b!63684 () Bool)

(declare-fun e!42152 () tuple2!5720)

(declare-fun lt!100348 () tuple2!5718)

(assert (=> b!63684 (= e!42152 (tuple2!5721 (Cons!687 (_1!2970 lt!100348) (bitStreamReadBitsIntoList!0 (_2!2964 lt!100186) (_2!2970 lt!100348) (bvsub lt!100187 lt!100347))) (_2!2970 lt!100348)))))

(assert (=> b!63684 (= lt!100348 (readBit!0 (_1!2963 lt!100200)))))

(assert (=> b!63684 (= lt!100347 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!63685 () Bool)

(declare-fun e!42151 () Bool)

(declare-fun lt!100346 () List!691)

(assert (=> b!63685 (= e!42151 (isEmpty!196 lt!100346))))

(declare-fun b!63686 () Bool)

(assert (=> b!63686 (= e!42151 (> (length!319 lt!100346) 0))))

(declare-fun d!19776 () Bool)

(assert (=> d!19776 e!42151))

(declare-fun c!4559 () Bool)

(assert (=> d!19776 (= c!4559 (= lt!100187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19776 (= lt!100346 (_1!2971 e!42152))))

(declare-fun c!4558 () Bool)

(assert (=> d!19776 (= c!4558 (= lt!100187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19776 (bvsge lt!100187 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19776 (= (bitStreamReadBitsIntoList!0 (_2!2964 lt!100186) (_1!2963 lt!100200) lt!100187) lt!100346)))

(declare-fun b!63683 () Bool)

(assert (=> b!63683 (= e!42152 (tuple2!5721 Nil!688 (_1!2963 lt!100200)))))

(assert (= (and d!19776 c!4558) b!63683))

(assert (= (and d!19776 (not c!4558)) b!63684))

(assert (= (and d!19776 c!4559) b!63685))

(assert (= (and d!19776 (not c!4559)) b!63686))

(declare-fun m!100947 () Bool)

(assert (=> b!63684 m!100947))

(declare-fun m!100949 () Bool)

(assert (=> b!63684 m!100949))

(declare-fun m!100951 () Bool)

(assert (=> b!63685 m!100951))

(declare-fun m!100953 () Bool)

(assert (=> b!63686 m!100953))

(assert (=> b!63575 d!19776))

(declare-fun d!19778 () Bool)

(assert (=> d!19778 (= (invariant!0 (currentBit!3311 (_2!2964 lt!100186)) (currentByte!3316 (_2!2964 lt!100186)) (size!1287 (buf!1668 (_2!2964 lt!100186)))) (and (bvsge (currentBit!3311 (_2!2964 lt!100186)) #b00000000000000000000000000000000) (bvslt (currentBit!3311 (_2!2964 lt!100186)) #b00000000000000000000000000001000) (bvsge (currentByte!3316 (_2!2964 lt!100186)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3316 (_2!2964 lt!100186)) (size!1287 (buf!1668 (_2!2964 lt!100186)))) (and (= (currentBit!3311 (_2!2964 lt!100186)) #b00000000000000000000000000000000) (= (currentByte!3316 (_2!2964 lt!100186)) (size!1287 (buf!1668 (_2!2964 lt!100186))))))))))

(assert (=> b!63577 d!19778))

(declare-fun d!19780 () Bool)

(declare-fun res!52908 () Bool)

(declare-fun e!42158 () Bool)

(assert (=> d!19780 (=> (not res!52908) (not e!42158))))

(assert (=> d!19780 (= res!52908 (= (size!1287 (buf!1668 thiss!1379)) (size!1287 (buf!1668 (_2!2964 lt!100196)))))))

(assert (=> d!19780 (= (isPrefixOf!0 thiss!1379 (_2!2964 lt!100196)) e!42158)))

(declare-fun b!63693 () Bool)

(declare-fun res!52907 () Bool)

(assert (=> b!63693 (=> (not res!52907) (not e!42158))))

(assert (=> b!63693 (= res!52907 (bvsle (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)) (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196)))))))

(declare-fun b!63694 () Bool)

(declare-fun e!42157 () Bool)

(assert (=> b!63694 (= e!42158 e!42157)))

(declare-fun res!52906 () Bool)

(assert (=> b!63694 (=> res!52906 e!42157)))

(assert (=> b!63694 (= res!52906 (= (size!1287 (buf!1668 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63695 () Bool)

(assert (=> b!63695 (= e!42157 (arrayBitRangesEq!0 (buf!1668 thiss!1379) (buf!1668 (_2!2964 lt!100196)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379))))))

(assert (= (and d!19780 res!52908) b!63693))

(assert (= (and b!63693 res!52907) b!63694))

(assert (= (and b!63694 (not res!52906)) b!63695))

(assert (=> b!63693 m!100755))

(assert (=> b!63693 m!100707))

(assert (=> b!63695 m!100755))

(assert (=> b!63695 m!100755))

(declare-fun m!100955 () Bool)

(assert (=> b!63695 m!100955))

(assert (=> b!63566 d!19780))

(declare-fun d!19782 () Bool)

(assert (=> d!19782 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) lt!100187) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196)))) lt!100187))))

(declare-fun bs!4879 () Bool)

(assert (= bs!4879 d!19782))

(declare-fun m!100957 () Bool)

(assert (=> bs!4879 m!100957))

(assert (=> b!63566 d!19782))

(declare-fun d!19784 () Bool)

(declare-fun e!42161 () Bool)

(assert (=> d!19784 e!42161))

(declare-fun res!52911 () Bool)

(assert (=> d!19784 (=> (not res!52911) (not e!42161))))

(assert (=> d!19784 (= res!52911 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!100351 () Unit!4315)

(declare-fun choose!27 (BitStream!2232 BitStream!2232 (_ BitVec 64) (_ BitVec 64)) Unit!4315)

(assert (=> d!19784 (= lt!100351 (choose!27 thiss!1379 (_2!2964 lt!100196) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19784 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19784 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2964 lt!100196) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!100351)))

(declare-fun b!63698 () Bool)

(assert (=> b!63698 (= e!42161 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19784 res!52911) b!63698))

(declare-fun m!100959 () Bool)

(assert (=> d!19784 m!100959))

(declare-fun m!100961 () Bool)

(assert (=> b!63698 m!100961))

(assert (=> b!63566 d!19784))

(declare-fun d!19786 () Bool)

(declare-fun e!42194 () Bool)

(assert (=> d!19786 e!42194))

(declare-fun res!52949 () Bool)

(assert (=> d!19786 (=> (not res!52949) (not e!42194))))

(declare-fun lt!100416 () tuple2!5706)

(assert (=> d!19786 (= res!52949 (= (size!1287 (buf!1668 (_2!2964 lt!100416))) (size!1287 (buf!1668 thiss!1379))))))

(declare-fun lt!100419 () (_ BitVec 8))

(declare-fun lt!100409 () array!2808)

(assert (=> d!19786 (= lt!100419 (select (arr!1851 lt!100409) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19786 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1287 lt!100409)))))

(assert (=> d!19786 (= lt!100409 (array!2809 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!100417 () tuple2!5706)

(assert (=> d!19786 (= lt!100416 (tuple2!5707 (_1!2964 lt!100417) (_2!2964 lt!100417)))))

(declare-fun lt!100413 () tuple2!5706)

(assert (=> d!19786 (= lt!100417 lt!100413)))

(declare-fun e!42193 () Bool)

(assert (=> d!19786 e!42193))

(declare-fun res!52953 () Bool)

(assert (=> d!19786 (=> (not res!52953) (not e!42193))))

(assert (=> d!19786 (= res!52953 (= (size!1287 (buf!1668 thiss!1379)) (size!1287 (buf!1668 (_2!2964 lt!100413)))))))

(declare-fun lt!100415 () Bool)

(declare-fun appendBit!0 (BitStream!2232 Bool) tuple2!5706)

(assert (=> d!19786 (= lt!100413 (appendBit!0 thiss!1379 lt!100415))))

(assert (=> d!19786 (= lt!100415 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1851 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19786 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19786 (= (appendBitFromByte!0 thiss!1379 (select (arr!1851 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!100416)))

(declare-fun b!63755 () Bool)

(declare-fun e!42195 () Bool)

(declare-datatypes ((tuple2!5724 0))(
  ( (tuple2!5725 (_1!2973 BitStream!2232) (_2!2973 Bool)) )
))
(declare-fun lt!100414 () tuple2!5724)

(assert (=> b!63755 (= e!42195 (= (bitIndex!0 (size!1287 (buf!1668 (_1!2973 lt!100414))) (currentByte!3316 (_1!2973 lt!100414)) (currentBit!3311 (_1!2973 lt!100414))) (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100416))) (currentByte!3316 (_2!2964 lt!100416)) (currentBit!3311 (_2!2964 lt!100416)))))))

(declare-fun b!63756 () Bool)

(declare-fun res!52955 () Bool)

(assert (=> b!63756 (=> (not res!52955) (not e!42194))))

(declare-fun lt!100410 () (_ BitVec 64))

(declare-fun lt!100420 () (_ BitVec 64))

(assert (=> b!63756 (= res!52955 (= (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100416))) (currentByte!3316 (_2!2964 lt!100416)) (currentBit!3311 (_2!2964 lt!100416))) (bvadd lt!100420 lt!100410)))))

(assert (=> b!63756 (or (not (= (bvand lt!100420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100410 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!100420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!100420 lt!100410) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63756 (= lt!100410 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!63756 (= lt!100420 (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)))))

(declare-fun b!63757 () Bool)

(assert (=> b!63757 (= e!42194 e!42195)))

(declare-fun res!52956 () Bool)

(assert (=> b!63757 (=> (not res!52956) (not e!42195))))

(assert (=> b!63757 (= res!52956 (and (= (_2!2973 lt!100414) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1851 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!100419)) #b00000000000000000000000000000000))) (= (_1!2973 lt!100414) (_2!2964 lt!100416))))))

(declare-datatypes ((tuple2!5726 0))(
  ( (tuple2!5727 (_1!2974 array!2808) (_2!2974 BitStream!2232)) )
))
(declare-fun lt!100418 () tuple2!5726)

(declare-fun lt!100412 () BitStream!2232)

(declare-fun readBits!0 (BitStream!2232 (_ BitVec 64)) tuple2!5726)

(assert (=> b!63757 (= lt!100418 (readBits!0 lt!100412 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2232) tuple2!5724)

(assert (=> b!63757 (= lt!100414 (readBitPure!0 lt!100412))))

(declare-fun readerFrom!0 (BitStream!2232 (_ BitVec 32) (_ BitVec 32)) BitStream!2232)

(assert (=> b!63757 (= lt!100412 (readerFrom!0 (_2!2964 lt!100416) (currentBit!3311 thiss!1379) (currentByte!3316 thiss!1379)))))

(declare-fun b!63758 () Bool)

(declare-fun e!42192 () Bool)

(declare-fun lt!100411 () tuple2!5724)

(assert (=> b!63758 (= e!42192 (= (bitIndex!0 (size!1287 (buf!1668 (_1!2973 lt!100411))) (currentByte!3316 (_1!2973 lt!100411)) (currentBit!3311 (_1!2973 lt!100411))) (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100413))) (currentByte!3316 (_2!2964 lt!100413)) (currentBit!3311 (_2!2964 lt!100413)))))))

(declare-fun b!63759 () Bool)

(declare-fun res!52950 () Bool)

(assert (=> b!63759 (=> (not res!52950) (not e!42193))))

(assert (=> b!63759 (= res!52950 (isPrefixOf!0 thiss!1379 (_2!2964 lt!100413)))))

(declare-fun b!63760 () Bool)

(declare-fun res!52954 () Bool)

(assert (=> b!63760 (=> (not res!52954) (not e!42194))))

(assert (=> b!63760 (= res!52954 (isPrefixOf!0 thiss!1379 (_2!2964 lt!100416)))))

(declare-fun b!63761 () Bool)

(assert (=> b!63761 (= e!42193 e!42192)))

(declare-fun res!52952 () Bool)

(assert (=> b!63761 (=> (not res!52952) (not e!42192))))

(assert (=> b!63761 (= res!52952 (and (= (_2!2973 lt!100411) lt!100415) (= (_1!2973 lt!100411) (_2!2964 lt!100413))))))

(assert (=> b!63761 (= lt!100411 (readBitPure!0 (readerFrom!0 (_2!2964 lt!100413) (currentBit!3311 thiss!1379) (currentByte!3316 thiss!1379))))))

(declare-fun b!63762 () Bool)

(declare-fun res!52951 () Bool)

(assert (=> b!63762 (=> (not res!52951) (not e!42193))))

(assert (=> b!63762 (= res!52951 (= (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100413))) (currentByte!3316 (_2!2964 lt!100413)) (currentBit!3311 (_2!2964 lt!100413))) (bvadd (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19786 res!52953) b!63762))

(assert (= (and b!63762 res!52951) b!63759))

(assert (= (and b!63759 res!52950) b!63761))

(assert (= (and b!63761 res!52952) b!63758))

(assert (= (and d!19786 res!52949) b!63756))

(assert (= (and b!63756 res!52955) b!63760))

(assert (= (and b!63760 res!52954) b!63757))

(assert (= (and b!63757 res!52956) b!63755))

(declare-fun m!100997 () Bool)

(assert (=> b!63756 m!100997))

(assert (=> b!63756 m!100755))

(declare-fun m!100999 () Bool)

(assert (=> b!63760 m!100999))

(declare-fun m!101001 () Bool)

(assert (=> b!63759 m!101001))

(declare-fun m!101003 () Bool)

(assert (=> b!63757 m!101003))

(declare-fun m!101005 () Bool)

(assert (=> b!63757 m!101005))

(declare-fun m!101007 () Bool)

(assert (=> b!63757 m!101007))

(declare-fun m!101009 () Bool)

(assert (=> b!63755 m!101009))

(assert (=> b!63755 m!100997))

(declare-fun m!101011 () Bool)

(assert (=> d!19786 m!101011))

(declare-fun m!101013 () Bool)

(assert (=> d!19786 m!101013))

(assert (=> d!19786 m!100867))

(declare-fun m!101015 () Bool)

(assert (=> b!63758 m!101015))

(declare-fun m!101017 () Bool)

(assert (=> b!63758 m!101017))

(assert (=> b!63762 m!101017))

(assert (=> b!63762 m!100755))

(declare-fun m!101019 () Bool)

(assert (=> b!63761 m!101019))

(assert (=> b!63761 m!101019))

(declare-fun m!101021 () Bool)

(assert (=> b!63761 m!101021))

(assert (=> b!63566 d!19786))

(declare-fun d!19818 () Bool)

(declare-fun res!52959 () Bool)

(declare-fun e!42197 () Bool)

(assert (=> d!19818 (=> (not res!52959) (not e!42197))))

(assert (=> d!19818 (= res!52959 (= (size!1287 (buf!1668 (_1!2963 lt!100200))) (size!1287 (buf!1668 (_2!2964 lt!100186)))))))

(assert (=> d!19818 (= (isPrefixOf!0 (_1!2963 lt!100200) (_2!2964 lt!100186)) e!42197)))

(declare-fun b!63763 () Bool)

(declare-fun res!52958 () Bool)

(assert (=> b!63763 (=> (not res!52958) (not e!42197))))

(assert (=> b!63763 (= res!52958 (bvsle (bitIndex!0 (size!1287 (buf!1668 (_1!2963 lt!100200))) (currentByte!3316 (_1!2963 lt!100200)) (currentBit!3311 (_1!2963 lt!100200))) (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100186))) (currentByte!3316 (_2!2964 lt!100186)) (currentBit!3311 (_2!2964 lt!100186)))))))

(declare-fun b!63764 () Bool)

(declare-fun e!42196 () Bool)

(assert (=> b!63764 (= e!42197 e!42196)))

(declare-fun res!52957 () Bool)

(assert (=> b!63764 (=> res!52957 e!42196)))

(assert (=> b!63764 (= res!52957 (= (size!1287 (buf!1668 (_1!2963 lt!100200))) #b00000000000000000000000000000000))))

(declare-fun b!63765 () Bool)

(assert (=> b!63765 (= e!42196 (arrayBitRangesEq!0 (buf!1668 (_1!2963 lt!100200)) (buf!1668 (_2!2964 lt!100186)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1287 (buf!1668 (_1!2963 lt!100200))) (currentByte!3316 (_1!2963 lt!100200)) (currentBit!3311 (_1!2963 lt!100200)))))))

(assert (= (and d!19818 res!52959) b!63763))

(assert (= (and b!63763 res!52958) b!63764))

(assert (= (and b!63764 (not res!52957)) b!63765))

(declare-fun m!101023 () Bool)

(assert (=> b!63763 m!101023))

(assert (=> b!63763 m!100757))

(assert (=> b!63765 m!101023))

(assert (=> b!63765 m!101023))

(declare-fun m!101025 () Bool)

(assert (=> b!63765 m!101025))

(assert (=> b!63576 d!19818))

(declare-fun d!19820 () Bool)

(declare-fun res!52962 () Bool)

(declare-fun e!42199 () Bool)

(assert (=> d!19820 (=> (not res!52962) (not e!42199))))

(assert (=> d!19820 (= res!52962 (= (size!1287 (buf!1668 (_1!2963 lt!100190))) (size!1287 (buf!1668 (_1!2963 lt!100200)))))))

(assert (=> d!19820 (= (isPrefixOf!0 (_1!2963 lt!100190) (_1!2963 lt!100200)) e!42199)))

(declare-fun b!63766 () Bool)

(declare-fun res!52961 () Bool)

(assert (=> b!63766 (=> (not res!52961) (not e!42199))))

(assert (=> b!63766 (= res!52961 (bvsle (bitIndex!0 (size!1287 (buf!1668 (_1!2963 lt!100190))) (currentByte!3316 (_1!2963 lt!100190)) (currentBit!3311 (_1!2963 lt!100190))) (bitIndex!0 (size!1287 (buf!1668 (_1!2963 lt!100200))) (currentByte!3316 (_1!2963 lt!100200)) (currentBit!3311 (_1!2963 lt!100200)))))))

(declare-fun b!63767 () Bool)

(declare-fun e!42198 () Bool)

(assert (=> b!63767 (= e!42199 e!42198)))

(declare-fun res!52960 () Bool)

(assert (=> b!63767 (=> res!52960 e!42198)))

(assert (=> b!63767 (= res!52960 (= (size!1287 (buf!1668 (_1!2963 lt!100190))) #b00000000000000000000000000000000))))

(declare-fun b!63768 () Bool)

(assert (=> b!63768 (= e!42198 (arrayBitRangesEq!0 (buf!1668 (_1!2963 lt!100190)) (buf!1668 (_1!2963 lt!100200)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1287 (buf!1668 (_1!2963 lt!100190))) (currentByte!3316 (_1!2963 lt!100190)) (currentBit!3311 (_1!2963 lt!100190)))))))

(assert (= (and d!19820 res!52962) b!63766))

(assert (= (and b!63766 res!52961) b!63767))

(assert (= (and b!63767 (not res!52960)) b!63768))

(declare-fun m!101027 () Bool)

(assert (=> b!63766 m!101027))

(assert (=> b!63766 m!101023))

(assert (=> b!63768 m!101027))

(assert (=> b!63768 m!101027))

(declare-fun m!101029 () Bool)

(assert (=> b!63768 m!101029))

(assert (=> b!63567 d!19820))

(declare-fun d!19822 () Bool)

(declare-fun e!42202 () Bool)

(assert (=> d!19822 e!42202))

(declare-fun res!52967 () Bool)

(assert (=> d!19822 (=> (not res!52967) (not e!42202))))

(declare-fun lt!100437 () (_ BitVec 64))

(declare-fun lt!100438 () (_ BitVec 64))

(declare-fun lt!100434 () (_ BitVec 64))

(assert (=> d!19822 (= res!52967 (= lt!100437 (bvsub lt!100434 lt!100438)))))

(assert (=> d!19822 (or (= (bvand lt!100434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100434 lt!100438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19822 (= lt!100438 (remainingBits!0 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100186))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100186)))))))

(declare-fun lt!100433 () (_ BitVec 64))

(declare-fun lt!100436 () (_ BitVec 64))

(assert (=> d!19822 (= lt!100434 (bvmul lt!100433 lt!100436))))

(assert (=> d!19822 (or (= lt!100433 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!100436 (bvsdiv (bvmul lt!100433 lt!100436) lt!100433)))))

(assert (=> d!19822 (= lt!100436 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19822 (= lt!100433 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))))))

(assert (=> d!19822 (= lt!100437 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100186))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100186)))))))

(assert (=> d!19822 (invariant!0 (currentBit!3311 (_2!2964 lt!100186)) (currentByte!3316 (_2!2964 lt!100186)) (size!1287 (buf!1668 (_2!2964 lt!100186))))))

(assert (=> d!19822 (= (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100186))) (currentByte!3316 (_2!2964 lt!100186)) (currentBit!3311 (_2!2964 lt!100186))) lt!100437)))

(declare-fun b!63773 () Bool)

(declare-fun res!52968 () Bool)

(assert (=> b!63773 (=> (not res!52968) (not e!42202))))

(assert (=> b!63773 (= res!52968 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!100437))))

(declare-fun b!63774 () Bool)

(declare-fun lt!100435 () (_ BitVec 64))

(assert (=> b!63774 (= e!42202 (bvsle lt!100437 (bvmul lt!100435 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63774 (or (= lt!100435 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!100435 #b0000000000000000000000000000000000000000000000000000000000001000) lt!100435)))))

(assert (=> b!63774 (= lt!100435 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100186)))))))

(assert (= (and d!19822 res!52967) b!63773))

(assert (= (and b!63773 res!52968) b!63774))

(declare-fun m!101031 () Bool)

(assert (=> d!19822 m!101031))

(assert (=> d!19822 m!100729))

(assert (=> b!63569 d!19822))

(declare-fun d!19824 () Bool)

(declare-fun res!52971 () Bool)

(declare-fun e!42204 () Bool)

(assert (=> d!19824 (=> (not res!52971) (not e!42204))))

(assert (=> d!19824 (= res!52971 (= (size!1287 (buf!1668 (_2!2964 lt!100196))) (size!1287 (buf!1668 (_2!2964 lt!100186)))))))

(assert (=> d!19824 (= (isPrefixOf!0 (_2!2964 lt!100196) (_2!2964 lt!100186)) e!42204)))

(declare-fun b!63775 () Bool)

(declare-fun res!52970 () Bool)

(assert (=> b!63775 (=> (not res!52970) (not e!42204))))

(assert (=> b!63775 (= res!52970 (bvsle (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))) (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100186))) (currentByte!3316 (_2!2964 lt!100186)) (currentBit!3311 (_2!2964 lt!100186)))))))

(declare-fun b!63776 () Bool)

(declare-fun e!42203 () Bool)

(assert (=> b!63776 (= e!42204 e!42203)))

(declare-fun res!52969 () Bool)

(assert (=> b!63776 (=> res!52969 e!42203)))

(assert (=> b!63776 (= res!52969 (= (size!1287 (buf!1668 (_2!2964 lt!100196))) #b00000000000000000000000000000000))))

(declare-fun b!63777 () Bool)

(assert (=> b!63777 (= e!42203 (arrayBitRangesEq!0 (buf!1668 (_2!2964 lt!100196)) (buf!1668 (_2!2964 lt!100186)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196)))))))

(assert (= (and d!19824 res!52971) b!63775))

(assert (= (and b!63775 res!52970) b!63776))

(assert (= (and b!63776 (not res!52969)) b!63777))

(assert (=> b!63775 m!100707))

(assert (=> b!63775 m!100757))

(assert (=> b!63777 m!100707))

(assert (=> b!63777 m!100707))

(declare-fun m!101033 () Bool)

(assert (=> b!63777 m!101033))

(assert (=> b!63579 d!19824))

(declare-fun b!63939 () Bool)

(declare-fun res!53100 () Bool)

(declare-fun e!42283 () Bool)

(assert (=> b!63939 (=> (not res!53100) (not e!42283))))

(declare-fun lt!100927 () tuple2!5706)

(assert (=> b!63939 (= res!53100 (= (size!1287 (buf!1668 (_2!2964 lt!100196))) (size!1287 (buf!1668 (_2!2964 lt!100927)))))))

(declare-fun b!63940 () Bool)

(declare-fun e!42285 () tuple2!5706)

(declare-fun lt!100948 () tuple2!5706)

(declare-fun Unit!4330 () Unit!4315)

(assert (=> b!63940 (= e!42285 (tuple2!5707 Unit!4330 (_2!2964 lt!100948)))))

(declare-fun lt!100945 () tuple2!5706)

(assert (=> b!63940 (= lt!100945 (appendBitFromByte!0 (_2!2964 lt!100196) (select (arr!1851 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!100918 () (_ BitVec 64))

(assert (=> b!63940 (= lt!100918 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!100944 () (_ BitVec 64))

(assert (=> b!63940 (= lt!100944 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!100929 () Unit!4315)

(assert (=> b!63940 (= lt!100929 (validateOffsetBitsIneqLemma!0 (_2!2964 lt!100196) (_2!2964 lt!100945) lt!100918 lt!100944))))

(assert (=> b!63940 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100945)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100945))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100945))) (bvsub lt!100918 lt!100944))))

(declare-fun lt!100950 () Unit!4315)

(assert (=> b!63940 (= lt!100950 lt!100929)))

(declare-fun lt!100952 () tuple2!5704)

(declare-fun call!814 () tuple2!5704)

(assert (=> b!63940 (= lt!100952 call!814)))

(declare-fun lt!100917 () (_ BitVec 64))

(assert (=> b!63940 (= lt!100917 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!100939 () Unit!4315)

(assert (=> b!63940 (= lt!100939 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2964 lt!100196) (buf!1668 (_2!2964 lt!100945)) lt!100917))))

(assert (=> b!63940 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100945)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) lt!100917)))

(declare-fun lt!100916 () Unit!4315)

(assert (=> b!63940 (= lt!100916 lt!100939)))

(assert (=> b!63940 (= (head!510 (byteArrayBitContentToList!0 (_2!2964 lt!100945) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!510 (bitStreamReadBitsIntoList!0 (_2!2964 lt!100945) (_1!2963 lt!100952) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!100934 () Unit!4315)

(declare-fun Unit!4332 () Unit!4315)

(assert (=> b!63940 (= lt!100934 Unit!4332)))

(assert (=> b!63940 (= lt!100948 (appendBitsMSBFirstLoop!0 (_2!2964 lt!100945) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!100949 () Unit!4315)

(assert (=> b!63940 (= lt!100949 (lemmaIsPrefixTransitive!0 (_2!2964 lt!100196) (_2!2964 lt!100945) (_2!2964 lt!100948)))))

(assert (=> b!63940 (isPrefixOf!0 (_2!2964 lt!100196) (_2!2964 lt!100948))))

(declare-fun lt!100932 () Unit!4315)

(assert (=> b!63940 (= lt!100932 lt!100949)))

(assert (=> b!63940 (= (size!1287 (buf!1668 (_2!2964 lt!100948))) (size!1287 (buf!1668 (_2!2964 lt!100196))))))

(declare-fun lt!100914 () Unit!4315)

(declare-fun Unit!4333 () Unit!4315)

(assert (=> b!63940 (= lt!100914 Unit!4333)))

(assert (=> b!63940 (= (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100948))) (currentByte!3316 (_2!2964 lt!100948)) (currentBit!3311 (_2!2964 lt!100948))) (bvsub (bvadd (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!100936 () Unit!4315)

(declare-fun Unit!4334 () Unit!4315)

(assert (=> b!63940 (= lt!100936 Unit!4334)))

(assert (=> b!63940 (= (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100948))) (currentByte!3316 (_2!2964 lt!100948)) (currentBit!3311 (_2!2964 lt!100948))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100945))) (currentByte!3316 (_2!2964 lt!100945)) (currentBit!3311 (_2!2964 lt!100945))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100953 () Unit!4315)

(declare-fun Unit!4335 () Unit!4315)

(assert (=> b!63940 (= lt!100953 Unit!4335)))

(declare-fun lt!100930 () tuple2!5704)

(assert (=> b!63940 (= lt!100930 (reader!0 (_2!2964 lt!100196) (_2!2964 lt!100948)))))

(declare-fun lt!100931 () (_ BitVec 64))

(assert (=> b!63940 (= lt!100931 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!100920 () Unit!4315)

(assert (=> b!63940 (= lt!100920 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2964 lt!100196) (buf!1668 (_2!2964 lt!100948)) lt!100931))))

(assert (=> b!63940 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100948)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) lt!100931)))

(declare-fun lt!100951 () Unit!4315)

(assert (=> b!63940 (= lt!100951 lt!100920)))

(declare-fun lt!100937 () tuple2!5704)

(assert (=> b!63940 (= lt!100937 (reader!0 (_2!2964 lt!100945) (_2!2964 lt!100948)))))

(declare-fun lt!100926 () (_ BitVec 64))

(assert (=> b!63940 (= lt!100926 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100938 () Unit!4315)

(assert (=> b!63940 (= lt!100938 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2964 lt!100945) (buf!1668 (_2!2964 lt!100948)) lt!100926))))

(assert (=> b!63940 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100948)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100945))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100945))) lt!100926)))

(declare-fun lt!100942 () Unit!4315)

(assert (=> b!63940 (= lt!100942 lt!100938)))

(declare-fun lt!100924 () List!691)

(assert (=> b!63940 (= lt!100924 (byteArrayBitContentToList!0 (_2!2964 lt!100948) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!100921 () List!691)

(assert (=> b!63940 (= lt!100921 (byteArrayBitContentToList!0 (_2!2964 lt!100948) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!100923 () List!691)

(assert (=> b!63940 (= lt!100923 (bitStreamReadBitsIntoList!0 (_2!2964 lt!100948) (_1!2963 lt!100930) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!100922 () List!691)

(assert (=> b!63940 (= lt!100922 (bitStreamReadBitsIntoList!0 (_2!2964 lt!100948) (_1!2963 lt!100937) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!100940 () (_ BitVec 64))

(assert (=> b!63940 (= lt!100940 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!100943 () Unit!4315)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2232 BitStream!2232 BitStream!2232 BitStream!2232 (_ BitVec 64) List!691) Unit!4315)

(assert (=> b!63940 (= lt!100943 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2964 lt!100948) (_2!2964 lt!100948) (_1!2963 lt!100930) (_1!2963 lt!100937) lt!100940 lt!100923))))

(declare-fun tail!298 (List!691) List!691)

(assert (=> b!63940 (= (bitStreamReadBitsIntoList!0 (_2!2964 lt!100948) (_1!2963 lt!100937) (bvsub lt!100940 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!298 lt!100923))))

(declare-fun lt!100956 () Unit!4315)

(assert (=> b!63940 (= lt!100956 lt!100943)))

(declare-fun lt!100954 () Unit!4315)

(declare-fun lt!100919 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2808 array!2808 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4315)

(assert (=> b!63940 (= lt!100954 (arrayBitRangesEqImpliesEq!0 (buf!1668 (_2!2964 lt!100945)) (buf!1668 (_2!2964 lt!100948)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!100919 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100945))) (currentByte!3316 (_2!2964 lt!100945)) (currentBit!3311 (_2!2964 lt!100945)))))))

(declare-fun bitAt!0 (array!2808 (_ BitVec 64)) Bool)

(assert (=> b!63940 (= (bitAt!0 (buf!1668 (_2!2964 lt!100945)) lt!100919) (bitAt!0 (buf!1668 (_2!2964 lt!100948)) lt!100919))))

(declare-fun lt!100947 () Unit!4315)

(assert (=> b!63940 (= lt!100947 lt!100954)))

(declare-fun d!19826 () Bool)

(assert (=> d!19826 e!42283))

(declare-fun res!53102 () Bool)

(assert (=> d!19826 (=> (not res!53102) (not e!42283))))

(declare-fun lt!100933 () (_ BitVec 64))

(assert (=> d!19826 (= res!53102 (= (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100927))) (currentByte!3316 (_2!2964 lt!100927)) (currentBit!3311 (_2!2964 lt!100927))) (bvsub lt!100933 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19826 (or (= (bvand lt!100933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100933 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!100935 () (_ BitVec 64))

(assert (=> d!19826 (= lt!100933 (bvadd lt!100935 to!314))))

(assert (=> d!19826 (or (not (= (bvand lt!100935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!100935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!100935 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19826 (= lt!100935 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))))))

(assert (=> d!19826 (= lt!100927 e!42285)))

(declare-fun c!4586 () Bool)

(assert (=> d!19826 (= c!4586 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!100946 () Unit!4315)

(declare-fun lt!100915 () Unit!4315)

(assert (=> d!19826 (= lt!100946 lt!100915)))

(assert (=> d!19826 (isPrefixOf!0 (_2!2964 lt!100196) (_2!2964 lt!100196))))

(assert (=> d!19826 (= lt!100915 (lemmaIsPrefixRefl!0 (_2!2964 lt!100196)))))

(assert (=> d!19826 (= lt!100919 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))))))

(assert (=> d!19826 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19826 (= (appendBitsMSBFirstLoop!0 (_2!2964 lt!100196) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!100927)))

(declare-fun b!63941 () Bool)

(declare-fun res!53098 () Bool)

(assert (=> b!63941 (=> (not res!53098) (not e!42283))))

(assert (=> b!63941 (= res!53098 (isPrefixOf!0 (_2!2964 lt!100196) (_2!2964 lt!100927)))))

(declare-fun b!63942 () Bool)

(declare-fun res!53101 () Bool)

(assert (=> b!63942 (=> (not res!53101) (not e!42283))))

(assert (=> b!63942 (= res!53101 (= (size!1287 (buf!1668 (_2!2964 lt!100927))) (size!1287 (buf!1668 (_2!2964 lt!100196)))))))

(declare-fun bm!811 () Bool)

(assert (=> bm!811 (= call!814 (reader!0 (_2!2964 lt!100196) (ite c!4586 (_2!2964 lt!100945) (_2!2964 lt!100196))))))

(declare-fun b!63943 () Bool)

(declare-fun Unit!4336 () Unit!4315)

(assert (=> b!63943 (= e!42285 (tuple2!5707 Unit!4336 (_2!2964 lt!100196)))))

(assert (=> b!63943 (= (size!1287 (buf!1668 (_2!2964 lt!100196))) (size!1287 (buf!1668 (_2!2964 lt!100196))))))

(declare-fun lt!100925 () Unit!4315)

(declare-fun Unit!4337 () Unit!4315)

(assert (=> b!63943 (= lt!100925 Unit!4337)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2232 array!2808 array!2808 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63943 (checkByteArrayBitContent!0 (_2!2964 lt!100196) srcBuffer!2 (_1!2974 (readBits!0 (_1!2963 call!814) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!63944 () Bool)

(declare-fun e!42284 () Bool)

(declare-fun lt!100928 () (_ BitVec 64))

(assert (=> b!63944 (= e!42284 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) lt!100928))))

(declare-fun b!63945 () Bool)

(declare-fun res!53099 () Bool)

(assert (=> b!63945 (=> (not res!53099) (not e!42283))))

(assert (=> b!63945 (= res!53099 (invariant!0 (currentBit!3311 (_2!2964 lt!100927)) (currentByte!3316 (_2!2964 lt!100927)) (size!1287 (buf!1668 (_2!2964 lt!100927)))))))

(declare-fun lt!100955 () tuple2!5704)

(declare-fun b!63946 () Bool)

(assert (=> b!63946 (= e!42283 (= (bitStreamReadBitsIntoList!0 (_2!2964 lt!100927) (_1!2963 lt!100955) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2964 lt!100927) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!63946 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63946 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!100957 () Unit!4315)

(declare-fun lt!100941 () Unit!4315)

(assert (=> b!63946 (= lt!100957 lt!100941)))

(assert (=> b!63946 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100927)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196))) lt!100928)))

(assert (=> b!63946 (= lt!100941 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2964 lt!100196) (buf!1668 (_2!2964 lt!100927)) lt!100928))))

(assert (=> b!63946 e!42284))

(declare-fun res!53103 () Bool)

(assert (=> b!63946 (=> (not res!53103) (not e!42284))))

(assert (=> b!63946 (= res!53103 (and (= (size!1287 (buf!1668 (_2!2964 lt!100196))) (size!1287 (buf!1668 (_2!2964 lt!100927)))) (bvsge lt!100928 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63946 (= lt!100928 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!63946 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63946 (= lt!100955 (reader!0 (_2!2964 lt!100196) (_2!2964 lt!100927)))))

(assert (= (and d!19826 c!4586) b!63940))

(assert (= (and d!19826 (not c!4586)) b!63943))

(assert (= (or b!63940 b!63943) bm!811))

(assert (= (and d!19826 res!53102) b!63945))

(assert (= (and b!63945 res!53099) b!63939))

(assert (= (and b!63939 res!53100) b!63941))

(assert (= (and b!63941 res!53098) b!63942))

(assert (= (and b!63942 res!53101) b!63946))

(assert (= (and b!63946 res!53103) b!63944))

(declare-fun m!101319 () Bool)

(assert (=> b!63940 m!101319))

(declare-fun m!101321 () Bool)

(assert (=> b!63940 m!101321))

(declare-fun m!101323 () Bool)

(assert (=> b!63940 m!101323))

(declare-fun m!101325 () Bool)

(assert (=> b!63940 m!101325))

(declare-fun m!101327 () Bool)

(assert (=> b!63940 m!101327))

(declare-fun m!101329 () Bool)

(assert (=> b!63940 m!101329))

(declare-fun m!101331 () Bool)

(assert (=> b!63940 m!101331))

(declare-fun m!101333 () Bool)

(assert (=> b!63940 m!101333))

(declare-fun m!101335 () Bool)

(assert (=> b!63940 m!101335))

(declare-fun m!101337 () Bool)

(assert (=> b!63940 m!101337))

(declare-fun m!101339 () Bool)

(assert (=> b!63940 m!101339))

(declare-fun m!101341 () Bool)

(assert (=> b!63940 m!101341))

(declare-fun m!101343 () Bool)

(assert (=> b!63940 m!101343))

(declare-fun m!101345 () Bool)

(assert (=> b!63940 m!101345))

(declare-fun m!101347 () Bool)

(assert (=> b!63940 m!101347))

(declare-fun m!101349 () Bool)

(assert (=> b!63940 m!101349))

(declare-fun m!101351 () Bool)

(assert (=> b!63940 m!101351))

(declare-fun m!101353 () Bool)

(assert (=> b!63940 m!101353))

(assert (=> b!63940 m!100707))

(declare-fun m!101355 () Bool)

(assert (=> b!63940 m!101355))

(declare-fun m!101357 () Bool)

(assert (=> b!63940 m!101357))

(declare-fun m!101359 () Bool)

(assert (=> b!63940 m!101359))

(assert (=> b!63940 m!101347))

(declare-fun m!101361 () Bool)

(assert (=> b!63940 m!101361))

(declare-fun m!101363 () Bool)

(assert (=> b!63940 m!101363))

(declare-fun m!101365 () Bool)

(assert (=> b!63940 m!101365))

(assert (=> b!63940 m!101319))

(declare-fun m!101367 () Bool)

(assert (=> b!63940 m!101367))

(assert (=> b!63940 m!101333))

(declare-fun m!101369 () Bool)

(assert (=> b!63940 m!101369))

(assert (=> b!63940 m!101357))

(declare-fun m!101371 () Bool)

(assert (=> b!63940 m!101371))

(declare-fun m!101373 () Bool)

(assert (=> b!63940 m!101373))

(declare-fun m!101375 () Bool)

(assert (=> b!63940 m!101375))

(declare-fun m!101377 () Bool)

(assert (=> b!63940 m!101377))

(declare-fun m!101379 () Bool)

(assert (=> b!63940 m!101379))

(declare-fun m!101381 () Bool)

(assert (=> bm!811 m!101381))

(declare-fun m!101383 () Bool)

(assert (=> b!63945 m!101383))

(declare-fun m!101385 () Bool)

(assert (=> b!63941 m!101385))

(declare-fun m!101387 () Bool)

(assert (=> b!63944 m!101387))

(declare-fun m!101389 () Bool)

(assert (=> b!63946 m!101389))

(declare-fun m!101391 () Bool)

(assert (=> b!63946 m!101391))

(declare-fun m!101393 () Bool)

(assert (=> b!63946 m!101393))

(declare-fun m!101395 () Bool)

(assert (=> b!63946 m!101395))

(declare-fun m!101397 () Bool)

(assert (=> b!63946 m!101397))

(declare-fun m!101399 () Bool)

(assert (=> b!63943 m!101399))

(declare-fun m!101401 () Bool)

(assert (=> b!63943 m!101401))

(declare-fun m!101403 () Bool)

(assert (=> d!19826 m!101403))

(assert (=> d!19826 m!100707))

(assert (=> d!19826 m!100901))

(assert (=> d!19826 m!100895))

(assert (=> b!63579 d!19826))

(declare-fun d!19912 () Bool)

(assert (=> d!19912 (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!100978 () Unit!4315)

(assert (=> d!19912 (= lt!100978 (choose!9 thiss!1379 (buf!1668 (_2!2964 lt!100196)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2233 (buf!1668 (_2!2964 lt!100196)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379))))))

(assert (=> d!19912 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1668 (_2!2964 lt!100196)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!100978)))

(declare-fun bs!4900 () Bool)

(assert (= bs!4900 d!19912))

(assert (=> bs!4900 m!100721))

(declare-fun m!101405 () Bool)

(assert (=> bs!4900 m!101405))

(assert (=> b!63579 d!19912))

(declare-fun d!19914 () Bool)

(assert (=> d!19914 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4901 () Bool)

(assert (= bs!4901 d!19914))

(declare-fun m!101407 () Bool)

(assert (=> bs!4901 m!101407))

(assert (=> b!63579 d!19914))

(declare-fun d!19916 () Bool)

(assert (=> d!19916 (isPrefixOf!0 thiss!1379 (_2!2964 lt!100186))))

(declare-fun lt!101017 () Unit!4315)

(declare-fun choose!30 (BitStream!2232 BitStream!2232 BitStream!2232) Unit!4315)

(assert (=> d!19916 (= lt!101017 (choose!30 thiss!1379 (_2!2964 lt!100196) (_2!2964 lt!100186)))))

(assert (=> d!19916 (isPrefixOf!0 thiss!1379 (_2!2964 lt!100196))))

(assert (=> d!19916 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2964 lt!100196) (_2!2964 lt!100186)) lt!101017)))

(declare-fun bs!4902 () Bool)

(assert (= bs!4902 d!19916))

(assert (=> bs!4902 m!100713))

(declare-fun m!101409 () Bool)

(assert (=> bs!4902 m!101409))

(assert (=> bs!4902 m!100737))

(assert (=> b!63579 d!19916))

(declare-fun d!19918 () Bool)

(declare-fun res!53106 () Bool)

(declare-fun e!42289 () Bool)

(assert (=> d!19918 (=> (not res!53106) (not e!42289))))

(assert (=> d!19918 (= res!53106 (= (size!1287 (buf!1668 thiss!1379)) (size!1287 (buf!1668 (_2!2964 lt!100186)))))))

(assert (=> d!19918 (= (isPrefixOf!0 thiss!1379 (_2!2964 lt!100186)) e!42289)))

(declare-fun b!63951 () Bool)

(declare-fun res!53105 () Bool)

(assert (=> b!63951 (=> (not res!53105) (not e!42289))))

(assert (=> b!63951 (= res!53105 (bvsle (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)) (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100186))) (currentByte!3316 (_2!2964 lt!100186)) (currentBit!3311 (_2!2964 lt!100186)))))))

(declare-fun b!63952 () Bool)

(declare-fun e!42288 () Bool)

(assert (=> b!63952 (= e!42289 e!42288)))

(declare-fun res!53104 () Bool)

(assert (=> b!63952 (=> res!53104 e!42288)))

(assert (=> b!63952 (= res!53104 (= (size!1287 (buf!1668 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63953 () Bool)

(assert (=> b!63953 (= e!42288 (arrayBitRangesEq!0 (buf!1668 thiss!1379) (buf!1668 (_2!2964 lt!100186)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379))))))

(assert (= (and d!19918 res!53106) b!63951))

(assert (= (and b!63951 res!53105) b!63952))

(assert (= (and b!63952 (not res!53104)) b!63953))

(assert (=> b!63951 m!100755))

(assert (=> b!63951 m!100757))

(assert (=> b!63953 m!100755))

(assert (=> b!63953 m!100755))

(declare-fun m!101411 () Bool)

(assert (=> b!63953 m!101411))

(assert (=> b!63579 d!19918))

(declare-fun b!63954 () Bool)

(declare-fun e!42290 () Unit!4315)

(declare-fun Unit!4338 () Unit!4315)

(assert (=> b!63954 (= e!42290 Unit!4338)))

(declare-fun b!63955 () Bool)

(declare-fun res!53108 () Bool)

(declare-fun e!42291 () Bool)

(assert (=> b!63955 (=> (not res!53108) (not e!42291))))

(declare-fun lt!101044 () tuple2!5704)

(assert (=> b!63955 (= res!53108 (isPrefixOf!0 (_1!2963 lt!101044) thiss!1379))))

(declare-fun d!19920 () Bool)

(assert (=> d!19920 e!42291))

(declare-fun res!53109 () Bool)

(assert (=> d!19920 (=> (not res!53109) (not e!42291))))

(assert (=> d!19920 (= res!53109 (isPrefixOf!0 (_1!2963 lt!101044) (_2!2963 lt!101044)))))

(declare-fun lt!101049 () BitStream!2232)

(assert (=> d!19920 (= lt!101044 (tuple2!5705 lt!101049 (_2!2964 lt!100196)))))

(declare-fun lt!101056 () Unit!4315)

(declare-fun lt!101052 () Unit!4315)

(assert (=> d!19920 (= lt!101056 lt!101052)))

(assert (=> d!19920 (isPrefixOf!0 lt!101049 (_2!2964 lt!100196))))

(assert (=> d!19920 (= lt!101052 (lemmaIsPrefixTransitive!0 lt!101049 (_2!2964 lt!100196) (_2!2964 lt!100196)))))

(declare-fun lt!101051 () Unit!4315)

(declare-fun lt!101057 () Unit!4315)

(assert (=> d!19920 (= lt!101051 lt!101057)))

(assert (=> d!19920 (isPrefixOf!0 lt!101049 (_2!2964 lt!100196))))

(assert (=> d!19920 (= lt!101057 (lemmaIsPrefixTransitive!0 lt!101049 thiss!1379 (_2!2964 lt!100196)))))

(declare-fun lt!101048 () Unit!4315)

(assert (=> d!19920 (= lt!101048 e!42290)))

(declare-fun c!4589 () Bool)

(assert (=> d!19920 (= c!4589 (not (= (size!1287 (buf!1668 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!101055 () Unit!4315)

(declare-fun lt!101043 () Unit!4315)

(assert (=> d!19920 (= lt!101055 lt!101043)))

(assert (=> d!19920 (isPrefixOf!0 (_2!2964 lt!100196) (_2!2964 lt!100196))))

(assert (=> d!19920 (= lt!101043 (lemmaIsPrefixRefl!0 (_2!2964 lt!100196)))))

(declare-fun lt!101045 () Unit!4315)

(declare-fun lt!101039 () Unit!4315)

(assert (=> d!19920 (= lt!101045 lt!101039)))

(assert (=> d!19920 (= lt!101039 (lemmaIsPrefixRefl!0 (_2!2964 lt!100196)))))

(declare-fun lt!101040 () Unit!4315)

(declare-fun lt!101053 () Unit!4315)

(assert (=> d!19920 (= lt!101040 lt!101053)))

(assert (=> d!19920 (isPrefixOf!0 lt!101049 lt!101049)))

(assert (=> d!19920 (= lt!101053 (lemmaIsPrefixRefl!0 lt!101049))))

(declare-fun lt!101046 () Unit!4315)

(declare-fun lt!101050 () Unit!4315)

(assert (=> d!19920 (= lt!101046 lt!101050)))

(assert (=> d!19920 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19920 (= lt!101050 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19920 (= lt!101049 (BitStream!2233 (buf!1668 (_2!2964 lt!100196)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)))))

(assert (=> d!19920 (isPrefixOf!0 thiss!1379 (_2!2964 lt!100196))))

(assert (=> d!19920 (= (reader!0 thiss!1379 (_2!2964 lt!100196)) lt!101044)))

(declare-fun b!63956 () Bool)

(declare-fun lt!101047 () Unit!4315)

(assert (=> b!63956 (= e!42290 lt!101047)))

(declare-fun lt!101054 () (_ BitVec 64))

(assert (=> b!63956 (= lt!101054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101041 () (_ BitVec 64))

(assert (=> b!63956 (= lt!101041 (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)))))

(assert (=> b!63956 (= lt!101047 (arrayBitRangesEqSymmetric!0 (buf!1668 thiss!1379) (buf!1668 (_2!2964 lt!100196)) lt!101054 lt!101041))))

(assert (=> b!63956 (arrayBitRangesEq!0 (buf!1668 (_2!2964 lt!100196)) (buf!1668 thiss!1379) lt!101054 lt!101041)))

(declare-fun b!63957 () Bool)

(declare-fun lt!101038 () (_ BitVec 64))

(declare-fun lt!101042 () (_ BitVec 64))

(assert (=> b!63957 (= e!42291 (= (_1!2963 lt!101044) (withMovedBitIndex!0 (_2!2963 lt!101044) (bvsub lt!101038 lt!101042))))))

(assert (=> b!63957 (or (= (bvand lt!101038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101038 lt!101042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63957 (= lt!101042 (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))))))

(assert (=> b!63957 (= lt!101038 (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)))))

(declare-fun b!63958 () Bool)

(declare-fun res!53107 () Bool)

(assert (=> b!63958 (=> (not res!53107) (not e!42291))))

(assert (=> b!63958 (= res!53107 (isPrefixOf!0 (_2!2963 lt!101044) (_2!2964 lt!100196)))))

(assert (= (and d!19920 c!4589) b!63956))

(assert (= (and d!19920 (not c!4589)) b!63954))

(assert (= (and d!19920 res!53109) b!63955))

(assert (= (and b!63955 res!53108) b!63958))

(assert (= (and b!63958 res!53107) b!63957))

(assert (=> b!63956 m!100755))

(declare-fun m!101413 () Bool)

(assert (=> b!63956 m!101413))

(declare-fun m!101415 () Bool)

(assert (=> b!63956 m!101415))

(declare-fun m!101417 () Bool)

(assert (=> d!19920 m!101417))

(assert (=> d!19920 m!100737))

(declare-fun m!101419 () Bool)

(assert (=> d!19920 m!101419))

(declare-fun m!101421 () Bool)

(assert (=> d!19920 m!101421))

(assert (=> d!19920 m!100901))

(declare-fun m!101423 () Bool)

(assert (=> d!19920 m!101423))

(assert (=> d!19920 m!100753))

(declare-fun m!101425 () Bool)

(assert (=> d!19920 m!101425))

(assert (=> d!19920 m!100895))

(assert (=> d!19920 m!100751))

(declare-fun m!101427 () Bool)

(assert (=> d!19920 m!101427))

(declare-fun m!101429 () Bool)

(assert (=> b!63955 m!101429))

(declare-fun m!101431 () Bool)

(assert (=> b!63957 m!101431))

(assert (=> b!63957 m!100707))

(assert (=> b!63957 m!100755))

(declare-fun m!101433 () Bool)

(assert (=> b!63958 m!101433))

(assert (=> b!63579 d!19920))

(declare-fun d!19922 () Bool)

(declare-fun size!1290 (List!691) Int)

(assert (=> d!19922 (= (length!319 lt!100195) (size!1290 lt!100195))))

(declare-fun bs!4903 () Bool)

(assert (= bs!4903 d!19922))

(declare-fun m!101435 () Bool)

(assert (=> bs!4903 m!101435))

(assert (=> b!63568 d!19922))

(declare-fun d!19924 () Bool)

(assert (=> d!19924 (= (invariant!0 (currentBit!3311 (_2!2964 lt!100196)) (currentByte!3316 (_2!2964 lt!100196)) (size!1287 (buf!1668 (_2!2964 lt!100196)))) (and (bvsge (currentBit!3311 (_2!2964 lt!100196)) #b00000000000000000000000000000000) (bvslt (currentBit!3311 (_2!2964 lt!100196)) #b00000000000000000000000000001000) (bvsge (currentByte!3316 (_2!2964 lt!100196)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3316 (_2!2964 lt!100196)) (size!1287 (buf!1668 (_2!2964 lt!100196)))) (and (= (currentBit!3311 (_2!2964 lt!100196)) #b00000000000000000000000000000000) (= (currentByte!3316 (_2!2964 lt!100196)) (size!1287 (buf!1668 (_2!2964 lt!100196))))))))))

(assert (=> b!63581 d!19924))

(declare-fun d!19926 () Bool)

(assert (=> d!19926 (= (invariant!0 (currentBit!3311 (_2!2964 lt!100196)) (currentByte!3316 (_2!2964 lt!100196)) (size!1287 (buf!1668 (_2!2964 lt!100186)))) (and (bvsge (currentBit!3311 (_2!2964 lt!100196)) #b00000000000000000000000000000000) (bvslt (currentBit!3311 (_2!2964 lt!100196)) #b00000000000000000000000000001000) (bvsge (currentByte!3316 (_2!2964 lt!100196)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3316 (_2!2964 lt!100196)) (size!1287 (buf!1668 (_2!2964 lt!100186)))) (and (= (currentBit!3311 (_2!2964 lt!100196)) #b00000000000000000000000000000000) (= (currentByte!3316 (_2!2964 lt!100196)) (size!1287 (buf!1668 (_2!2964 lt!100186))))))))))

(assert (=> b!63570 d!19926))

(declare-fun d!19928 () Bool)

(declare-fun res!53112 () Bool)

(declare-fun e!42293 () Bool)

(assert (=> d!19928 (=> (not res!53112) (not e!42293))))

(assert (=> d!19928 (= res!53112 (= (size!1287 (buf!1668 thiss!1379)) (size!1287 (buf!1668 thiss!1379))))))

(assert (=> d!19928 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!42293)))

(declare-fun b!63959 () Bool)

(declare-fun res!53111 () Bool)

(assert (=> b!63959 (=> (not res!53111) (not e!42293))))

(assert (=> b!63959 (= res!53111 (bvsle (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)) (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379))))))

(declare-fun b!63960 () Bool)

(declare-fun e!42292 () Bool)

(assert (=> b!63960 (= e!42293 e!42292)))

(declare-fun res!53110 () Bool)

(assert (=> b!63960 (=> res!53110 e!42292)))

(assert (=> b!63960 (= res!53110 (= (size!1287 (buf!1668 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63961 () Bool)

(assert (=> b!63961 (= e!42292 (arrayBitRangesEq!0 (buf!1668 thiss!1379) (buf!1668 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379))))))

(assert (= (and d!19928 res!53112) b!63959))

(assert (= (and b!63959 res!53111) b!63960))

(assert (= (and b!63960 (not res!53110)) b!63961))

(assert (=> b!63959 m!100755))

(assert (=> b!63959 m!100755))

(assert (=> b!63961 m!100755))

(assert (=> b!63961 m!100755))

(declare-fun m!101437 () Bool)

(assert (=> b!63961 m!101437))

(assert (=> b!63580 d!19928))

(declare-fun d!19930 () Bool)

(assert (=> d!19930 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!101072 () Unit!4315)

(declare-fun choose!11 (BitStream!2232) Unit!4315)

(assert (=> d!19930 (= lt!101072 (choose!11 thiss!1379))))

(assert (=> d!19930 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!101072)))

(declare-fun bs!4905 () Bool)

(assert (= bs!4905 d!19930))

(assert (=> bs!4905 m!100751))

(declare-fun m!101439 () Bool)

(assert (=> bs!4905 m!101439))

(assert (=> b!63580 d!19930))

(declare-fun d!19932 () Bool)

(declare-fun e!42298 () Bool)

(assert (=> d!19932 e!42298))

(declare-fun res!53125 () Bool)

(assert (=> d!19932 (=> (not res!53125) (not e!42298))))

(declare-fun lt!101078 () (_ BitVec 64))

(declare-fun lt!101074 () (_ BitVec 64))

(declare-fun lt!101077 () (_ BitVec 64))

(assert (=> d!19932 (= res!53125 (= lt!101077 (bvsub lt!101074 lt!101078)))))

(assert (=> d!19932 (or (= (bvand lt!101074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101074 lt!101078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19932 (= lt!101078 (remainingBits!0 ((_ sign_extend 32) (size!1287 (buf!1668 thiss!1379))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379))))))

(declare-fun lt!101073 () (_ BitVec 64))

(declare-fun lt!101076 () (_ BitVec 64))

(assert (=> d!19932 (= lt!101074 (bvmul lt!101073 lt!101076))))

(assert (=> d!19932 (or (= lt!101073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101076 (bvsdiv (bvmul lt!101073 lt!101076) lt!101073)))))

(assert (=> d!19932 (= lt!101076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19932 (= lt!101073 ((_ sign_extend 32) (size!1287 (buf!1668 thiss!1379))))))

(assert (=> d!19932 (= lt!101077 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3316 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3311 thiss!1379))))))

(assert (=> d!19932 (invariant!0 (currentBit!3311 thiss!1379) (currentByte!3316 thiss!1379) (size!1287 (buf!1668 thiss!1379)))))

(assert (=> d!19932 (= (bitIndex!0 (size!1287 (buf!1668 thiss!1379)) (currentByte!3316 thiss!1379) (currentBit!3311 thiss!1379)) lt!101077)))

(declare-fun b!63974 () Bool)

(declare-fun res!53126 () Bool)

(assert (=> b!63974 (=> (not res!53126) (not e!42298))))

(assert (=> b!63974 (= res!53126 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101077))))

(declare-fun b!63975 () Bool)

(declare-fun lt!101075 () (_ BitVec 64))

(assert (=> b!63975 (= e!42298 (bvsle lt!101077 (bvmul lt!101075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63975 (or (= lt!101075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101075)))))

(assert (=> b!63975 (= lt!101075 ((_ sign_extend 32) (size!1287 (buf!1668 thiss!1379))))))

(assert (= (and d!19932 res!53125) b!63974))

(assert (= (and b!63974 res!53126) b!63975))

(declare-fun m!101441 () Bool)

(assert (=> d!19932 m!101441))

(declare-fun m!101443 () Bool)

(assert (=> d!19932 m!101443))

(assert (=> b!63580 d!19932))

(declare-fun d!19934 () Bool)

(assert (=> d!19934 (= (array_inv!1175 srcBuffer!2) (bvsge (size!1287 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12446 d!19934))

(declare-fun d!19936 () Bool)

(assert (=> d!19936 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3311 thiss!1379) (currentByte!3316 thiss!1379) (size!1287 (buf!1668 thiss!1379))))))

(declare-fun bs!4906 () Bool)

(assert (= bs!4906 d!19936))

(assert (=> bs!4906 m!101443))

(assert (=> start!12446 d!19936))

(declare-fun d!19938 () Bool)

(assert (=> d!19938 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1287 (buf!1668 thiss!1379))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1287 (buf!1668 thiss!1379))) ((_ sign_extend 32) (currentByte!3316 thiss!1379)) ((_ sign_extend 32) (currentBit!3311 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4907 () Bool)

(assert (= bs!4907 d!19938))

(assert (=> bs!4907 m!101441))

(assert (=> b!63571 d!19938))

(declare-fun d!19940 () Bool)

(declare-fun e!42299 () Bool)

(assert (=> d!19940 e!42299))

(declare-fun res!53127 () Bool)

(assert (=> d!19940 (=> (not res!53127) (not e!42299))))

(declare-fun lt!101083 () (_ BitVec 64))

(declare-fun lt!101080 () (_ BitVec 64))

(declare-fun lt!101084 () (_ BitVec 64))

(assert (=> d!19940 (= res!53127 (= lt!101083 (bvsub lt!101080 lt!101084)))))

(assert (=> d!19940 (or (= (bvand lt!101080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101080 lt!101084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19940 (= lt!101084 (remainingBits!0 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))) ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196)))))))

(declare-fun lt!101079 () (_ BitVec 64))

(declare-fun lt!101082 () (_ BitVec 64))

(assert (=> d!19940 (= lt!101080 (bvmul lt!101079 lt!101082))))

(assert (=> d!19940 (or (= lt!101079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101082 (bvsdiv (bvmul lt!101079 lt!101082) lt!101079)))))

(assert (=> d!19940 (= lt!101082 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19940 (= lt!101079 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))))))

(assert (=> d!19940 (= lt!101083 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3316 (_2!2964 lt!100196))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3311 (_2!2964 lt!100196)))))))

(assert (=> d!19940 (invariant!0 (currentBit!3311 (_2!2964 lt!100196)) (currentByte!3316 (_2!2964 lt!100196)) (size!1287 (buf!1668 (_2!2964 lt!100196))))))

(assert (=> d!19940 (= (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100196))) (currentByte!3316 (_2!2964 lt!100196)) (currentBit!3311 (_2!2964 lt!100196))) lt!101083)))

(declare-fun b!63976 () Bool)

(declare-fun res!53128 () Bool)

(assert (=> b!63976 (=> (not res!53128) (not e!42299))))

(assert (=> b!63976 (= res!53128 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101083))))

(declare-fun b!63977 () Bool)

(declare-fun lt!101081 () (_ BitVec 64))

(assert (=> b!63977 (= e!42299 (bvsle lt!101083 (bvmul lt!101081 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63977 (or (= lt!101081 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101081 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101081)))))

(assert (=> b!63977 (= lt!101081 ((_ sign_extend 32) (size!1287 (buf!1668 (_2!2964 lt!100196)))))))

(assert (= (and d!19940 res!53127) b!63976))

(assert (= (and b!63976 res!53128) b!63977))

(assert (=> d!19940 m!100957))

(assert (=> d!19940 m!100785))

(assert (=> b!63573 d!19940))

(declare-fun d!19942 () Bool)

(assert (=> d!19942 (= (array_inv!1175 (buf!1668 thiss!1379)) (bvsge (size!1287 (buf!1668 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!63583 d!19942))

(declare-fun d!19944 () Bool)

(declare-fun res!53131 () Bool)

(declare-fun e!42301 () Bool)

(assert (=> d!19944 (=> (not res!53131) (not e!42301))))

(assert (=> d!19944 (= res!53131 (= (size!1287 (buf!1668 (_1!2963 lt!100190))) (size!1287 (buf!1668 (_2!2964 lt!100186)))))))

(assert (=> d!19944 (= (isPrefixOf!0 (_1!2963 lt!100190) (_2!2964 lt!100186)) e!42301)))

(declare-fun b!63978 () Bool)

(declare-fun res!53130 () Bool)

(assert (=> b!63978 (=> (not res!53130) (not e!42301))))

(assert (=> b!63978 (= res!53130 (bvsle (bitIndex!0 (size!1287 (buf!1668 (_1!2963 lt!100190))) (currentByte!3316 (_1!2963 lt!100190)) (currentBit!3311 (_1!2963 lt!100190))) (bitIndex!0 (size!1287 (buf!1668 (_2!2964 lt!100186))) (currentByte!3316 (_2!2964 lt!100186)) (currentBit!3311 (_2!2964 lt!100186)))))))

(declare-fun b!63979 () Bool)

(declare-fun e!42300 () Bool)

(assert (=> b!63979 (= e!42301 e!42300)))

(declare-fun res!53129 () Bool)

(assert (=> b!63979 (=> res!53129 e!42300)))

(assert (=> b!63979 (= res!53129 (= (size!1287 (buf!1668 (_1!2963 lt!100190))) #b00000000000000000000000000000000))))

(declare-fun b!63980 () Bool)

(assert (=> b!63980 (= e!42300 (arrayBitRangesEq!0 (buf!1668 (_1!2963 lt!100190)) (buf!1668 (_2!2964 lt!100186)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1287 (buf!1668 (_1!2963 lt!100190))) (currentByte!3316 (_1!2963 lt!100190)) (currentBit!3311 (_1!2963 lt!100190)))))))

(assert (= (and d!19944 res!53131) b!63978))

(assert (= (and b!63978 res!53130) b!63979))

(assert (= (and b!63979 (not res!53129)) b!63980))

(assert (=> b!63978 m!101027))

(assert (=> b!63978 m!100757))

(assert (=> b!63980 m!101027))

(assert (=> b!63980 m!101027))

(declare-fun m!101445 () Bool)

(assert (=> b!63980 m!101445))

(assert (=> b!63574 d!19944))

(check-sat (not b!63943) (not b!63941) (not b!63682) (not d!19914) (not b!63945) (not b!63673) (not d!19762) (not b!63695) (not b!63757) (not d!19940) (not b!63681) (not b!63675) (not b!63646) (not b!63678) (not b!63670) (not d!19938) (not d!19784) (not b!63956) (not d!19912) (not b!63978) (not b!63680) (not d!19826) (not b!63698) (not b!63685) (not d!19766) (not b!63672) (not b!63957) (not b!63658) (not b!63766) (not b!63677) (not b!63761) (not b!63768) (not d!19774) (not d!19932) (not b!63676) (not b!63951) (not b!63759) (not b!63671) (not d!19922) (not b!63955) (not b!63755) (not b!63758) (not b!63958) (not b!63762) (not d!19786) (not d!19770) (not d!19936) (not b!63775) (not d!19822) (not b!63940) (not b!63756) (not b!63959) (not b!63946) (not b!63980) (not bm!811) (not b!63777) (not b!63656) (not b!63961) (not d!19764) (not b!63765) (not b!63760) (not b!63944) (not b!63657) (not d!19768) (not b!63953) (not d!19782) (not b!63763) (not b!63693) (not b!63686) (not b!63684) (not d!19920) (not d!19916) (not d!19930))
(check-sat)
