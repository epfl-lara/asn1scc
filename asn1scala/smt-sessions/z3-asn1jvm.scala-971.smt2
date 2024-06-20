; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27362 () Bool)

(assert start!27362)

(declare-fun b!140521 () Bool)

(declare-fun e!93651 () Bool)

(declare-datatypes ((array!6428 0))(
  ( (array!6429 (arr!3616 (Array (_ BitVec 32) (_ BitVec 8))) (size!2909 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5076 0))(
  ( (BitStream!5077 (buf!3330 array!6428) (currentByte!6181 (_ BitVec 32)) (currentBit!6176 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5076)

(declare-fun array_inv!2698 (array!6428) Bool)

(assert (=> b!140521 (= e!93651 (array_inv!2698 (buf!3330 thiss!1634)))))

(declare-fun b!140522 () Bool)

(declare-fun res!117165 () Bool)

(declare-fun e!93650 () Bool)

(assert (=> b!140522 (=> (not res!117165) (not e!93650))))

(declare-datatypes ((Unit!8797 0))(
  ( (Unit!8798) )
))
(declare-datatypes ((tuple2!12328 0))(
  ( (tuple2!12329 (_1!6494 Unit!8797) (_2!6494 BitStream!5076)) )
))
(declare-fun lt!218760 () tuple2!12328)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140522 (= res!117165 (= (bitIndex!0 (size!2909 (buf!3330 (_2!6494 lt!218760))) (currentByte!6181 (_2!6494 lt!218760)) (currentBit!6176 (_2!6494 lt!218760))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2909 (buf!3330 thiss!1634)) (currentByte!6181 thiss!1634) (currentBit!6176 thiss!1634)))))))

(declare-fun b!140523 () Bool)

(declare-fun res!117169 () Bool)

(assert (=> b!140523 (=> (not res!117169) (not e!93650))))

(declare-fun isPrefixOf!0 (BitStream!5076 BitStream!5076) Bool)

(assert (=> b!140523 (= res!117169 (isPrefixOf!0 thiss!1634 (_2!6494 lt!218760)))))

(declare-fun b!140524 () Bool)

(declare-fun res!117167 () Bool)

(declare-fun e!93653 () Bool)

(assert (=> b!140524 (=> (not res!117167) (not e!93653))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140524 (= res!117167 (bvslt from!447 to!404))))

(declare-fun b!140526 () Bool)

(assert (=> b!140526 (= e!93653 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2909 (buf!3330 (_2!6494 lt!218760))) (currentByte!6181 (_2!6494 lt!218760)) (currentBit!6176 (_2!6494 lt!218760))))))))

(assert (=> b!140526 e!93650))

(declare-fun res!117163 () Bool)

(assert (=> b!140526 (=> (not res!117163) (not e!93650))))

(assert (=> b!140526 (= res!117163 (= (size!2909 (buf!3330 thiss!1634)) (size!2909 (buf!3330 (_2!6494 lt!218760)))))))

(declare-fun arr!237 () array!6428)

(declare-fun appendByte!0 (BitStream!5076 (_ BitVec 8)) tuple2!12328)

(assert (=> b!140526 (= lt!218760 (appendByte!0 thiss!1634 (select (arr!3616 arr!237) from!447)))))

(declare-fun res!117168 () Bool)

(assert (=> start!27362 (=> (not res!117168) (not e!93653))))

(assert (=> start!27362 (= res!117168 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2909 arr!237))))))

(assert (=> start!27362 e!93653))

(assert (=> start!27362 true))

(assert (=> start!27362 (array_inv!2698 arr!237)))

(declare-fun inv!12 (BitStream!5076) Bool)

(assert (=> start!27362 (and (inv!12 thiss!1634) e!93651)))

(declare-fun b!140525 () Bool)

(declare-fun res!117166 () Bool)

(assert (=> b!140525 (=> (not res!117166) (not e!93653))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140525 (= res!117166 (invariant!0 (currentBit!6176 thiss!1634) (currentByte!6181 thiss!1634) (size!2909 (buf!3330 thiss!1634))))))

(declare-datatypes ((tuple2!12330 0))(
  ( (tuple2!12331 (_1!6495 BitStream!5076) (_2!6495 (_ BitVec 8))) )
))
(declare-fun lt!218761 () tuple2!12330)

