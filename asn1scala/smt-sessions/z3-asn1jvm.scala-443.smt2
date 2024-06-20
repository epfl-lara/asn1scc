; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11852 () Bool)

(assert start!11852)

(declare-fun b!59496 () Bool)

(declare-fun res!49519 () Bool)

(declare-fun e!39596 () Bool)

(assert (=> b!59496 (=> res!49519 e!39596)))

(declare-datatypes ((array!2709 0))(
  ( (array!2710 (arr!1794 (Array (_ BitVec 32) (_ BitVec 8))) (size!1230 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2148 0))(
  ( (BitStream!2149 (buf!1611 array!2709) (currentByte!3229 (_ BitVec 32)) (currentBit!3224 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4083 0))(
  ( (Unit!4084) )
))
(declare-datatypes ((tuple2!5418 0))(
  ( (tuple2!5419 (_1!2820 Unit!4083) (_2!2820 BitStream!2148)) )
))
(declare-fun lt!93293 () tuple2!5418)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59496 (= res!49519 (not (invariant!0 (currentBit!3224 (_2!2820 lt!93293)) (currentByte!3229 (_2!2820 lt!93293)) (size!1230 (buf!1611 (_2!2820 lt!93293))))))))

(declare-fun b!59497 () Bool)

(declare-fun res!49527 () Bool)

(declare-fun e!39594 () Bool)

(assert (=> b!59497 (=> (not res!49527) (not e!39594))))

(declare-fun thiss!1379 () BitStream!2148)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59497 (= res!49527 (validate_offset_bits!1 ((_ sign_extend 32) (size!1230 (buf!1611 thiss!1379))) ((_ sign_extend 32) (currentByte!3229 thiss!1379)) ((_ sign_extend 32) (currentBit!3224 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun lt!93291 () (_ BitVec 64))

(declare-fun lt!93294 () tuple2!5418)

(declare-fun e!39591 () Bool)

(declare-fun b!59498 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59498 (= e!39591 (= lt!93291 (bvsub (bvsub (bvadd (bitIndex!0 (size!1230 (buf!1611 (_2!2820 lt!93294))) (currentByte!3229 (_2!2820 lt!93294)) (currentBit!3224 (_2!2820 lt!93294))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59499 () Bool)

(declare-fun e!39599 () Bool)

(assert (=> b!59499 (= e!39599 e!39596)))

(declare-fun res!49524 () Bool)

(assert (=> b!59499 (=> res!49524 e!39596)))

(declare-fun lt!93296 () (_ BitVec 64))

(assert (=> b!59499 (= res!49524 (not (= lt!93291 (bvsub (bvadd lt!93296 to!314) i!635))))))

(assert (=> b!59499 (= lt!93291 (bitIndex!0 (size!1230 (buf!1611 (_2!2820 lt!93293))) (currentByte!3229 (_2!2820 lt!93293)) (currentBit!3224 (_2!2820 lt!93293))))))

(declare-fun res!49521 () Bool)

(assert (=> start!11852 (=> (not res!49521) (not e!39594))))

(declare-fun srcBuffer!2 () array!2709)

(assert (=> start!11852 (= res!49521 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1230 srcBuffer!2))))))))

(assert (=> start!11852 e!39594))

(assert (=> start!11852 true))

(declare-fun array_inv!1133 (array!2709) Bool)

(assert (=> start!11852 (array_inv!1133 srcBuffer!2)))

(declare-fun e!39595 () Bool)

(declare-fun inv!12 (BitStream!2148) Bool)

(assert (=> start!11852 (and (inv!12 thiss!1379) e!39595)))

(declare-fun b!59500 () Bool)

(declare-fun res!49528 () Bool)

(assert (=> b!59500 (=> res!49528 e!39596)))

(assert (=> b!59500 (= res!49528 (not (= (size!1230 (buf!1611 thiss!1379)) (size!1230 (buf!1611 (_2!2820 lt!93293))))))))

(declare-datatypes ((tuple2!5420 0))(
  ( (tuple2!5421 (_1!2821 BitStream!2148) (_2!2821 BitStream!2148)) )
))
(declare-fun lt!93300 () tuple2!5420)

(declare-fun b!59501 () Bool)

(declare-fun e!39589 () Bool)

(declare-datatypes ((List!649 0))(
  ( (Nil!646) (Cons!645 (h!764 Bool) (t!1399 List!649)) )
))
(declare-fun head!468 (List!649) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2148 array!2709 (_ BitVec 64) (_ BitVec 64)) List!649)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2148 BitStream!2148 (_ BitVec 64)) List!649)

(assert (=> b!59501 (= e!39589 (= (head!468 (byteArrayBitContentToList!0 (_2!2820 lt!93294) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!468 (bitStreamReadBitsIntoList!0 (_2!2820 lt!93294) (_1!2821 lt!93300) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59502 () Bool)

(declare-fun e!39598 () Bool)

(assert (=> b!59502 (= e!39598 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93295 () (_ BitVec 64))

(assert (=> b!59502 (validate_offset_bits!1 ((_ sign_extend 32) (size!1230 (buf!1611 (_2!2820 lt!93293)))) ((_ sign_extend 32) (currentByte!3229 (_2!2820 lt!93294))) ((_ sign_extend 32) (currentBit!3224 (_2!2820 lt!93294))) lt!93295)))

(declare-fun lt!93299 () Unit!4083)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2148 array!2709 (_ BitVec 64)) Unit!4083)

(assert (=> b!59502 (= lt!93299 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2820 lt!93294) (buf!1611 (_2!2820 lt!93293)) lt!93295))))

(declare-fun lt!93301 () tuple2!5420)

(declare-fun reader!0 (BitStream!2148 BitStream!2148) tuple2!5420)

(assert (=> b!59502 (= lt!93301 (reader!0 (_2!2820 lt!93294) (_2!2820 lt!93293)))))

(assert (=> b!59502 (validate_offset_bits!1 ((_ sign_extend 32) (size!1230 (buf!1611 (_2!2820 lt!93293)))) ((_ sign_extend 32) (currentByte!3229 thiss!1379)) ((_ sign_extend 32) (currentBit!3224 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93292 () Unit!4083)

(assert (=> b!59502 (= lt!93292 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1611 (_2!2820 lt!93293)) (bvsub to!314 i!635)))))

(declare-fun lt!93302 () tuple2!5420)

(assert (=> b!59502 (= lt!93302 (reader!0 thiss!1379 (_2!2820 lt!93293)))))

(declare-fun b!59503 () Bool)

(declare-fun res!49522 () Bool)

(assert (=> b!59503 (=> res!49522 e!39598)))

(assert (=> b!59503 (= res!49522 (not (invariant!0 (currentBit!3224 (_2!2820 lt!93294)) (currentByte!3229 (_2!2820 lt!93294)) (size!1230 (buf!1611 (_2!2820 lt!93294))))))))

(declare-fun b!59504 () Bool)

(declare-fun e!39590 () Bool)

(declare-fun e!39597 () Bool)

(assert (=> b!59504 (= e!39590 e!39597)))

(declare-fun res!49526 () Bool)

(assert (=> b!59504 (=> res!49526 e!39597)))

(declare-fun isPrefixOf!0 (BitStream!2148 BitStream!2148) Bool)

(assert (=> b!59504 (= res!49526 (not (isPrefixOf!0 thiss!1379 (_2!2820 lt!93294))))))

(assert (=> b!59504 (validate_offset_bits!1 ((_ sign_extend 32) (size!1230 (buf!1611 (_2!2820 lt!93294)))) ((_ sign_extend 32) (currentByte!3229 (_2!2820 lt!93294))) ((_ sign_extend 32) (currentBit!3224 (_2!2820 lt!93294))) lt!93295)))

(assert (=> b!59504 (= lt!93295 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93298 () Unit!4083)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2148 BitStream!2148 (_ BitVec 64) (_ BitVec 64)) Unit!4083)

(assert (=> b!59504 (= lt!93298 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2820 lt!93294) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2148 (_ BitVec 8) (_ BitVec 32)) tuple2!5418)

(assert (=> b!59504 (= lt!93294 (appendBitFromByte!0 thiss!1379 (select (arr!1794 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59505 () Bool)

(assert (=> b!59505 (= e!39597 e!39599)))

(declare-fun res!49525 () Bool)

(assert (=> b!59505 (=> res!49525 e!39599)))

(assert (=> b!59505 (= res!49525 (not (isPrefixOf!0 (_2!2820 lt!93294) (_2!2820 lt!93293))))))

(assert (=> b!59505 (isPrefixOf!0 thiss!1379 (_2!2820 lt!93293))))

(declare-fun lt!93297 () Unit!4083)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2148 BitStream!2148 BitStream!2148) Unit!4083)

(assert (=> b!59505 (= lt!93297 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2820 lt!93294) (_2!2820 lt!93293)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2148 array!2709 (_ BitVec 64) (_ BitVec 64)) tuple2!5418)

(assert (=> b!59505 (= lt!93293 (appendBitsMSBFirstLoop!0 (_2!2820 lt!93294) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59505 e!39589))

(declare-fun res!49518 () Bool)

(assert (=> b!59505 (=> (not res!49518) (not e!39589))))

(assert (=> b!59505 (= res!49518 (validate_offset_bits!1 ((_ sign_extend 32) (size!1230 (buf!1611 (_2!2820 lt!93294)))) ((_ sign_extend 32) (currentByte!3229 thiss!1379)) ((_ sign_extend 32) (currentBit!3224 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93303 () Unit!4083)

(assert (=> b!59505 (= lt!93303 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1611 (_2!2820 lt!93294)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59505 (= lt!93300 (reader!0 thiss!1379 (_2!2820 lt!93294)))))

(declare-fun b!59506 () Bool)

(assert (=> b!59506 (= e!39595 (array_inv!1133 (buf!1611 thiss!1379)))))

(declare-fun b!59507 () Bool)

(assert (=> b!59507 (= e!39596 e!39598)))

(declare-fun res!49530 () Bool)

(assert (=> b!59507 (=> res!49530 e!39598)))

(assert (=> b!59507 (= res!49530 (not (= (size!1230 (buf!1611 (_2!2820 lt!93294))) (size!1230 (buf!1611 (_2!2820 lt!93293))))))))

(assert (=> b!59507 e!39591))

(declare-fun res!49529 () Bool)

(assert (=> b!59507 (=> (not res!49529) (not e!39591))))

(assert (=> b!59507 (= res!49529 (= (size!1230 (buf!1611 (_2!2820 lt!93293))) (size!1230 (buf!1611 thiss!1379))))))

(declare-fun b!59508 () Bool)

(assert (=> b!59508 (= e!39594 (not e!39590))))

(declare-fun res!49523 () Bool)

(assert (=> b!59508 (=> res!49523 e!39590)))

(assert (=> b!59508 (= res!49523 (bvsge i!635 to!314))))

(assert (=> b!59508 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93304 () Unit!4083)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2148) Unit!4083)

(assert (=> b!59508 (= lt!93304 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59508 (= lt!93296 (bitIndex!0 (size!1230 (buf!1611 thiss!1379)) (currentByte!3229 thiss!1379) (currentBit!3224 thiss!1379)))))

(declare-fun b!59509 () Bool)

(declare-fun res!49520 () Bool)

(assert (=> b!59509 (=> res!49520 e!39598)))

(assert (=> b!59509 (= res!49520 (not (invariant!0 (currentBit!3224 (_2!2820 lt!93294)) (currentByte!3229 (_2!2820 lt!93294)) (size!1230 (buf!1611 (_2!2820 lt!93293))))))))

(assert (= (and start!11852 res!49521) b!59497))

(assert (= (and b!59497 res!49527) b!59508))

(assert (= (and b!59508 (not res!49523)) b!59504))

(assert (= (and b!59504 (not res!49526)) b!59505))

(assert (= (and b!59505 res!49518) b!59501))

(assert (= (and b!59505 (not res!49525)) b!59499))

(assert (= (and b!59499 (not res!49524)) b!59496))

(assert (= (and b!59496 (not res!49519)) b!59500))

(assert (= (and b!59500 (not res!49528)) b!59507))

(assert (= (and b!59507 res!49529) b!59498))

(assert (= (and b!59507 (not res!49530)) b!59503))

(assert (= (and b!59503 (not res!49522)) b!59509))

(assert (= (and b!59509 (not res!49520)) b!59502))

(assert (= start!11852 b!59506))

(declare-fun m!93693 () Bool)

(assert (=> b!59496 m!93693))

(declare-fun m!93695 () Bool)

(assert (=> b!59508 m!93695))

(declare-fun m!93697 () Bool)

(assert (=> b!59508 m!93697))

(declare-fun m!93699 () Bool)

(assert (=> b!59508 m!93699))

(declare-fun m!93701 () Bool)

(assert (=> b!59498 m!93701))

(declare-fun m!93703 () Bool)

(assert (=> b!59503 m!93703))

(declare-fun m!93705 () Bool)

(assert (=> b!59505 m!93705))

(declare-fun m!93707 () Bool)

(assert (=> b!59505 m!93707))

(declare-fun m!93709 () Bool)

(assert (=> b!59505 m!93709))

(declare-fun m!93711 () Bool)

(assert (=> b!59505 m!93711))

(declare-fun m!93713 () Bool)

(assert (=> b!59505 m!93713))

(declare-fun m!93715 () Bool)

(assert (=> b!59505 m!93715))

(declare-fun m!93717 () Bool)

(assert (=> b!59505 m!93717))

(declare-fun m!93719 () Bool)

(assert (=> b!59506 m!93719))

(declare-fun m!93721 () Bool)

(assert (=> b!59502 m!93721))

(declare-fun m!93723 () Bool)

(assert (=> b!59502 m!93723))

(declare-fun m!93725 () Bool)

(assert (=> b!59502 m!93725))

(declare-fun m!93727 () Bool)

(assert (=> b!59502 m!93727))

(declare-fun m!93729 () Bool)

(assert (=> b!59502 m!93729))

(declare-fun m!93731 () Bool)

(assert (=> b!59502 m!93731))

(declare-fun m!93733 () Bool)

(assert (=> b!59509 m!93733))

(declare-fun m!93735 () Bool)

(assert (=> b!59501 m!93735))

(assert (=> b!59501 m!93735))

(declare-fun m!93737 () Bool)

(assert (=> b!59501 m!93737))

(declare-fun m!93739 () Bool)

(assert (=> b!59501 m!93739))

(assert (=> b!59501 m!93739))

(declare-fun m!93741 () Bool)

(assert (=> b!59501 m!93741))

(declare-fun m!93743 () Bool)

(assert (=> start!11852 m!93743))

(declare-fun m!93745 () Bool)

(assert (=> start!11852 m!93745))

(declare-fun m!93747 () Bool)

(assert (=> b!59499 m!93747))

(declare-fun m!93749 () Bool)

(assert (=> b!59497 m!93749))

(declare-fun m!93751 () Bool)

(assert (=> b!59504 m!93751))

(declare-fun m!93753 () Bool)

(assert (=> b!59504 m!93753))

(declare-fun m!93755 () Bool)

(assert (=> b!59504 m!93755))

(declare-fun m!93757 () Bool)

(assert (=> b!59504 m!93757))

(assert (=> b!59504 m!93753))

(declare-fun m!93759 () Bool)

(assert (=> b!59504 m!93759))

(check-sat (not b!59501) (not b!59508) (not b!59499) (not b!59506) (not b!59497) (not b!59503) (not b!59496) (not b!59505) (not b!59498) (not b!59504) (not start!11852) (not b!59502) (not b!59509))
(check-sat)
