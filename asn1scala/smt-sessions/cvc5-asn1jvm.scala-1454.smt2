; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39938 () Bool)

(assert start!39938)

(declare-fun b!181443 () Bool)

(declare-fun e!125991 () Bool)

(declare-fun e!125992 () Bool)

(assert (=> b!181443 (= e!125991 e!125992)))

(declare-fun res!150700 () Bool)

(assert (=> b!181443 (=> (not res!150700) (not e!125992))))

(declare-datatypes ((array!9698 0))(
  ( (array!9699 (arr!5206 (Array (_ BitVec 32) (_ BitVec 8))) (size!4276 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7660 0))(
  ( (BitStream!7661 (buf!4725 array!9698) (currentByte!8947 (_ BitVec 32)) (currentBit!8942 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15626 0))(
  ( (tuple2!15627 (_1!8458 BitStream!7660) (_2!8458 Bool)) )
))
(declare-fun lt!278858 () tuple2!15626)

(declare-fun lt!278869 () Bool)

(declare-datatypes ((Unit!13049 0))(
  ( (Unit!13050) )
))
(declare-datatypes ((tuple2!15628 0))(
  ( (tuple2!15629 (_1!8459 Unit!13049) (_2!8459 BitStream!7660)) )
))
(declare-fun lt!278870 () tuple2!15628)

(assert (=> b!181443 (= res!150700 (and (= (_2!8458 lt!278858) lt!278869) (= (_1!8458 lt!278858) (_2!8459 lt!278870))))))

(declare-fun thiss!1204 () BitStream!7660)

(declare-fun readBitPure!0 (BitStream!7660) tuple2!15626)

(declare-fun readerFrom!0 (BitStream!7660 (_ BitVec 32) (_ BitVec 32)) BitStream!7660)

(assert (=> b!181443 (= lt!278858 (readBitPure!0 (readerFrom!0 (_2!8459 lt!278870) (currentBit!8942 thiss!1204) (currentByte!8947 thiss!1204))))))

(declare-fun b!181444 () Bool)

(declare-fun e!125990 () Bool)

(declare-fun e!125987 () Bool)

(assert (=> b!181444 (= e!125990 e!125987)))

(declare-fun res!150707 () Bool)

(assert (=> b!181444 (=> res!150707 e!125987)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!278862 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!278855 () (_ BitVec 64))

(assert (=> b!181444 (= res!150707 (not (= lt!278855 (bvsub (bvsub (bvadd lt!278862 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!278865 () tuple2!15628)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181444 (= lt!278855 (bitIndex!0 (size!4276 (buf!4725 (_2!8459 lt!278865))) (currentByte!8947 (_2!8459 lt!278865)) (currentBit!8942 (_2!8459 lt!278865))))))

(declare-fun isPrefixOf!0 (BitStream!7660 BitStream!7660) Bool)

(assert (=> b!181444 (isPrefixOf!0 thiss!1204 (_2!8459 lt!278865))))

(declare-fun lt!278852 () Unit!13049)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7660 BitStream!7660 BitStream!7660) Unit!13049)

(assert (=> b!181444 (= lt!278852 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8459 lt!278870) (_2!8459 lt!278865)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7660 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15628)

(assert (=> b!181444 (= lt!278865 (appendBitsLSBFirstLoopTR!0 (_2!8459 lt!278870) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181445 () Bool)

(declare-fun res!150701 () Bool)

(assert (=> b!181445 (=> res!150701 e!125987)))

(declare-fun lt!278868 () (_ BitVec 64))

(assert (=> b!181445 (= res!150701 (or (not (= (size!4276 (buf!4725 (_2!8459 lt!278865))) (size!4276 (buf!4725 thiss!1204)))) (not (= lt!278855 (bvsub (bvadd lt!278868 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181446 () Bool)

(declare-fun e!125981 () Bool)

(assert (=> b!181446 (= e!125987 e!125981)))

(declare-fun res!150695 () Bool)

(assert (=> b!181446 (=> res!150695 e!125981)))

(declare-datatypes ((tuple2!15630 0))(
  ( (tuple2!15631 (_1!8460 BitStream!7660) (_2!8460 BitStream!7660)) )
))
(declare-fun lt!278859 () tuple2!15630)

(declare-fun lt!278857 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181446 (= res!150695 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4276 (buf!4725 (_1!8460 lt!278859)))) ((_ sign_extend 32) (currentByte!8947 (_1!8460 lt!278859))) ((_ sign_extend 32) (currentBit!8942 (_1!8460 lt!278859))) lt!278857)))))

(assert (=> b!181446 (validate_offset_bits!1 ((_ sign_extend 32) (size!4276 (buf!4725 (_2!8459 lt!278865)))) ((_ sign_extend 32) (currentByte!8947 thiss!1204)) ((_ sign_extend 32) (currentBit!8942 thiss!1204)) lt!278857)))

(declare-fun lt!278854 () Unit!13049)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7660 array!9698 (_ BitVec 64)) Unit!13049)

(assert (=> b!181446 (= lt!278854 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4725 (_2!8459 lt!278865)) lt!278857))))

(declare-fun lt!278866 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181446 (= lt!278866 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!181446 (= (_2!8458 (readBitPure!0 (_1!8460 lt!278859))) lt!278869)))

(declare-fun lt!278861 () tuple2!15630)

(declare-fun reader!0 (BitStream!7660 BitStream!7660) tuple2!15630)

(assert (=> b!181446 (= lt!278861 (reader!0 (_2!8459 lt!278870) (_2!8459 lt!278865)))))

(assert (=> b!181446 (= lt!278859 (reader!0 thiss!1204 (_2!8459 lt!278865)))))

(declare-fun e!125986 () Bool)

(assert (=> b!181446 e!125986))

(declare-fun res!150704 () Bool)

(assert (=> b!181446 (=> (not res!150704) (not e!125986))))

(declare-fun lt!278867 () tuple2!15626)

(declare-fun lt!278856 () tuple2!15626)

(assert (=> b!181446 (= res!150704 (= (bitIndex!0 (size!4276 (buf!4725 (_1!8458 lt!278867))) (currentByte!8947 (_1!8458 lt!278867)) (currentBit!8942 (_1!8458 lt!278867))) (bitIndex!0 (size!4276 (buf!4725 (_1!8458 lt!278856))) (currentByte!8947 (_1!8458 lt!278856)) (currentBit!8942 (_1!8458 lt!278856)))))))

(declare-fun lt!278863 () Unit!13049)

(declare-fun lt!278864 () BitStream!7660)

(declare-fun readBitPrefixLemma!0 (BitStream!7660 BitStream!7660) Unit!13049)

(assert (=> b!181446 (= lt!278863 (readBitPrefixLemma!0 lt!278864 (_2!8459 lt!278865)))))

(assert (=> b!181446 (= lt!278856 (readBitPure!0 (BitStream!7661 (buf!4725 (_2!8459 lt!278865)) (currentByte!8947 thiss!1204) (currentBit!8942 thiss!1204))))))

(assert (=> b!181446 (= lt!278867 (readBitPure!0 lt!278864))))

(declare-fun e!125982 () Bool)

(assert (=> b!181446 e!125982))

(declare-fun res!150698 () Bool)

(assert (=> b!181446 (=> (not res!150698) (not e!125982))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181446 (= res!150698 (invariant!0 (currentBit!8942 thiss!1204) (currentByte!8947 thiss!1204) (size!4276 (buf!4725 (_2!8459 lt!278870)))))))

(assert (=> b!181446 (= lt!278864 (BitStream!7661 (buf!4725 (_2!8459 lt!278870)) (currentByte!8947 thiss!1204) (currentBit!8942 thiss!1204)))))

(declare-fun b!181447 () Bool)

(declare-fun res!150691 () Bool)

(assert (=> b!181447 (=> res!150691 e!125987)))

(assert (=> b!181447 (= res!150691 (not (invariant!0 (currentBit!8942 (_2!8459 lt!278865)) (currentByte!8947 (_2!8459 lt!278865)) (size!4276 (buf!4725 (_2!8459 lt!278865))))))))

(declare-fun b!181448 () Bool)

(declare-fun e!125983 () Bool)

(assert (=> b!181448 (= e!125983 (not e!125990))))

(declare-fun res!150692 () Bool)

(assert (=> b!181448 (=> res!150692 e!125990)))

(assert (=> b!181448 (= res!150692 (not (= lt!278862 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!278868))))))

(assert (=> b!181448 (= lt!278862 (bitIndex!0 (size!4276 (buf!4725 (_2!8459 lt!278870))) (currentByte!8947 (_2!8459 lt!278870)) (currentBit!8942 (_2!8459 lt!278870))))))

(assert (=> b!181448 (= lt!278868 (bitIndex!0 (size!4276 (buf!4725 thiss!1204)) (currentByte!8947 thiss!1204) (currentBit!8942 thiss!1204)))))

(declare-fun e!125988 () Bool)

(assert (=> b!181448 e!125988))

(declare-fun res!150702 () Bool)

(assert (=> b!181448 (=> (not res!150702) (not e!125988))))

(assert (=> b!181448 (= res!150702 (= (size!4276 (buf!4725 thiss!1204)) (size!4276 (buf!4725 (_2!8459 lt!278870)))))))

(declare-fun appendBit!0 (BitStream!7660 Bool) tuple2!15628)

(assert (=> b!181448 (= lt!278870 (appendBit!0 thiss!1204 lt!278869))))

(assert (=> b!181448 (= lt!278869 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181450 () Bool)

(assert (=> b!181450 (= e!125981 (= (bvand lt!278866 #b1111111111111111111111111111111111111111111111111111111111111111) lt!278866))))

(declare-fun b!181451 () Bool)

(assert (=> b!181451 (= e!125988 e!125991)))

(declare-fun res!150705 () Bool)

(assert (=> b!181451 (=> (not res!150705) (not e!125991))))

(declare-fun lt!278860 () (_ BitVec 64))

(declare-fun lt!278853 () (_ BitVec 64))

(assert (=> b!181451 (= res!150705 (= lt!278860 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!278853)))))

(assert (=> b!181451 (= lt!278860 (bitIndex!0 (size!4276 (buf!4725 (_2!8459 lt!278870))) (currentByte!8947 (_2!8459 lt!278870)) (currentBit!8942 (_2!8459 lt!278870))))))

(assert (=> b!181451 (= lt!278853 (bitIndex!0 (size!4276 (buf!4725 thiss!1204)) (currentByte!8947 thiss!1204) (currentBit!8942 thiss!1204)))))

(declare-fun b!181452 () Bool)

(declare-fun res!150694 () Bool)

(assert (=> b!181452 (=> (not res!150694) (not e!125983))))

(assert (=> b!181452 (= res!150694 (invariant!0 (currentBit!8942 thiss!1204) (currentByte!8947 thiss!1204) (size!4276 (buf!4725 thiss!1204))))))

(declare-fun b!181453 () Bool)

(declare-fun res!150697 () Bool)

(assert (=> b!181453 (=> (not res!150697) (not e!125983))))

(assert (=> b!181453 (= res!150697 (not (= i!590 nBits!348)))))

(declare-fun b!181449 () Bool)

(declare-fun res!150703 () Bool)

(assert (=> b!181449 (=> (not res!150703) (not e!125991))))

(assert (=> b!181449 (= res!150703 (isPrefixOf!0 thiss!1204 (_2!8459 lt!278870)))))

(declare-fun res!150693 () Bool)

(declare-fun e!125985 () Bool)

(assert (=> start!39938 (=> (not res!150693) (not e!125985))))

(assert (=> start!39938 (= res!150693 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39938 e!125985))

(assert (=> start!39938 true))

(declare-fun e!125989 () Bool)

(declare-fun inv!12 (BitStream!7660) Bool)

(assert (=> start!39938 (and (inv!12 thiss!1204) e!125989)))

(declare-fun b!181454 () Bool)

(assert (=> b!181454 (= e!125986 (= (_2!8458 lt!278867) (_2!8458 lt!278856)))))

(declare-fun b!181455 () Bool)

(declare-fun res!150706 () Bool)

(assert (=> b!181455 (=> res!150706 e!125987)))

(assert (=> b!181455 (= res!150706 (not (isPrefixOf!0 (_2!8459 lt!278870) (_2!8459 lt!278865))))))

(declare-fun b!181456 () Bool)

(declare-fun array_inv!4017 (array!9698) Bool)

(assert (=> b!181456 (= e!125989 (array_inv!4017 (buf!4725 thiss!1204)))))

(declare-fun b!181457 () Bool)

(assert (=> b!181457 (= e!125985 e!125983)))

(declare-fun res!150696 () Bool)

(assert (=> b!181457 (=> (not res!150696) (not e!125983))))

(assert (=> b!181457 (= res!150696 (validate_offset_bits!1 ((_ sign_extend 32) (size!4276 (buf!4725 thiss!1204))) ((_ sign_extend 32) (currentByte!8947 thiss!1204)) ((_ sign_extend 32) (currentBit!8942 thiss!1204)) lt!278857))))

(assert (=> b!181457 (= lt!278857 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!181458 () Bool)

(declare-fun res!150708 () Bool)

(assert (=> b!181458 (=> res!150708 e!125981)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181458 (= res!150708 (not (= (bvand lt!278866 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181459 () Bool)

(declare-fun res!150699 () Bool)

(assert (=> b!181459 (=> res!150699 e!125987)))

(assert (=> b!181459 (= res!150699 (not (isPrefixOf!0 thiss!1204 (_2!8459 lt!278870))))))

(declare-fun b!181460 () Bool)

(assert (=> b!181460 (= e!125992 (= (bitIndex!0 (size!4276 (buf!4725 (_1!8458 lt!278858))) (currentByte!8947 (_1!8458 lt!278858)) (currentBit!8942 (_1!8458 lt!278858))) lt!278860))))

(declare-fun b!181461 () Bool)

(assert (=> b!181461 (= e!125982 (invariant!0 (currentBit!8942 thiss!1204) (currentByte!8947 thiss!1204) (size!4276 (buf!4725 (_2!8459 lt!278865)))))))

(assert (= (and start!39938 res!150693) b!181457))

(assert (= (and b!181457 res!150696) b!181452))

(assert (= (and b!181452 res!150694) b!181453))

(assert (= (and b!181453 res!150697) b!181448))

(assert (= (and b!181448 res!150702) b!181451))

(assert (= (and b!181451 res!150705) b!181449))

(assert (= (and b!181449 res!150703) b!181443))

(assert (= (and b!181443 res!150700) b!181460))

(assert (= (and b!181448 (not res!150692)) b!181444))

(assert (= (and b!181444 (not res!150707)) b!181447))

(assert (= (and b!181447 (not res!150691)) b!181445))

(assert (= (and b!181445 (not res!150701)) b!181455))

(assert (= (and b!181455 (not res!150706)) b!181459))

(assert (= (and b!181459 (not res!150699)) b!181446))

(assert (= (and b!181446 res!150698) b!181461))

(assert (= (and b!181446 res!150704) b!181454))

(assert (= (and b!181446 (not res!150695)) b!181458))

(assert (= (and b!181458 (not res!150708)) b!181450))

(assert (= start!39938 b!181456))

(declare-fun m!282481 () Bool)

(assert (=> b!181444 m!282481))

(declare-fun m!282483 () Bool)

(assert (=> b!181444 m!282483))

(declare-fun m!282485 () Bool)

(assert (=> b!181444 m!282485))

(declare-fun m!282487 () Bool)

(assert (=> b!181444 m!282487))

(declare-fun m!282489 () Bool)

(assert (=> b!181449 m!282489))

(declare-fun m!282491 () Bool)

(assert (=> b!181460 m!282491))

(declare-fun m!282493 () Bool)

(assert (=> b!181447 m!282493))

(declare-fun m!282495 () Bool)

(assert (=> b!181448 m!282495))

(declare-fun m!282497 () Bool)

(assert (=> b!181448 m!282497))

(declare-fun m!282499 () Bool)

(assert (=> b!181448 m!282499))

(declare-fun m!282501 () Bool)

(assert (=> b!181457 m!282501))

(assert (=> b!181459 m!282489))

(declare-fun m!282503 () Bool)

(assert (=> b!181458 m!282503))

(declare-fun m!282505 () Bool)

(assert (=> b!181455 m!282505))

(declare-fun m!282507 () Bool)

(assert (=> b!181452 m!282507))

(declare-fun m!282509 () Bool)

(assert (=> b!181443 m!282509))

(assert (=> b!181443 m!282509))

(declare-fun m!282511 () Bool)

(assert (=> b!181443 m!282511))

(declare-fun m!282513 () Bool)

(assert (=> b!181456 m!282513))

(declare-fun m!282515 () Bool)

(assert (=> b!181446 m!282515))

(declare-fun m!282517 () Bool)

(assert (=> b!181446 m!282517))

(declare-fun m!282519 () Bool)

(assert (=> b!181446 m!282519))

(declare-fun m!282521 () Bool)

(assert (=> b!181446 m!282521))

(declare-fun m!282523 () Bool)

(assert (=> b!181446 m!282523))

(declare-fun m!282525 () Bool)

(assert (=> b!181446 m!282525))

(declare-fun m!282527 () Bool)

(assert (=> b!181446 m!282527))

(declare-fun m!282529 () Bool)

(assert (=> b!181446 m!282529))

(declare-fun m!282531 () Bool)

(assert (=> b!181446 m!282531))

(declare-fun m!282533 () Bool)

(assert (=> b!181446 m!282533))

(declare-fun m!282535 () Bool)

(assert (=> b!181446 m!282535))

(declare-fun m!282537 () Bool)

(assert (=> b!181446 m!282537))

(declare-fun m!282539 () Bool)

(assert (=> b!181446 m!282539))

(declare-fun m!282541 () Bool)

(assert (=> b!181461 m!282541))

(assert (=> b!181451 m!282495))

(assert (=> b!181451 m!282497))

(declare-fun m!282543 () Bool)

(assert (=> start!39938 m!282543))

(push 1)