(declare-datatypes ((tuple2!12332 0))(
  ( (tuple2!12333 (_1!6496 BitStream!5076) (_2!6496 BitStream!5076)) )
))
(declare-fun lt!218762 () tuple2!12332)

(declare-fun b!140527 () Bool)

(assert (=> b!140527 (= e!93650 (and (= (_2!6495 lt!218761) (select (arr!3616 arr!237) from!447)) (= (_1!6495 lt!218761) (_2!6496 lt!218762))))))

(declare-fun readBytePure!0 (BitStream!5076) tuple2!12330)

(assert (=> b!140527 (= lt!218761 (readBytePure!0 (_1!6496 lt!218762)))))

(declare-fun reader!0 (BitStream!5076 BitStream!5076) tuple2!12332)

(assert (=> b!140527 (= lt!218762 (reader!0 thiss!1634 (_2!6494 lt!218760)))))

(declare-fun b!140528 () Bool)

(declare-fun res!117164 () Bool)

(assert (=> b!140528 (=> (not res!117164) (not e!93653))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140528 (= res!117164 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2909 (buf!3330 thiss!1634))) ((_ sign_extend 32) (currentByte!6181 thiss!1634)) ((_ sign_extend 32) (currentBit!6176 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27362 res!117168) b!140528))

(assert (= (and b!140528 res!117164) b!140524))

(assert (= (and b!140524 res!117167) b!140525))

(assert (= (and b!140525 res!117166) b!140526))

(assert (= (and b!140526 res!117163) b!140522))

(assert (= (and b!140522 res!117165) b!140523))

(assert (= (and b!140523 res!117169) b!140527))

(assert (= start!27362 b!140521))

(declare-fun m!216305 () Bool)

(assert (=> b!140525 m!216305))

(declare-fun m!216307 () Bool)

(assert (=> b!140523 m!216307))

(declare-fun m!216309 () Bool)

(assert (=> b!140521 m!216309))

(declare-fun m!216311 () Bool)

(assert (=> b!140528 m!216311))

(declare-fun m!216313 () Bool)

(assert (=> start!27362 m!216313))

(declare-fun m!216315 () Bool)

(assert (=> start!27362 m!216315))

(declare-fun m!216317 () Bool)

(assert (=> b!140522 m!216317))

(declare-fun m!216319 () Bool)

(assert (=> b!140522 m!216319))

(declare-fun m!216321 () Bool)

(assert (=> b!140527 m!216321))

(declare-fun m!216323 () Bool)

(assert (=> b!140527 m!216323))

(declare-fun m!216325 () Bool)

(assert (=> b!140527 m!216325))

(assert (=> b!140526 m!216317))

(assert (=> b!140526 m!216321))

(assert (=> b!140526 m!216321))

(declare-fun m!216327 () Bool)

(assert (=> b!140526 m!216327))

(check-sat (not b!140523) (not b!140521) (not b!140522) (not b!140526) (not b!140525) (not start!27362) (not b!140527) (not b!140528))
(check-sat)
(get-model)

(declare-fun d!45302 () Bool)

(declare-fun e!93678 () Bool)

(assert (=> d!45302 e!93678))

(declare-fun res!117204 () Bool)

(assert (=> d!45302 (=> (not res!117204) (not e!93678))))

(declare-fun lt!218788 () (_ BitVec 64))

(declare-fun lt!218785 () (_ BitVec 64))

(declare-fun lt!218789 () (_ BitVec 64))

(assert (=> d!45302 (= res!117204 (= lt!218785 (bvsub lt!218788 lt!218789)))))

(assert (=> d!45302 (or (= (bvand lt!218788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218789 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218788 lt!218789) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45302 (= lt!218789 (remainingBits!0 ((_ sign_extend 32) (size!2909 (buf!3330 (_2!6494 lt!218760)))) ((_ sign_extend 32) (currentByte!6181 (_2!6494 lt!218760))) ((_ sign_extend 32) (currentBit!6176 (_2!6494 lt!218760)))))))

(declare-fun lt!218784 () (_ BitVec 64))

(declare-fun lt!218787 () (_ BitVec 64))

(assert (=> d!45302 (= lt!218788 (bvmul lt!218784 lt!218787))))

(assert (=> d!45302 (or (= lt!218784 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218787 (bvsdiv (bvmul lt!218784 lt!218787) lt!218784)))))

(assert (=> d!45302 (= lt!218787 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45302 (= lt!218784 ((_ sign_extend 32) (size!2909 (buf!3330 (_2!6494 lt!218760)))))))

(assert (=> d!45302 (= lt!218785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6181 (_2!6494 lt!218760))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6176 (_2!6494 lt!218760)))))))

(assert (=> d!45302 (invariant!0 (currentBit!6176 (_2!6494 lt!218760)) (currentByte!6181 (_2!6494 lt!218760)) (size!2909 (buf!3330 (_2!6494 lt!218760))))))

(assert (=> d!45302 (= (bitIndex!0 (size!2909 (buf!3330 (_2!6494 lt!218760))) (currentByte!6181 (_2!6494 lt!218760)) (currentBit!6176 (_2!6494 lt!218760))) lt!218785)))

(declare-fun b!140566 () Bool)

(declare-fun res!117205 () Bool)

(assert (=> b!140566 (=> (not res!117205) (not e!93678))))

(assert (=> b!140566 (= res!117205 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218785))))

(declare-fun b!140567 () Bool)

(declare-fun lt!218786 () (_ BitVec 64))

(assert (=> b!140567 (= e!93678 (bvsle lt!218785 (bvmul lt!218786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140567 (or (= lt!218786 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218786 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218786)))))

(assert (=> b!140567 (= lt!218786 ((_ sign_extend 32) (size!2909 (buf!3330 (_2!6494 lt!218760)))))))

(assert (= (and d!45302 res!117204) b!140566))

(assert (= (and b!140566 res!117205) b!140567))

(declare-fun m!216355 () Bool)

(assert (=> d!45302 m!216355))

(declare-fun m!216357 () Bool)

(assert (=> d!45302 m!216357))

(assert (=> b!140522 d!45302))

(declare-fun d!45318 () Bool)

(declare-fun e!93679 () Bool)

(assert (=> d!45318 e!93679))

(declare-fun res!117206 () Bool)

(assert (=> d!45318 (=> (not res!117206) (not e!93679))))

(declare-fun lt!218791 () (_ BitVec 64))

(declare-fun lt!218796 () (_ BitVec 64))

(declare-fun lt!218797 () (_ BitVec 64))

(assert (=> d!45318 (= res!117206 (= lt!218791 (bvsub lt!218796 lt!218797)))))

(assert (=> d!45318 (or (= (bvand lt!218796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218797 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218796 lt!218797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45318 (= lt!218797 (remainingBits!0 ((_ sign_extend 32) (size!2909 (buf!3330 thiss!1634))) ((_ sign_extend 32) (currentByte!6181 thiss!1634)) ((_ sign_extend 32) (currentBit!6176 thiss!1634))))))

(declare-fun lt!218790 () (_ BitVec 64))

(declare-fun lt!218793 () (_ BitVec 64))

(assert (=> d!45318 (= lt!218796 (bvmul lt!218790 lt!218793))))

(assert (=> d!45318 (or (= lt!218790 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218793 (bvsdiv (bvmul lt!218790 lt!218793) lt!218790)))))

(assert (=> d!45318 (= lt!218793 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45318 (= lt!218790 ((_ sign_extend 32) (size!2909 (buf!3330 thiss!1634))))))

(assert (=> d!45318 (= lt!218791 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6181 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6176 thiss!1634))))))

(assert (=> d!45318 (invariant!0 (currentBit!6176 thiss!1634) (currentByte!6181 thiss!1634) (size!2909 (buf!3330 thiss!1634)))))

(assert (=> d!45318 (= (bitIndex!0 (size!2909 (buf!3330 thiss!1634)) (currentByte!6181 thiss!1634) (currentBit!6176 thiss!1634)) lt!218791)))

(declare-fun b!140568 () Bool)

(declare-fun res!117207 () Bool)

(assert (=> b!140568 (=> (not res!117207) (not e!93679))))

(assert (=> b!140568 (= res!117207 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218791))))

(declare-fun b!140569 () Bool)

(declare-fun lt!218792 () (_ BitVec 64))

(assert (=> b!140569 (= e!93679 (bvsle lt!218791 (bvmul lt!218792 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140569 (or (= lt!218792 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218792 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218792)))))

(assert (=> b!140569 (= lt!218792 ((_ sign_extend 32) (size!2909 (buf!3330 thiss!1634))))))

(assert (= (and d!45318 res!117206) b!140568))

(assert (= (and b!140568 res!117207) b!140569))

(declare-fun m!216359 () Bool)

(assert (=> d!45318 m!216359))

(assert (=> d!45318 m!216305))

(assert (=> b!140522 d!45318))

(declare-fun d!45320 () Bool)

(declare-datatypes ((tuple2!12344 0))(
  ( (tuple2!12345 (_1!6502 (_ BitVec 8)) (_2!6502 BitStream!5076)) )
))
(declare-fun lt!218804 () tuple2!12344)

(declare-fun readByte!0 (BitStream!5076) tuple2!12344)

(assert (=> d!45320 (= lt!218804 (readByte!0 (_1!6496 lt!218762)))))

(assert (=> d!45320 (= (readBytePure!0 (_1!6496 lt!218762)) (tuple2!12331 (_2!6502 lt!218804) (_1!6502 lt!218804)))))

(declare-fun bs!11120 () Bool)

(assert (= bs!11120 d!45320))

(declare-fun m!216365 () Bool)

(assert (=> bs!11120 m!216365))

(assert (=> b!140527 d!45320))

(declare-fun b!140610 () Bool)

(declare-fun res!117233 () Bool)

(declare-fun e!93696 () Bool)

(assert (=> b!140610 (=> (not res!117233) (not e!93696))))

(declare-fun lt!218977 () tuple2!12332)

(assert (=> b!140610 (= res!117233 (isPrefixOf!0 (_1!6496 lt!218977) thiss!1634))))

(declare-fun lt!218973 () (_ BitVec 64))

(declare-fun lt!218971 () (_ BitVec 64))

(declare-fun b!140611 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5076 (_ BitVec 64)) BitStream!5076)

(assert (=> b!140611 (= e!93696 (= (_1!6496 lt!218977) (withMovedBitIndex!0 (_2!6496 lt!218977) (bvsub lt!218971 lt!218973))))))

(assert (=> b!140611 (or (= (bvand lt!218971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218973 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218971 lt!218973) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!140611 (= lt!218973 (bitIndex!0 (size!2909 (buf!3330 (_2!6494 lt!218760))) (currentByte!6181 (_2!6494 lt!218760)) (currentBit!6176 (_2!6494 lt!218760))))))

(assert (=> b!140611 (= lt!218971 (bitIndex!0 (size!2909 (buf!3330 thiss!1634)) (currentByte!6181 thiss!1634) (currentBit!6176 thiss!1634)))))

(declare-fun b!140612 () Bool)

(declare-fun res!117234 () Bool)

(assert (=> b!140612 (=> (not res!117234) (not e!93696))))

(assert (=> b!140612 (= res!117234 (isPrefixOf!0 (_2!6496 lt!218977) (_2!6494 lt!218760)))))

(declare-fun b!140613 () Bool)

(declare-fun e!93697 () Unit!8797)

(declare-fun Unit!8802 () Unit!8797)

(assert (=> b!140613 (= e!93697 Unit!8802)))

(declare-fun b!140614 () Bool)

(declare-fun lt!218976 () Unit!8797)

(assert (=> b!140614 (= e!93697 lt!218976)))

(declare-fun lt!218981 () (_ BitVec 64))

(assert (=> b!140614 (= lt!218981 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218979 () (_ BitVec 64))

(assert (=> b!140614 (= lt!218979 (bitIndex!0 (size!2909 (buf!3330 thiss!1634)) (currentByte!6181 thiss!1634) (currentBit!6176 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6428 array!6428 (_ BitVec 64) (_ BitVec 64)) Unit!8797)

(assert (=> b!140614 (= lt!218976 (arrayBitRangesEqSymmetric!0 (buf!3330 thiss!1634) (buf!3330 (_2!6494 lt!218760)) lt!218981 lt!218979))))

(declare-fun arrayBitRangesEq!0 (array!6428 array!6428 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!140614 (arrayBitRangesEq!0 (buf!3330 (_2!6494 lt!218760)) (buf!3330 thiss!1634) lt!218981 lt!218979)))

(declare-fun d!45326 () Bool)

(assert (=> d!45326 e!93696))

(declare-fun res!117232 () Bool)

(assert (=> d!45326 (=> (not res!117232) (not e!93696))))

(assert (=> d!45326 (= res!117232 (isPrefixOf!0 (_1!6496 lt!218977) (_2!6496 lt!218977)))))

(declare-fun lt!218968 () BitStream!5076)

(assert (=> d!45326 (= lt!218977 (tuple2!12333 lt!218968 (_2!6494 lt!218760)))))

(declare-fun lt!218967 () Unit!8797)

(declare-fun lt!218966 () Unit!8797)

(assert (=> d!45326 (= lt!218967 lt!218966)))

(assert (=> d!45326 (isPrefixOf!0 lt!218968 (_2!6494 lt!218760))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5076 BitStream!5076 BitStream!5076) Unit!8797)

(assert (=> d!45326 (= lt!218966 (lemmaIsPrefixTransitive!0 lt!218968 (_2!6494 lt!218760) (_2!6494 lt!218760)))))

(declare-fun lt!218970 () Unit!8797)

(declare-fun lt!218983 () Unit!8797)

(assert (=> d!45326 (= lt!218970 lt!218983)))

(assert (=> d!45326 (isPrefixOf!0 lt!218968 (_2!6494 lt!218760))))

(assert (=> d!45326 (= lt!218983 (lemmaIsPrefixTransitive!0 lt!218968 thiss!1634 (_2!6494 lt!218760)))))

(declare-fun lt!218969 () Unit!8797)

(assert (=> d!45326 (= lt!218969 e!93697)))

(declare-fun c!7799 () Bool)

(assert (=> d!45326 (= c!7799 (not (= (size!2909 (buf!3330 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!218978 () Unit!8797)

(declare-fun lt!218965 () Unit!8797)

(assert (=> d!45326 (= lt!218978 lt!218965)))

(assert (=> d!45326 (isPrefixOf!0 (_2!6494 lt!218760) (_2!6494 lt!218760))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5076) Unit!8797)

(assert (=> d!45326 (= lt!218965 (lemmaIsPrefixRefl!0 (_2!6494 lt!218760)))))

(declare-fun lt!218982 () Unit!8797)

(declare-fun lt!218984 () Unit!8797)

(assert (=> d!45326 (= lt!218982 lt!218984)))

(assert (=> d!45326 (= lt!218984 (lemmaIsPrefixRefl!0 (_2!6494 lt!218760)))))

(declare-fun lt!218980 () Unit!8797)

(declare-fun lt!218972 () Unit!8797)

(assert (=> d!45326 (= lt!218980 lt!218972)))

(assert (=> d!45326 (isPrefixOf!0 lt!218968 lt!218968)))

(assert (=> d!45326 (= lt!218972 (lemmaIsPrefixRefl!0 lt!218968))))

(declare-fun lt!218975 () Unit!8797)

(declare-fun lt!218974 () Unit!8797)

(assert (=> d!45326 (= lt!218975 lt!218974)))

(assert (=> d!45326 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45326 (= lt!218974 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45326 (= lt!218968 (BitStream!5077 (buf!3330 (_2!6494 lt!218760)) (currentByte!6181 thiss!1634) (currentBit!6176 thiss!1634)))))

(assert (=> d!45326 (isPrefixOf!0 thiss!1634 (_2!6494 lt!218760))))

(assert (=> d!45326 (= (reader!0 thiss!1634 (_2!6494 lt!218760)) lt!218977)))

(assert (= (and d!45326 c!7799) b!140614))

(assert (= (and d!45326 (not c!7799)) b!140613))

(assert (= (and d!45326 res!117232) b!140610))

(assert (= (and b!140610 res!117233) b!140612))

(assert (= (and b!140612 res!117234) b!140611))

(declare-fun m!216423 () Bool)

(assert (=> b!140612 m!216423))

(declare-fun m!216427 () Bool)

(assert (=> b!140610 m!216427))

(declare-fun m!216431 () Bool)

(assert (=> b!140611 m!216431))

(assert (=> b!140611 m!216317))

(assert (=> b!140611 m!216319))

(declare-fun m!216433 () Bool)

(assert (=> d!45326 m!216433))

(declare-fun m!216435 () Bool)

(assert (=> d!45326 m!216435))

(declare-fun m!216437 () Bool)

(assert (=> d!45326 m!216437))

(declare-fun m!216439 () Bool)

(assert (=> d!45326 m!216439))

(declare-fun m!216441 () Bool)

(assert (=> d!45326 m!216441))

(declare-fun m!216443 () Bool)

(assert (=> d!45326 m!216443))

(declare-fun m!216445 () Bool)

(assert (=> d!45326 m!216445))

(declare-fun m!216447 () Bool)

(assert (=> d!45326 m!216447))

(assert (=> d!45326 m!216307))

(declare-fun m!216449 () Bool)

(assert (=> d!45326 m!216449))

(declare-fun m!216451 () Bool)

(assert (=> d!45326 m!216451))

(assert (=> b!140614 m!216319))

(declare-fun m!216453 () Bool)

(assert (=> b!140614 m!216453))

(declare-fun m!216455 () Bool)

(assert (=> b!140614 m!216455))

(assert (=> b!140527 d!45326))

(declare-fun d!45332 () Bool)

(assert (=> d!45332 (= (array_inv!2698 (buf!3330 thiss!1634)) (bvsge (size!2909 (buf!3330 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!140521 d!45332))

(assert (=> b!140526 d!45302))

(declare-fun d!45334 () Bool)

(declare-fun e!93707 () Bool)

(assert (=> d!45334 e!93707))

(declare-fun res!117257 () Bool)

(assert (=> d!45334 (=> (not res!117257) (not e!93707))))

(declare-fun lt!219041 () tuple2!12328)

(assert (=> d!45334 (= res!117257 (= (size!2909 (buf!3330 thiss!1634)) (size!2909 (buf!3330 (_2!6494 lt!219041)))))))

(declare-fun choose!6 (BitStream!5076 (_ BitVec 8)) tuple2!12328)

(assert (=> d!45334 (= lt!219041 (choose!6 thiss!1634 (select (arr!3616 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45334 (validate_offset_byte!0 ((_ sign_extend 32) (size!2909 (buf!3330 thiss!1634))) ((_ sign_extend 32) (currentByte!6181 thiss!1634)) ((_ sign_extend 32) (currentBit!6176 thiss!1634)))))

(assert (=> d!45334 (= (appendByte!0 thiss!1634 (select (arr!3616 arr!237) from!447)) lt!219041)))

(declare-fun b!140635 () Bool)

(declare-fun res!117255 () Bool)

(assert (=> b!140635 (=> (not res!117255) (not e!93707))))

(declare-fun lt!219039 () (_ BitVec 64))

(declare-fun lt!219040 () (_ BitVec 64))

(assert (=> b!140635 (= res!117255 (= (bitIndex!0 (size!2909 (buf!3330 (_2!6494 lt!219041))) (currentByte!6181 (_2!6494 lt!219041)) (currentBit!6176 (_2!6494 lt!219041))) (bvadd lt!219040 lt!219039)))))

(assert (=> b!140635 (or (not (= (bvand lt!219040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219039 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!219040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!219040 lt!219039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!140635 (= lt!219039 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!140635 (= lt!219040 (bitIndex!0 (size!2909 (buf!3330 thiss!1634)) (currentByte!6181 thiss!1634) (currentBit!6176 thiss!1634)))))

(declare-fun b!140636 () Bool)

(declare-fun res!117256 () Bool)

(assert (=> b!140636 (=> (not res!117256) (not e!93707))))

(assert (=> b!140636 (= res!117256 (isPrefixOf!0 thiss!1634 (_2!6494 lt!219041)))))

(declare-fun b!140637 () Bool)

(declare-fun lt!219038 () tuple2!12332)

(declare-fun lt!219037 () tuple2!12330)

(assert (=> b!140637 (= e!93707 (and (= (_2!6495 lt!219037) (select (arr!3616 arr!237) from!447)) (= (_1!6495 lt!219037) (_2!6496 lt!219038))))))

(assert (=> b!140637 (= lt!219037 (readBytePure!0 (_1!6496 lt!219038)))))

(assert (=> b!140637 (= lt!219038 (reader!0 thiss!1634 (_2!6494 lt!219041)))))

(assert (= (and d!45334 res!117257) b!140635))

(assert (= (and b!140635 res!117255) b!140636))

(assert (= (and b!140636 res!117256) b!140637))

(assert (=> d!45334 m!216321))

(declare-fun m!216469 () Bool)

(assert (=> d!45334 m!216469))

(declare-fun m!216471 () Bool)

(assert (=> d!45334 m!216471))

(declare-fun m!216473 () Bool)

(assert (=> b!140635 m!216473))

(assert (=> b!140635 m!216319))

(declare-fun m!216475 () Bool)

(assert (=> b!140636 m!216475))

(declare-fun m!216477 () Bool)

(assert (=> b!140637 m!216477))

(declare-fun m!216479 () Bool)

(assert (=> b!140637 m!216479))

(assert (=> b!140526 d!45334))

(declare-fun d!45350 () Bool)

(assert (=> d!45350 (= (invariant!0 (currentBit!6176 thiss!1634) (currentByte!6181 thiss!1634) (size!2909 (buf!3330 thiss!1634))) (and (bvsge (currentBit!6176 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6176 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6181 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6181 thiss!1634) (size!2909 (buf!3330 thiss!1634))) (and (= (currentBit!6176 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6181 thiss!1634) (size!2909 (buf!3330 thiss!1634)))))))))

(assert (=> b!140525 d!45350))

(declare-fun d!45352 () Bool)

(declare-fun res!117265 () Bool)

(declare-fun e!93713 () Bool)

(assert (=> d!45352 (=> (not res!117265) (not e!93713))))

(assert (=> d!45352 (= res!117265 (= (size!2909 (buf!3330 thiss!1634)) (size!2909 (buf!3330 (_2!6494 lt!218760)))))))

(assert (=> d!45352 (= (isPrefixOf!0 thiss!1634 (_2!6494 lt!218760)) e!93713)))

(declare-fun b!140644 () Bool)

(declare-fun res!117264 () Bool)

(assert (=> b!140644 (=> (not res!117264) (not e!93713))))

(assert (=> b!140644 (= res!117264 (bvsle (bitIndex!0 (size!2909 (buf!3330 thiss!1634)) (currentByte!6181 thiss!1634) (currentBit!6176 thiss!1634)) (bitIndex!0 (size!2909 (buf!3330 (_2!6494 lt!218760))) (currentByte!6181 (_2!6494 lt!218760)) (currentBit!6176 (_2!6494 lt!218760)))))))

(declare-fun b!140645 () Bool)

(declare-fun e!93712 () Bool)

(assert (=> b!140645 (= e!93713 e!93712)))

(declare-fun res!117266 () Bool)

(assert (=> b!140645 (=> res!117266 e!93712)))

(assert (=> b!140645 (= res!117266 (= (size!2909 (buf!3330 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!140646 () Bool)

(assert (=> b!140646 (= e!93712 (arrayBitRangesEq!0 (buf!3330 thiss!1634) (buf!3330 (_2!6494 lt!218760)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2909 (buf!3330 thiss!1634)) (currentByte!6181 thiss!1634) (currentBit!6176 thiss!1634))))))

(assert (= (and d!45352 res!117265) b!140644))

(assert (= (and b!140644 res!117264) b!140645))

(assert (= (and b!140645 (not res!117266)) b!140646))

(assert (=> b!140644 m!216319))

(assert (=> b!140644 m!216317))

(assert (=> b!140646 m!216319))

(assert (=> b!140646 m!216319))

(declare-fun m!216481 () Bool)

(assert (=> b!140646 m!216481))

(assert (=> b!140523 d!45352))

(declare-fun d!45354 () Bool)

(assert (=> d!45354 (= (array_inv!2698 arr!237) (bvsge (size!2909 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27362 d!45354))

(declare-fun d!45356 () Bool)

(assert (=> d!45356 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6176 thiss!1634) (currentByte!6181 thiss!1634) (size!2909 (buf!3330 thiss!1634))))))

(declare-fun bs!11123 () Bool)

(assert (= bs!11123 d!45356))

(assert (=> bs!11123 m!216305))

(assert (=> start!27362 d!45356))

(declare-fun d!45358 () Bool)

(assert (=> d!45358 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2909 (buf!3330 thiss!1634))) ((_ sign_extend 32) (currentByte!6181 thiss!1634)) ((_ sign_extend 32) (currentBit!6176 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2909 (buf!3330 thiss!1634))) ((_ sign_extend 32) (currentByte!6181 thiss!1634)) ((_ sign_extend 32) (currentBit!6176 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11124 () Bool)

(assert (= bs!11124 d!45358))

(assert (=> bs!11124 m!216359))

(assert (=> b!140528 d!45358))

(check-sat (not b!140646) (not d!45326) (not d!45358) (not b!140635) (not d!45318) (not b!140611) (not d!45356) (not b!140610) (not b!140636) (not b!140612) (not b!140614) (not d!45334) (not b!140637) (not d!45320) (not d!45302) (not b!140644))
